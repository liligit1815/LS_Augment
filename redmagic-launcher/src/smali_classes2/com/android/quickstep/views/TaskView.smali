.class public Lcom/android/quickstep/views/TaskView;
.super Landroid/widget/FrameLayout;
.source "TaskView.kt"

# interfaces
.implements Lcom/android/launcher3/util/b3$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/TaskView$Companion;,
        Lcom/android/quickstep/views/TaskView$TaskDataChanges;
    }
.end annotation


# static fields
.field static final synthetic $$delegatedProperties:[LB4/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "LB4/i<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final APP_LOCKED:I = 0x1

.field public static final APP_UNLOCKED:I = 0x0

.field public static final Companion:Lcom/android/quickstep/views/TaskView$Companion;

.field private static final DIM_ANIM_DURATION:J = 0x2bcL

.field public static final DISMISS_SCALE:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static final DISMISS_TRANSLATION_X:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static final DISMISS_TRANSLATION_Y:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field public static final FADE_IN_ICON_DURATION:J = 0x78L

.field private static final FADE_IN_ICON_INTERPOLATOR:Landroid/view/animation/Interpolator;

.field public static final FLAG_UPDATE_ALL:I = 0x7

.field public static final FLAG_UPDATE_CORNER_RADIUS:I = 0x4

.field public static final FLAG_UPDATE_ICON:I = 0x1

.field public static final FLAG_UPDATE_THUMBNAIL:I = 0x2

.field public static final FOCUS_TRANSITION:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field public static final GRID_END_TRANSLATION_X:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field public static final GRID_END_TRANSLATION_Y:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field public static final ICON_DISPLAY_DURATION:J = 0x12cL

.field public static final MAX_PAGE_SCRIM_ALPHA:F = 0.4f

.field public static final SETTLED_PROGRESS:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static final SETTLED_PROGRESS_DISMISS:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static final SETTLED_PROGRESS_FAST_OUT_INTERPOLATOR:Landroid/view/animation/Interpolator;

.field private static final SETTLED_PROGRESS_GESTURE:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static final SETTLE_TRANSITION_THRESHOLD:F = 0.17142858f

.field public static final SPLIT_ALPHA:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static final SPLIT_SELECT_TRANSLATION_X:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static final SPLIT_SELECT_TRANSLATION_Y:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static final SYSTEM_GESTURE_EXCLUSION_RECT:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field protected static final TAG:Ljava/lang/String; = "TaskView"

.field private static final TASK_OFFSET_TRANSLATION_X:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static final TASK_OFFSET_TRANSLATION_Y:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static final TASK_RESISTANCE_TRANSLATION_X:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static final TASK_RESISTANCE_TRANSLATION_Y:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field public static final WECHAT_PACKAGE_NAME:Ljava/lang/String; = "com.tencent.mm"

.field public static final WECHAT_PACKAGE_PLUGIN_IDENTIFIER:Ljava/lang/String; = "plugin.appbrand.ui.AppBrandUI"


# instance fields
.field private final ALPHA_DISABLE:I

.field private final ALPHA_ENABLE:I

.field private final GRID_TO_SINGLE_DEFAULT_SCALE:F

.field private final SHOW_TITLE:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private final attachAlpha$delegate:Lcom/android/launcher3/util/u1;

.field private borderEnabled:Z

.field private boxTranslationY:F

.field private final container:Lcom/android/quickstep/views/RecentsViewContainer;

.field private final coroutineJobs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LF4/u0;",
            ">;"
        }
    .end annotation
.end field

.field private final coroutineScope$delegate:Lh4/e;

.field private dismissScale:F

.field private dismissTranslationX:F

.field private dismissTranslationY:F

.field private final dispatcherProvider$delegate:Lh4/e;

.field private final focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

.field private fullscreenProgress:F

.field private gridEndTranslationX:F

.field private gridEndTranslationY:F

.field private gridProgress:F

.field private gridTranslationX:F

.field private gridTranslationY:F

.field private final hoverBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

.field private hoverBorderVisible:Z

.field private iconFadeInOnGestureCompleteAnimator:Landroid/animation/ObjectAnimator;

.field private isClickableAsLiveTile:Z

.field private isDoLocateAnim:Z

.field private isEndQuickSwitchCuj:Z

.field private final lastTouchDownPosition:Landroid/graphics/PointF;

.field private final mClickScaleAnimHelper:Lx1/v;

.field private final mDoInsects:Z

.field private mIconDrawable:Landroid/graphics/drawable/Drawable;

.field private mIsLockShown:Z

.field private mIsSkipContentAlphaChange:Z

.field private mIsSupportWindowResize:Z

.field private mIsTitleHidden:Z

.field private mLastColor:I

.field private mLockButton:Landroid/widget/ImageView;

.field private final mMFVTaskFocusIndicatorHelper:Lcom/android/launcher3/keyboard/b$a;

.field private mMenuButton:Landroid/widget/ImageView;

.field private final mMenuIconCenterCoordinate:[F

.field private mMenuIconTouchDelegate:Lcom/android/launcher3/util/L2;

.field private mMiniWindowButton:Landroid/widget/ImageView;

.field private final mMiniWindowIconCenterCoordinate:[F

.field private mMiniWindowIconTouchDelegate:Lcom/android/launcher3/util/L2;

.field private final mRemovingActions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mSplitScreenButton:Landroid/widget/ImageView;

.field private mSplitScreenGroupShortcutsItem:Lcom/android/launcher3/model/data/I;

.field private mSplitScreenShort:Lcom/android/launcher3/popup/P;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/popup/P<",
            "*>;"
        }
    .end annotation
.end field

.field private mTitleAnimator:Landroid/animation/ObjectAnimator;

.field private mhasLockButton:Z

.field private final modalAlpha$delegate:Lcom/android/launcher3/util/u1;

.field private modalPivot:Landroid/graphics/PointF;

.field private modalScale:F

.field private modalness:F

.field private nativeStackAlpha:F

.field private nativeStackActionAlpha:F

.field private nativeStackChromeInitialized:Z

.field private nativeStackEntryTargetTranslationX:F

.field private nativeStackEntryTargetTranslationY:F

.field private nativeStackEntryTranslationLocked:Z

.field private nativeStackClipHeight:I

.field private nativeStackClipRect:Landroid/graphics/Rect;

.field private nativeStackClipRight:I

.field private nativeStackScale:F

.field private nativeStackTranslationX:F

.field private nativeStackTranslationY:F

.field private nativeStackTitleAlpha:F

.field private nativeStableAlpha:F

.field private nonGridScale:F

.field private nonGridTranslationX:F

.field private final oldOrientation:I

.field public orientedState:Lcom/android/quickstep/util/RecentsOrientedState;

.field private final pendingIconLoadRequests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/w<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final pendingThumbnailLoadRequests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/w<",
            "*>;>;"
        }
    .end annotation
.end field

.field private resourceManagerProxy:Lcom/android/launcher3/resource/g0;

.field private settledProgress:F

.field private final settledProgressDismiss$delegate:Lcom/android/launcher3/util/u1;

.field private final settledProgressFullscreen$delegate:Lcom/android/launcher3/util/u1;

.field private final settledProgressGesture$delegate:Lcom/android/launcher3/util/u1;

.field private final settledProgressPropertyFactory:Lcom/android/launcher3/util/v1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private shouldShowScreenshot:Z

.field private final splitAlpha$delegate:Lcom/android/launcher3/util/u1;

.field private splitButtonVisible:Z

.field private splitSelectTranslationX:F

.field private splitSelectTranslationY:F

.field private splitSplashAlpha:F

.field private final stableAlpha$delegate:Lcom/android/launcher3/util/u1;

.field private sysUiStatusNavFlags:I

.field protected taskContainers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/quickstep/views/TaskContainer;",
            ">;"
        }
    .end annotation
.end field

.field private taskOffsetTranslationX:F

.field private taskOffsetTranslationY:F

.field private taskResistanceTranslationX:F

.field private taskResistanceTranslationY:F

.field private taskThumbnailSplashAlpha:F

.field private final taskViewAlpha:Lcom/android/launcher3/util/B1;

.field private taskViewId:I

.field private final tempCoordinates:[F

.field private thumbnailBounds:Landroid/graphics/Rect;

.field private final thumbnailFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

.field private final type:Lcom/android/quickstep/views/TaskViewType;

.field private viewModel:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    new-instance v0, Lkotlin/jvm/internal/r;

    .line 2
    .line 3
    const-class v1, Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    const-string v2, "stableAlpha"

    .line 6
    .line 7
    const-string v3, "getStableAlpha()F"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v0, v1, v2, v3, v4}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Lkotlin/jvm/internal/D;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v2, Lkotlin/jvm/internal/r;

    .line 18
    .line 19
    const-string v3, "attachAlpha"

    .line 20
    .line 21
    const-string v5, "getAttachAlpha()F"

    .line 22
    .line 23
    invoke-direct {v2, v1, v3, v5, v4}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v2}, Lkotlin/jvm/internal/D;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Lkotlin/jvm/internal/r;

    .line 31
    .line 32
    const-string v5, "splitAlpha"

    .line 33
    .line 34
    const-string v6, "getSplitAlpha()F"

    .line 35
    .line 36
    invoke-direct {v3, v1, v5, v6, v4}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    invoke-static {v3}, Lkotlin/jvm/internal/D;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    new-instance v5, Lkotlin/jvm/internal/r;

    .line 44
    .line 45
    const-string v6, "modalAlpha"

    .line 46
    .line 47
    const-string v7, "getModalAlpha()F"

    .line 48
    .line 49
    invoke-direct {v5, v1, v6, v7, v4}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    invoke-static {v5}, Lkotlin/jvm/internal/D;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    new-instance v6, Lkotlin/jvm/internal/r;

    .line 57
    .line 58
    const-string v7, "settledProgressFullscreen"

    .line 59
    .line 60
    const-string v8, "getSettledProgressFullscreen()F"

    .line 61
    .line 62
    invoke-direct {v6, v1, v7, v8, v4}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    invoke-static {v6}, Lkotlin/jvm/internal/D;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    new-instance v7, Lkotlin/jvm/internal/r;

    .line 70
    .line 71
    const-string v8, "settledProgressGesture"

    .line 72
    .line 73
    const-string v9, "getSettledProgressGesture()F"

    .line 74
    .line 75
    invoke-direct {v7, v1, v8, v9, v4}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    invoke-static {v7}, Lkotlin/jvm/internal/D;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    new-instance v8, Lkotlin/jvm/internal/r;

    .line 83
    .line 84
    const-string v9, "settledProgressDismiss"

    .line 85
    .line 86
    const-string v10, "getSettledProgressDismiss()F"

    .line 87
    .line 88
    invoke-direct {v8, v1, v9, v10, v4}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 89
    .line 90
    .line 91
    invoke-static {v8}, Lkotlin/jvm/internal/D;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const/4 v8, 0x7

    .line 96
    new-array v8, v8, [LB4/i;

    .line 97
    .line 98
    aput-object v0, v8, v4

    .line 99
    .line 100
    const/4 v0, 0x1

    .line 101
    aput-object v2, v8, v0

    .line 102
    .line 103
    const/4 v0, 0x2

    .line 104
    aput-object v3, v8, v0

    .line 105
    .line 106
    const/4 v0, 0x3

    .line 107
    aput-object v5, v8, v0

    .line 108
    .line 109
    const/4 v0, 0x4

    .line 110
    aput-object v6, v8, v0

    .line 111
    .line 112
    const/4 v0, 0x5

    .line 113
    aput-object v7, v8, v0

    .line 114
    .line 115
    const/4 v0, 0x6

    .line 116
    aput-object v1, v8, v0

    .line 117
    .line 118
    sput-object v8, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 119
    .line 120
    new-instance v0, Lcom/android/quickstep/views/TaskView$Companion;

    .line 121
    .line 122
    const/4 v1, 0x0

    .line 123
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/TaskView$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 124
    .line 125
    .line 126
    sput-object v0, Lcom/android/quickstep/views/TaskView;->Companion:Lcom/android/quickstep/views/TaskView$Companion;

    .line 127
    .line 128
    sget-object v0, LJ0/h;->r:Landroid/view/animation/Interpolator;

    .line 129
    .line 130
    const v1, 0x3f541d42

    .line 131
    .line 132
    .line 133
    const/high16 v2, 0x3f800000    # 1.0f

    .line 134
    .line 135
    invoke-static {v0, v1, v2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    sput-object v0, Lcom/android/quickstep/views/TaskView;->SETTLED_PROGRESS_FAST_OUT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 143
    .line 144
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 145
    .line 146
    sput-object v0, Lcom/android/quickstep/views/TaskView;->FADE_IN_ICON_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 147
    .line 148
    new-instance v0, Landroid/graphics/Rect;

    .line 149
    .line 150
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-static {v0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    sput-object v0, Lcom/android/quickstep/views/TaskView;->SYSTEM_GESTURE_EXCLUSION_RECT:Ljava/util/List;

    .line 158
    .line 159
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 160
    .line 161
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$SETTLED_PROGRESS$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$SETTLED_PROGRESS$1;

    .line 162
    .line 163
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 164
    .line 165
    .line 166
    sput-object v0, Lcom/android/quickstep/views/TaskView;->SETTLED_PROGRESS:Landroid/util/FloatProperty;

    .line 167
    .line 168
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 169
    .line 170
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$SETTLED_PROGRESS_GESTURE$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$SETTLED_PROGRESS_GESTURE$1;

    .line 171
    .line 172
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 173
    .line 174
    .line 175
    sput-object v0, Lcom/android/quickstep/views/TaskView;->SETTLED_PROGRESS_GESTURE:Landroid/util/FloatProperty;

    .line 176
    .line 177
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 178
    .line 179
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$SETTLED_PROGRESS_DISMISS$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$SETTLED_PROGRESS_DISMISS$1;

    .line 180
    .line 181
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 182
    .line 183
    .line 184
    sput-object v0, Lcom/android/quickstep/views/TaskView;->SETTLED_PROGRESS_DISMISS:Landroid/util/FloatProperty;

    .line 185
    .line 186
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 187
    .line 188
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$SPLIT_SELECT_TRANSLATION_X$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$SPLIT_SELECT_TRANSLATION_X$1;

    .line 189
    .line 190
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 191
    .line 192
    .line 193
    sput-object v0, Lcom/android/quickstep/views/TaskView;->SPLIT_SELECT_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 194
    .line 195
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 196
    .line 197
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$SPLIT_SELECT_TRANSLATION_Y$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$SPLIT_SELECT_TRANSLATION_Y$1;

    .line 198
    .line 199
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 200
    .line 201
    .line 202
    sput-object v0, Lcom/android/quickstep/views/TaskView;->SPLIT_SELECT_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 203
    .line 204
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 205
    .line 206
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$DISMISS_TRANSLATION_X$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$DISMISS_TRANSLATION_X$1;

    .line 207
    .line 208
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 209
    .line 210
    .line 211
    sput-object v0, Lcom/android/quickstep/views/TaskView;->DISMISS_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 212
    .line 213
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 214
    .line 215
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$DISMISS_TRANSLATION_Y$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$DISMISS_TRANSLATION_Y$1;

    .line 216
    .line 217
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 218
    .line 219
    .line 220
    sput-object v0, Lcom/android/quickstep/views/TaskView;->DISMISS_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 221
    .line 222
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 223
    .line 224
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$TASK_OFFSET_TRANSLATION_X$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$TASK_OFFSET_TRANSLATION_X$1;

    .line 225
    .line 226
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 227
    .line 228
    .line 229
    sput-object v0, Lcom/android/quickstep/views/TaskView;->TASK_OFFSET_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 230
    .line 231
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 232
    .line 233
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$TASK_OFFSET_TRANSLATION_Y$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$TASK_OFFSET_TRANSLATION_Y$1;

    .line 234
    .line 235
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 236
    .line 237
    .line 238
    sput-object v0, Lcom/android/quickstep/views/TaskView;->TASK_OFFSET_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 239
    .line 240
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 241
    .line 242
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$TASK_RESISTANCE_TRANSLATION_X$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$TASK_RESISTANCE_TRANSLATION_X$1;

    .line 243
    .line 244
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 245
    .line 246
    .line 247
    sput-object v0, Lcom/android/quickstep/views/TaskView;->TASK_RESISTANCE_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 248
    .line 249
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 250
    .line 251
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$TASK_RESISTANCE_TRANSLATION_Y$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$TASK_RESISTANCE_TRANSLATION_Y$1;

    .line 252
    .line 253
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 254
    .line 255
    .line 256
    sput-object v0, Lcom/android/quickstep/views/TaskView;->TASK_RESISTANCE_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 257
    .line 258
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 259
    .line 260
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$GRID_END_TRANSLATION_X$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$GRID_END_TRANSLATION_X$1;

    .line 261
    .line 262
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 263
    .line 264
    .line 265
    sput-object v0, Lcom/android/quickstep/views/TaskView;->GRID_END_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 266
    .line 267
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 268
    .line 269
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$DISMISS_SCALE$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$DISMISS_SCALE$1;

    .line 270
    .line 271
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 272
    .line 273
    .line 274
    sput-object v0, Lcom/android/quickstep/views/TaskView;->DISMISS_SCALE:Landroid/util/FloatProperty;

    .line 275
    .line 276
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 277
    .line 278
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$SPLIT_ALPHA$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$SPLIT_ALPHA$1;

    .line 279
    .line 280
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 281
    .line 282
    .line 283
    sput-object v0, Lcom/android/quickstep/views/TaskView;->SPLIT_ALPHA:Landroid/util/FloatProperty;

    .line 284
    .line 285
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 286
    .line 287
    sget-object v1, Lcom/android/quickstep/views/TaskView$Companion$GRID_END_TRANSLATION_Y$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$GRID_END_TRANSLATION_Y$1;

    .line 288
    .line 289
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 290
    .line 291
    .line 292
    sput-object v0, Lcom/android/quickstep/views/TaskView;->GRID_END_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 293
    .line 294
    new-instance v0, Lcom/android/quickstep/views/TaskView$Companion$FOCUS_TRANSITION$1;

    .line 295
    .line 296
    invoke-direct {v0}, Lcom/android/quickstep/views/TaskView$Companion$FOCUS_TRANSITION$1;-><init>()V

    .line 297
    .line 298
    .line 299
    sput-object v0, Lcom/android/quickstep/views/TaskView;->FOCUS_TRANSITION:Landroid/util/FloatProperty;

    .line 300
    .line 301
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 12

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v10, 0xfe

    const/4 v11, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v11}, Lcom/android/quickstep/views/TaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12

    .line 2
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v10, 0xfc

    const/4 v11, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v11}, Lcom/android/quickstep/views/TaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 12

    .line 3
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v10, 0xf8

    const/4 v11, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    invoke-direct/range {v1 .. v11}, Lcom/android/quickstep/views/TaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 12

    .line 4
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v10, 0xf0

    const/4 v11, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move/from16 v5, p4

    invoke-direct/range {v1 .. v11}, Lcom/android/quickstep/views/TaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;)V
    .locals 12

    .line 5
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v10, 0xe0

    const/4 v11, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    invoke-direct/range {v1 .. v11}, Lcom/android/quickstep/views/TaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;)V
    .locals 12

    .line 6
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v10, 0xc0

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    invoke-direct/range {v1 .. v11}, Lcom/android/quickstep/views/TaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;)V
    .locals 12

    .line 7
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "type"

    move-object/from16 v8, p7

    invoke-static {v8, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v10, 0x80

    const/4 v11, 0x0

    const/4 v9, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    invoke-direct/range {v1 .. v11}, Lcom/android/quickstep/views/TaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;)V
    .locals 19

    move-object/from16 v4, p0

    move-object/from16 v13, p1

    move-object/from16 v14, p2

    move/from16 v15, p3

    move/from16 v0, p4

    move-object/from16 v1, p7

    move-object/from16 v2, p8

    const-string v3, "context"

    invoke-static {v13, v3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "type"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "thumbnailFullscreenParams"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    invoke-direct/range {p0 .. p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->type:Lcom/android/quickstep/views/TaskViewType;

    .line 13
    iput-object v2, v4, Lcom/android/quickstep/views/TaskView;->thumbnailFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 14
    invoke-static {v13}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/quickstep/views/RecentsViewContainer;

    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 15
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->lastTouchDownPosition:Landroid/graphics/PointF;

    const/4 v1, 0x2

    .line 16
    new-array v2, v1, [F

    iput-object v2, v4, Lcom/android/quickstep/views/TaskView;->tempCoordinates:[F

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-nez p5, :cond_0

    .line 17
    sget-object v5, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    .line 18
    invoke-static {v13}, Lcom/android/quickstep/util/TaskCornerRadius;->get(Landroid/content/Context;)F

    move-result v6

    float-to-int v6, v6

    .line 19
    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0704eb

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    .line 20
    new-instance v8, Lcom/android/quickstep/views/TaskView$focusBorderAnimator$1;

    invoke-direct {v8, v4}, Lcom/android/quickstep/views/TaskView$focusBorderAnimator$1;-><init>(Ljava/lang/Object;)V

    .line 21
    sget-object v9, Lcom/android/launcher3/x5;->s3:[I

    invoke-virtual {v13, v14, v9, v15, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v9

    .line 22
    invoke-virtual {v9, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v9

    const/16 v11, 0xe0

    const/4 v12, 0x0

    move v10, v1

    move/from16 v16, v2

    move v1, v6

    move v2, v7

    const-wide/16 v6, 0x0

    move/from16 v17, v3

    move-object v0, v5

    move-object v3, v8

    move v5, v9

    const-wide/16 v8, 0x0

    move/from16 v18, v10

    const/4 v10, 0x0

    .line 23
    invoke-static/range {v0 .. v12}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object/from16 v0, p5

    .line 24
    :goto_0
    iput-object v0, v4, Lcom/android/quickstep/views/TaskView;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    const/4 v0, 0x0

    if-nez p6, :cond_2

    .line 25
    invoke-static {}, Lcom/android/launcher3/y0;->k()Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v1, v0

    .line 26
    sget-object v0, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    .line 27
    invoke-static {v13}, Lcom/android/quickstep/util/TaskCornerRadius;->get(Landroid/content/Context;)F

    move-result v2

    float-to-int v2, v2

    .line 28
    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v5, 0x7f070b15

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    move-object v5, v1

    move v1, v2

    move v2, v3

    .line 29
    new-instance v3, Lcom/android/quickstep/views/TaskView$hoverBorderAnimator$1;

    invoke-direct {v3, v4}, Lcom/android/quickstep/views/TaskView$hoverBorderAnimator$1;-><init>(Ljava/lang/Object;)V

    .line 30
    sget-object v6, Lcom/android/launcher3/x5;->s3:[I

    move/from16 v7, p4

    .line 31
    invoke-virtual {v13, v14, v6, v15, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v6

    const/4 v13, 0x2

    const/4 v14, -0x1

    .line 32
    invoke-virtual {v6, v13, v14}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    const/16 v11, 0xe0

    const/4 v12, 0x0

    move-object v8, v5

    move v5, v6

    const-wide/16 v6, 0x0

    move-object v10, v8

    const-wide/16 v8, 0x0

    move-object v15, v10

    const/4 v10, 0x0

    .line 33
    invoke-static/range {v0 .. v12}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object v0

    goto :goto_1

    :cond_1
    move-object v15, v0

    const/4 v13, 0x2

    const/4 v14, -0x1

    goto :goto_1

    :cond_2
    move-object v15, v0

    const/4 v13, 0x2

    const/4 v14, -0x1

    move-object/from16 v0, p6

    .line 34
    :goto_1
    iput-object v0, v4, Lcom/android/quickstep/views/TaskView;->hoverBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 35
    iput v14, v4, Lcom/android/quickstep/views/TaskView;->taskViewId:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 36
    iput v0, v4, Lcom/android/quickstep/views/TaskView;->nonGridScale:F

    .line 37
    iput v0, v4, Lcom/android/quickstep/views/TaskView;->dismissScale:F

    .line 38
    iput v0, v4, Lcom/android/quickstep/views/TaskView;->modalScale:F

    iput v0, v4, Lcom/android/quickstep/views/TaskView;->nativeStackScale:F

    iput v0, v4, Lcom/android/quickstep/views/TaskView;->nativeStackAlpha:F

    iput v0, v4, Lcom/android/quickstep/views/TaskView;->nativeStableAlpha:F

    const/4 v1, -0x1

    iput v1, v4, Lcom/android/quickstep/views/TaskView;->nativeStackClipRight:I

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->nativeStackClipRect:Landroid/graphics/Rect;

    .line 39
    new-instance v1, Lcom/android/launcher3/util/B1;

    invoke-static {}, Lcom/android/quickstep/views/TaskView$Companion$Alpha;->getEntries()Ln4/a;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v4, v2}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->taskViewAlpha:Lcom/android/launcher3/util/B1;

    .line 40
    new-instance v2, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/TaskView$Companion$Alpha;->Stable:Lcom/android/quickstep/views/TaskView$Companion$Alpha;

    invoke-direct {v2, v1, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v2, v4, Lcom/android/quickstep/views/TaskView;->stableAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 41
    new-instance v2, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/TaskView$Companion$Alpha;->Attach:Lcom/android/quickstep/views/TaskView$Companion$Alpha;

    invoke-direct {v2, v1, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v2, v4, Lcom/android/quickstep/views/TaskView;->attachAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 42
    new-instance v2, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/TaskView$Companion$Alpha;->Split:Lcom/android/quickstep/views/TaskView$Companion$Alpha;

    invoke-direct {v2, v1, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v2, v4, Lcom/android/quickstep/views/TaskView;->splitAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 43
    new-instance v2, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/TaskView$Companion$Alpha;->Modal:Lcom/android/quickstep/views/TaskView$Companion$Alpha;

    invoke-direct {v2, v1, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v2, v4, Lcom/android/quickstep/views/TaskView;->modalAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 44
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->thumbnailBounds:Landroid/graphics/Rect;

    .line 45
    iput v0, v4, Lcom/android/quickstep/views/TaskView;->settledProgress:F

    .line 46
    new-instance v0, Lcom/android/launcher3/util/v1;

    .line 47
    sget-object v1, Lcom/android/quickstep/views/TaskView;->SETTLED_PROGRESS:Landroid/util/FloatProperty;

    .line 48
    invoke-static {}, Lcom/android/quickstep/views/TaskView$Companion$SettledProgress;->getEntries()Ln4/a;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    .line 49
    new-instance v3, Lcom/android/quickstep/views/C2;

    invoke-direct {v3}, Lcom/android/quickstep/views/C2;-><init>()V

    const/high16 v5, 0x3f800000    # 1.0f

    move-object/from16 p1, v0

    move-object/from16 p3, v1

    move/from16 p4, v2

    move-object/from16 p5, v3

    move-object/from16 p2, v4

    move/from16 p6, v5

    .line 50
    invoke-direct/range {p1 .. p6}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;F)V

    iput-object v0, v4, Lcom/android/quickstep/views/TaskView;->settledProgressPropertyFactory:Lcom/android/launcher3/util/v1;

    .line 51
    new-instance v1, Lcom/android/launcher3/util/u1;

    sget-object v2, Lcom/android/quickstep/views/TaskView$Companion$SettledProgress;->Fullscreen:Lcom/android/quickstep/views/TaskView$Companion$SettledProgress;

    invoke-direct {v1, v0, v2}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->settledProgressFullscreen$delegate:Lcom/android/launcher3/util/u1;

    .line 52
    new-instance v1, Lcom/android/launcher3/util/u1;

    sget-object v2, Lcom/android/quickstep/views/TaskView$Companion$SettledProgress;->Gesture:Lcom/android/quickstep/views/TaskView$Companion$SettledProgress;

    invoke-direct {v1, v0, v2}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->settledProgressGesture$delegate:Lcom/android/launcher3/util/u1;

    .line 53
    new-instance v1, Lcom/android/launcher3/util/u1;

    sget-object v2, Lcom/android/quickstep/views/TaskView$Companion$SettledProgress;->Dismiss:Lcom/android/quickstep/views/TaskView$Companion$SettledProgress;

    invoke-direct {v1, v0, v2}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->settledProgressDismiss$delegate:Lcom/android/launcher3/util/u1;

    .line 54
    sget-object v0, Lcom/android/quickstep/recents/di/RecentsDependencies;->Companion:Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;

    const/4 v1, 0x0

    new-array v2, v1, [Lh4/l;

    .line 55
    new-instance v3, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$1;

    const-string v5, ""

    invoke-direct {v3, v0, v5, v2, v15}, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$1;-><init>(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;[Lh4/l;Lu4/l;)V

    invoke-static {v3}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object v2

    .line 56
    iput-object v2, v4, Lcom/android/quickstep/views/TaskView;->dispatcherProvider$delegate:Lh4/e;

    .line 57
    new-array v1, v1, [Lh4/l;

    .line 58
    new-instance v2, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$2;

    invoke-direct {v2, v0, v5, v1, v15}, Lcom/android/quickstep/views/TaskView$special$$inlined$inject$default$2;-><init>(Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;Ljava/lang/Object;[Lh4/l;Lu4/l;)V

    invoke-static {v2}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object v0

    .line 59
    iput-object v0, v4, Lcom/android/quickstep/views/TaskView;->coroutineScope$delegate:Lh4/e;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v4, Lcom/android/quickstep/views/TaskView;->coroutineJobs:Ljava/util/List;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v4, Lcom/android/quickstep/views/TaskView;->pendingThumbnailLoadRequests:Ljava/util/List;

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v4, Lcom/android/quickstep/views/TaskView;->pendingIconLoadRequests:Ljava/util/List;

    const/4 v0, 0x1

    .line 63
    iput-boolean v0, v4, Lcom/android/quickstep/views/TaskView;->isClickableAsLiveTile:Z

    .line 64
    new-instance v1, Lcom/android/quickstep/views/D2;

    invoke-direct {v1, v4}, Lcom/android/quickstep/views/D2;-><init>(Lcom/android/quickstep/views/TaskView;)V

    invoke-virtual {v4, v1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    invoke-static {}, Lcom/android/launcher3/y0;->k()Z

    move-result v1

    xor-int/2addr v1, v0

    invoke-virtual {v4, v1}, Landroid/widget/FrameLayout;->setWillNotDraw(Z)V

    .line 66
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->mRemovingActions:Ljava/util/ArrayList;

    .line 67
    new-array v1, v13, [F

    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->mMiniWindowIconCenterCoordinate:[F

    .line 68
    new-array v1, v13, [F

    iput-object v1, v4, Lcom/android/quickstep/views/TaskView;->mMenuIconCenterCoordinate:[F

    const/16 v1, 0x4c

    .line 69
    iput v1, v4, Lcom/android/quickstep/views/TaskView;->ALPHA_DISABLE:I

    const/16 v1, 0xff

    .line 70
    iput v1, v4, Lcom/android/quickstep/views/TaskView;->ALPHA_ENABLE:I

    .line 71
    iput-boolean v0, v4, Lcom/android/quickstep/views/TaskView;->mIsLockShown:Z

    .line 72
    new-instance v0, Lcom/android/quickstep/views/TaskView$SHOW_TITLE$1;

    invoke-direct {v0}, Lcom/android/quickstep/views/TaskView$SHOW_TITLE$1;-><init>()V

    iput-object v0, v4, Lcom/android/quickstep/views/TaskView;->SHOW_TITLE:Landroid/util/FloatProperty;

    .line 73
    iput v14, v4, Lcom/android/quickstep/views/TaskView;->mLastColor:I

    .line 74
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    move-result-object v0

    const-string v1, "getResourceManager(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, v4, Lcom/android/quickstep/views/TaskView;->resourceManagerProxy:Lcom/android/launcher3/resource/g0;

    const v0, 0x3fcccccd    # 1.6f

    .line 75
    iput v0, v4, Lcom/android/quickstep/views/TaskView;->GRID_TO_SINGLE_DEFAULT_SCALE:F

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;ILkotlin/jvm/internal/j;)V
    .locals 8

    move/from16 v0, p9

    and-int/lit8 v1, v0, 0x2

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object p2, v2

    :cond_0
    and-int/lit8 v1, v0, 0x4

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    move p3, v3

    :cond_1
    and-int/lit8 v1, v0, 0x8

    if-eqz v1, :cond_2

    move p4, v3

    :cond_2
    and-int/lit8 v1, v0, 0x10

    if-eqz v1, :cond_3

    move-object v1, v2

    goto :goto_0

    :cond_3
    move-object v1, p5

    :goto_0
    and-int/lit8 v3, v0, 0x20

    if-eqz v3, :cond_4

    goto :goto_1

    :cond_4
    move-object v2, p6

    :goto_1
    and-int/lit8 v3, v0, 0x40

    if-eqz v3, :cond_5

    .line 8
    sget-object v3, Lcom/android/quickstep/views/TaskViewType;->SINGLE:Lcom/android/quickstep/views/TaskViewType;

    goto :goto_2

    :cond_5
    move-object v3, p7

    :goto_2
    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_6

    .line 9
    new-instance v0, Lcom/android/quickstep/FullscreenDrawParams;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object p6, p1

    move-object p5, v0

    move/from16 p9, v4

    move-object/from16 p10, v5

    move-object p7, v6

    move-object/from16 p8, v7

    invoke-direct/range {p5 .. p10}, Lcom/android/quickstep/FullscreenDrawParams;-><init>(Landroid/content/Context;Lu4/l;Lu4/l;ILkotlin/jvm/internal/j;)V

    move-object/from16 p10, v0

    :goto_3
    move p5, p3

    move p6, p4

    move-object p7, v1

    move-object/from16 p8, v2

    move-object/from16 p9, v3

    move-object p3, p1

    move-object p4, p2

    move-object p2, p0

    goto :goto_4

    :cond_6
    move-object/from16 p10, p8

    goto :goto_3

    .line 10
    :goto_4
    invoke-direct/range {p2 .. p10}, Lcom/android/quickstep/views/TaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;)V

    return-void
.end method

.method public static synthetic A(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskViewIcon;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->setIcon$lambda$64$lambda$63(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskViewIcon;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic B(Lcom/android/quickstep/views/TaskView;Lu4/l;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->launchWithoutAnimation$lambda$79$lambda$78(Lcom/android/quickstep/views/TaskView;Lu4/l;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->setTaskMenuClickListener$lambda$105(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final _init_$lambda$7(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p0}, Lcom/android/quickstep/views/TaskView;->onClick(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, Lcom/android/quickstep/views/TaskView;->onTaskListVisibilityChanged$lambda$57$lambda$55(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getDismissScale$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->dismissScale:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getDismissTranslationX$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationX:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getDismissTranslationY$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationY:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getGridEndTranslationX$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->gridEndTranslationX:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getGridEndTranslationY$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->gridEndTranslationY:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getRootViewDisplayId(Lcom/android/quickstep/views/TaskView;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->getRootViewDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic access$getSETTLED_PROGRESS_FAST_OUT_INTERPOLATOR$cp()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/views/TaskView;->SETTLED_PROGRESS_FAST_OUT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getSettledProgress$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->settledProgress:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getSettledProgressDismiss(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->getSettledProgressDismiss()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic access$getSettledProgressGesture(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->getSettledProgressGesture()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic access$getSplitSelectTranslationX$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->splitSelectTranslationX:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getSplitSelectTranslationY$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->splitSelectTranslationY:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getTaskOffsetTranslationX$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->taskOffsetTranslationX:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getTaskOffsetTranslationY$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->taskOffsetTranslationY:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getTaskResistanceTranslationX$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->taskResistanceTranslationX:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getTaskResistanceTranslationY$p(Lcom/android/quickstep/views/TaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->taskResistanceTranslationY:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$getViewModel$p(Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->viewModel:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$setClickableAsLiveTile$p(Lcom/android/quickstep/views/TaskView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->isClickableAsLiveTile:Z

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setDismissScale(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setDismissScale(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setDismissTranslationX(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setDismissTranslationX(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setDismissTranslationY(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setDismissTranslationY(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setGridEndTranslationX(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setGridEndTranslationX(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setGridEndTranslationY(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setGridEndTranslationY(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setIconFadeInOnGestureCompleteAnimator$p(Lcom/android/quickstep/views/TaskView;Landroid/animation/ObjectAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView;->iconFadeInOnGestureCompleteAnimator:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setSettledProgress(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setSettledProgress(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setSettledProgressDismiss(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setSettledProgressDismiss(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setSettledProgressGesture(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setSettledProgressGesture(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setSplitSelectTranslationX(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setSplitSelectTranslationX(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setSplitSelectTranslationY(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setSplitSelectTranslationY(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setTaskOffsetTranslationX(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setTaskOffsetTranslationX(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setTaskOffsetTranslationY(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setTaskOffsetTranslationY(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setTaskResistanceTranslationX(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setTaskResistanceTranslationX(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$setTaskResistanceTranslationY(Lcom/android/quickstep/views/TaskView;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setTaskResistanceTranslationY(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$updateTaskViewState(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->updateTaskViewState(Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final applyScale()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPersistentScale()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->dismissScale:F

    .line 6
    .line 7
    mul-float/2addr v0, v1

    .line 8
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->modalness:F

    .line 9
    .line 10
    const/high16 v2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    iget v3, p0, Lcom/android/quickstep/views/TaskView;->modalScale:F

    .line 13
    .line 14
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    mul-float/2addr v0, v1

    .line 19
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->updateFullscreenParams()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private final applyThumbnailSplashAlpha()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->getSplashAlphaProgress()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Lcom/android/quickstep/views/TaskContainer;->updateThumbnailSplashProgress(F)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method private final applyTranslationPrimary()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationX:F

    .line 6
    .line 7
    iget v2, p0, Lcom/android/quickstep/views/TaskView;->taskOffsetTranslationX:F

    .line 8
    .line 9
    add-float/2addr v1, v2

    .line 10
    iget v2, p0, Lcom/android/quickstep/views/TaskView;->taskResistanceTranslationX:F

    .line 11
    .line 12
    add-float/2addr v1, v2

    .line 13
    iget v2, p0, Lcom/android/quickstep/views/TaskView;->splitSelectTranslationX:F

    .line 14
    .line 15
    add-float/2addr v1, v2

    .line 16
    iget v2, p0, Lcom/android/quickstep/views/TaskView;->gridEndTranslationX:F

    .line 17
    .line 18
    add-float/2addr v1, v2

    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPersistentTranslationX()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    add-float/2addr v1, v2

    .line 24
    iget v2, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationY:F

    .line 25
    .line 26
    iget v3, p0, Lcom/android/quickstep/views/TaskView;->taskOffsetTranslationY:F

    .line 27
    .line 28
    add-float/2addr v2, v3

    .line 29
    iget v3, p0, Lcom/android/quickstep/views/TaskView;->taskResistanceTranslationY:F

    .line 30
    .line 31
    add-float/2addr v2, v3

    .line 32
    iget v3, p0, Lcom/android/quickstep/views/TaskView;->splitSelectTranslationY:F

    .line 33
    .line 34
    add-float/2addr v2, v3

    .line 35
    iget v3, p0, Lcom/android/quickstep/views/TaskView;->gridEndTranslationY:F

    .line 36
    .line 37
    add-float/2addr v2, v3

    .line 38
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPersistentTranslationY()F

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    add-float/2addr v2, v3

    .line 43
    invoke-interface {v0, v1, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(FF)F

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-interface {v0, p0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setTranslationPrimary(Landroid/view/View;F)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private final applyTranslationSecondary()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationX:F

    .line 6
    .line 7
    iget v2, p0, Lcom/android/quickstep/views/TaskView;->taskOffsetTranslationX:F

    .line 8
    .line 9
    add-float/2addr v1, v2

    .line 10
    iget v2, p0, Lcom/android/quickstep/views/TaskView;->taskResistanceTranslationX:F

    .line 11
    .line 12
    add-float/2addr v1, v2

    .line 13
    iget v2, p0, Lcom/android/quickstep/views/TaskView;->splitSelectTranslationX:F

    .line 14
    .line 15
    add-float/2addr v1, v2

    .line 16
    iget v2, p0, Lcom/android/quickstep/views/TaskView;->gridEndTranslationX:F

    .line 17
    .line 18
    add-float/2addr v1, v2

    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPersistentTranslationX()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    add-float/2addr v1, v2

    .line 24
    iget v2, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationY:F

    .line 25
    .line 26
    iget v3, p0, Lcom/android/quickstep/views/TaskView;->taskOffsetTranslationY:F

    .line 27
    .line 28
    add-float/2addr v2, v3

    .line 29
    iget v3, p0, Lcom/android/quickstep/views/TaskView;->taskResistanceTranslationY:F

    .line 30
    .line 31
    add-float/2addr v2, v3

    .line 32
    iget v3, p0, Lcom/android/quickstep/views/TaskView;->splitSelectTranslationY:F

    .line 33
    .line 34
    add-float/2addr v2, v3

    .line 35
    iget v3, p0, Lcom/android/quickstep/views/TaskView;->gridEndTranslationY:F

    .line 36
    .line 37
    add-float/2addr v2, v3

    .line 38
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPersistentTranslationY()F

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    add-float/2addr v2, v3

    .line 43
    invoke-interface {v0, v1, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryValue(FF)F

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-interface {v0, p0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setTranslationSecondary(Landroid/view/View;F)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private final applyTranslationX()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTranslationLocked:Z

    if-eqz v0, :native_stack_entry_x_unlocked

    iget v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTargetTranslationX:F

    iget v1, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationX:F

    add-float/2addr v0, v1

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    return-void

    :native_stack_entry_x_unlocked

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationX:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->taskOffsetTranslationX:F

    .line 4
    .line 5
    add-float/2addr v0, v1

    .line 6
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->taskResistanceTranslationX:F

    .line 7
    .line 8
    add-float/2addr v0, v1

    .line 9
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->splitSelectTranslationX:F

    .line 10
    .line 11
    add-float/2addr v0, v1

    .line 12
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->gridEndTranslationX:F

    .line 13
    .line 14
    add-float/2addr v0, v1

    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPersistentTranslationX()F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    add-float/2addr v0, v1

    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private final applyTranslationY()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTranslationLocked:Z

    if-eqz v0, :native_stack_entry_y_unlocked

    iget v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTargetTranslationY:F

    iget v1, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationY:F

    add-float/2addr v0, v1

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    return-void

    :native_stack_entry_y_unlocked

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationY:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->taskOffsetTranslationY:F

    .line 4
    .line 5
    add-float/2addr v0, v1

    .line 6
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->taskResistanceTranslationY:F

    .line 7
    .line 8
    add-float/2addr v0, v1

    .line 9
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->splitSelectTranslationY:F

    .line 10
    .line 11
    add-float/2addr v0, v1

    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPersistentTranslationY()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    add-float/2addr v0, v1

    .line 17
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->gridEndTranslationY:F

    .line 18
    .line 19
    add-float/2addr v0, v1

    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/views/TaskView;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->screenNotHaveLocked$lambda$110(Lcom/android/quickstep/views/TaskView;Landroid/content/DialogInterface;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskViewIcon;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->setIcon$lambda$64$lambda$62(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskViewIcon;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final closeTaskMenu()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    const/16 v0, 0x800

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 19
    .line 20
    .line 21
    return v1

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method private final computeAndSetIconTouchDelegate(Lcom/android/quickstep/views/TaskViewIcon;[FLcom/android/launcher3/util/L2;)V
    .locals 5

    .line 1
    invoke-interface {p1}, Lcom/android/quickstep/views/TaskViewIcon;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    invoke-interface {p1}, Lcom/android/quickstep/views/TaskViewIcon;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-float v2, v2

    .line 14
    div-float/2addr v2, v1

    .line 15
    invoke-interface {p1}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 20
    .line 21
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v1, 0x0

    .line 26
    aput v0, p2, v1

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    aput v2, p2, v3

    .line 30
    .line 31
    sget-object v4, Lh4/t;->a:Lh4/t;

    .line 32
    .line 33
    invoke-static {p1, p0, p2, v1}, Lcom/android/launcher3/N5;->m(Landroid/view/View;Landroid/view/View;[FZ)F

    .line 34
    .line 35
    .line 36
    aget p0, p2, v1

    .line 37
    .line 38
    sub-float p1, p0, v0

    .line 39
    .line 40
    float-to-int p1, p1

    .line 41
    aget p2, p2, v3

    .line 42
    .line 43
    sub-float v1, p2, v2

    .line 44
    .line 45
    float-to-int v1, v1

    .line 46
    add-float/2addr p0, v0

    .line 47
    float-to-int p0, p0

    .line 48
    add-float/2addr p2, v2

    .line 49
    float-to-int p2, p2

    .line 50
    invoke-virtual {p3, p1, v1, p0, p2}, Lcom/android/launcher3/util/L2;->a(IIII)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private final computeAndSetMenuTouchDelegate()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    const/high16 v1, 0x40000000    # 2.0f

    .line 12
    .line 13
    div-float/2addr v0, v1

    .line 14
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mMenuIconCenterCoordinate:[F

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    aput v0, v1, v2

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    aput v0, v1, v3

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 23
    .line 24
    iget-object v4, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 25
    .line 26
    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    iget-object v5, p0, Lcom/android/quickstep/views/TaskView;->mMenuIconCenterCoordinate:[F

    .line 31
    .line 32
    invoke-static {v1, v4, v5, v3}, Lcom/android/launcher3/N5;->m(Landroid/view/View;Landroid/view/View;[FZ)F

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mMenuIconTouchDelegate:Lcom/android/launcher3/util/L2;

    .line 36
    .line 37
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mMenuIconCenterCoordinate:[F

    .line 41
    .line 42
    aget v3, p0, v3

    .line 43
    .line 44
    sub-float v4, v3, v0

    .line 45
    .line 46
    float-to-int v4, v4

    .line 47
    aget p0, p0, v2

    .line 48
    .line 49
    sub-float v2, p0, v0

    .line 50
    .line 51
    float-to-int v2, v2

    .line 52
    add-float/2addr v3, v0

    .line 53
    float-to-int v3, v3

    .line 54
    add-float/2addr p0, v0

    .line 55
    float-to-int p0, p0

    .line 56
    invoke-virtual {v1, v4, v2, v3, p0}, Lcom/android/launcher3/util/L2;->a(IIII)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method private final computeAndSetMiniWindowTouchDelegate()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    const/high16 v1, 0x40000000    # 2.0f

    .line 12
    .line 13
    div-float/2addr v0, v1

    .line 14
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowIconCenterCoordinate:[F

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    aput v0, v1, v2

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    aput v0, v1, v3

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 23
    .line 24
    iget-object v4, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 25
    .line 26
    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    iget-object v5, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowIconCenterCoordinate:[F

    .line 31
    .line 32
    invoke-static {v1, v4, v5, v3}, Lcom/android/launcher3/N5;->m(Landroid/view/View;Landroid/view/View;[FZ)F

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowIconTouchDelegate:Lcom/android/launcher3/util/L2;

    .line 36
    .line 37
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowIconCenterCoordinate:[F

    .line 41
    .line 42
    aget v3, p0, v3

    .line 43
    .line 44
    sub-float v4, v3, v0

    .line 45
    .line 46
    float-to-int v4, v4

    .line 47
    aget p0, p0, v2

    .line 48
    .line 49
    sub-float v2, p0, v0

    .line 50
    .line 51
    float-to-int v2, v2

    .line 52
    add-float/2addr v3, v0

    .line 53
    float-to-int v3, v3

    .line 54
    add-float/2addr p0, v0

    .line 55
    float-to-int p0, p0

    .line 56
    invoke-virtual {v1, v4, v2, v3, p0}, Lcom/android/launcher3/util/L2;->a(IIII)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic d(ILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->pinApplication$lambda$107$lambda$106(ILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/views/TaskView;ILandroid/view/View;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->updateTaskViewState$lambda$31$lambda$30$lambda$26(Lcom/android/quickstep/views/TaskView;ILandroid/view/View;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;II)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/views/TaskView;->onBind$lambda$38$lambda$37$lambda$36(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;II)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->screenHaveLocked$lambda$108(Landroid/content/DialogInterface;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic getBorderEnabled$annotations()V
    .locals 0

    .line 1
    return-void
.end method

.method private final getCoroutineScope()LF4/I;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->coroutineScope$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LF4/I;

    .line 8
    .line 9
    return-object p0
.end method

.method private static final getDismissIconFadeOutAnimator$lambda$6(Lcom/android/quickstep/views/TaskView;Ljava/lang/Float;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/views/TaskView;->SETTLED_PROGRESS_FAST_OUT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-interface {v0, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setSettledProgressDismiss(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private final getDispatcherProvider()Li2/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->dispatcherProvider$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Li2/b;

    .line 8
    .line 9
    return-object p0
.end method

.method private final getFilterUpdateCallback(Ljava/lang/String;)Landroid/view/View$OnClickListener;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getFilterState()Lcom/android/quickstep/RecentsFilterState;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/android/quickstep/RecentsFilterState;->shouldShowFilterUI(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    new-instance v0, Lcom/android/quickstep/views/x2;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/views/x2;-><init>(Lcom/android/quickstep/views/TaskView;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method private static final getFilterUpdateCallback$lambda$88(Lcom/android/quickstep/views/TaskView;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setAndApplyFilter(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private final getGridTrans(F)F
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->gridProgress:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0, p1}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method private final getModalAlpha()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->modalAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/util/u1;->a(Ljava/lang/Object;LB4/i;)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final getNonGridTrans(F)F
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->getGridTrans(F)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sub-float/2addr p1, p0

    .line 6
    return p1
.end method

.method private final getRootViewDisplayId()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private final getSettledProgressDismiss()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->settledProgressDismiss$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x6

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/util/u1;->a(Ljava/lang/Object;LB4/i;)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final getSettledProgressFullscreen()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->settledProgressFullscreen$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/util/u1;->a(Ljava/lang/Object;LB4/i;)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final getSettledProgressGesture()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->settledProgressGesture$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x5

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/util/u1;->a(Ljava/lang/Object;LB4/i;)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private final getSplashAlphaProgress()F
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->taskThumbnailSplashAlpha:F

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->splitSplashAlpha:F

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    cmpl-float v2, v0, v1

    .line 14
    .line 15
    if-lez v2, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->shouldShowSplash$Launcher_aospWithQuickstepInternalMiFavorRelease()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->taskThumbnailSplashAlpha:F

    .line 25
    .line 26
    return p0

    .line 27
    :cond_2
    return v1
.end method

.method public static synthetic getThumbnailBounds$default(Lcom/android/quickstep/views/TaskView;Landroid/graphics/Rect;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p4, :cond_1

    .line 2
    .line 3
    and-int/lit8 p3, p3, 0x2

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->getThumbnailBounds(Landroid/graphics/Rect;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 13
    .line 14
    const-string p1, "Super calls with default arguments not supported in this target, function: getThumbnailBounds"

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method public static synthetic h(FF)F
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->settledProgressPropertyFactory$lambda$4(FF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic i(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskContainer;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->showTaskMenuWithContainer$lambda$82(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskContainer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final initViewMFV()V
    .locals 2

    .line 1
    const v0, 0x7f0b03bd

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/ImageView;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Lcom/android/launcher3/util/L2;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 17
    .line 18
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/L2;-><init>(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMenuIconTouchDelegate:Lcom/android/launcher3/util/L2;

    .line 22
    .line 23
    :cond_0
    const v0, 0x7f0b03be

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/ImageView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    new-instance v0, Lcom/android/launcher3/util/L2;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 39
    .line 40
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/L2;-><init>(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowIconTouchDelegate:Lcom/android/launcher3/util/L2;

    .line 44
    .line 45
    :cond_1
    const v0, 0x7f0b03bc

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Landroid/widget/ImageView;

    .line 53
    .line 54
    iput-object v0, p0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    .line 55
    .line 56
    const v0, 0x7f0b03c5

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Landroid/widget/ImageView;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 66
    .line 67
    return-void
.end method

.method public static final isAppLocked(Ljava/lang/String;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/views/TaskView;->Companion:Lcom/android/quickstep/views/TaskView$Companion;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/quickstep/views/TaskView$Companion;->isAppLocked(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private final isSelectedTask()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getSelectedTaskView()Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    if-ne p0, v0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private final isShowInOtherDisplay(Lcom/android/systemui/shared/recents/model/Task;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    :goto_0
    if-eqz p0, :cond_1

    .line 8
    .line 9
    iget-object p0, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 10
    .line 11
    iget p1, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->displayId:I

    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    if-eq p1, v0, :cond_1

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p0, " is show in Other-Display!"

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "TaskView"

    .line 40
    .line 41
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_1
    const/4 p0, 0x0

    .line 47
    return p0
.end method

.method private final isWithinThumbnailBounds(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->thumbnailBounds:Landroid/graphics/Rect;

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
    invoke-virtual {p0, v0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public static synthetic j(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->setTaskMenuClickListener$lambda$103(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskView;->showTaskMenuWithContainer$lambda$83(Lcom/android/quickstep/views/RecentsView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->_init_$lambda$7(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final launchAsLiveTile([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/launcher3/util/Y1;
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v7

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez v7, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    iget-boolean v1, p0, Lcom/android/quickstep/views/TaskView;->isClickableAsLiveTile:Z

    .line 10
    .line 11
    const-string v10, "TaskView"

    .line 12
    .line 13
    const-string v11, "toString(...)"

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0, v11}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v1, "launchAsLiveTile - TaskView is not clickable as a live tile; returning to home: "

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {v10, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    return-object v0

    .line 49
    :cond_1
    const/4 v1, 0x0

    .line 50
    iput-boolean v1, p0, Lcom/android/quickstep/views/TaskView;->isClickableAsLiveTile:Z

    .line 51
    .line 52
    array-length v2, p1

    .line 53
    const/4 v3, 0x1

    .line 54
    if-nez v2, :cond_2

    .line 55
    .line 56
    move v2, v3

    .line 57
    goto :goto_0

    .line 58
    :cond_2
    move v2, v1

    .line 59
    :goto_0
    if-nez v2, :cond_6

    .line 60
    .line 61
    array-length v0, p1

    .line 62
    if-ne v0, v3, :cond_3

    .line 63
    .line 64
    aget-object p1, p1, v1

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    goto/16 :goto_3

    .line 75
    .line 76
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .line 80
    .line 81
    array-length v2, p1

    .line 82
    move v4, v1

    .line 83
    :goto_1
    if-ge v4, v2, :cond_4

    .line 84
    .line 85
    aget-object v5, p1, v4

    .line 86
    .line 87
    invoke-virtual {v5}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    invoke-virtual {v5}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    iget-object v5, v5, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 96
    .line 97
    const-string v6, "apps"

    .line 98
    .line 99
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v5}, Li4/g;->A([Ljava/lang/Object;)Ljava/lang/Iterable;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    invoke-static {v0, v5}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 107
    .line 108
    .line 109
    add-int/lit8 v4, v4, 0x1

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_4
    new-instance v2, Ljava/util/ArrayList;

    .line 113
    .line 114
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 115
    .line 116
    .line 117
    array-length v4, p1

    .line 118
    move v5, v1

    .line 119
    :goto_2
    if-ge v5, v4, :cond_5

    .line 120
    .line 121
    aget-object v6, p1, v5

    .line 122
    .line 123
    invoke-virtual {v6}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    invoke-virtual {v6}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    iget-object v6, v6, Lcom/android/quickstep/RemoteAnimationTargets;->wallpapers:[Landroid/view/RemoteAnimationTarget;

    .line 132
    .line 133
    const-string v8, "wallpapers"

    .line 134
    .line 135
    invoke-static {v6, v8}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v6}, Li4/g;->A([Ljava/lang/Object;)Ljava/lang/Iterable;

    .line 139
    .line 140
    .line 141
    move-result-object v6

    .line 142
    invoke-static {v2, v6}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 143
    .line 144
    .line 145
    add-int/lit8 v5, v5, 0x1

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_5
    new-instance v4, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 149
    .line 150
    new-array v5, v1, [Landroid/view/RemoteAnimationTarget;

    .line 151
    .line 152
    invoke-interface {v0, v5}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    check-cast v0, [Landroid/view/RemoteAnimationTarget;

    .line 157
    .line 158
    new-array v5, v1, [Landroid/view/RemoteAnimationTarget;

    .line 159
    .line 160
    invoke-interface {v2, v5}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    check-cast v2, [Landroid/view/RemoteAnimationTarget;

    .line 165
    .line 166
    aget-object v5, p1, v1

    .line 167
    .line 168
    invoke-virtual {v5}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    invoke-virtual {v5}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    iget-object v5, v5, Lcom/android/quickstep/RemoteAnimationTargets;->nonApps:[Landroid/view/RemoteAnimationTarget;

    .line 177
    .line 178
    aget-object p1, p1, v1

    .line 179
    .line 180
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p1}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iget p1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->targetMode:I

    .line 189
    .line 190
    invoke-direct {v4, v0, v2, v5, p1}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;I)V

    .line 191
    .line 192
    .line 193
    move-object v0, v4

    .line 194
    :cond_6
    :goto_3
    if-nez v0, :cond_8

    .line 195
    .line 196
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->launchAsStaticTile()Lcom/android/launcher3/util/Y1;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    if-nez p1, :cond_7

    .line 201
    .line 202
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-static {v0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-static {v0, v11}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    new-instance v1, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 216
    .line 217
    .line 218
    const-string v2, "launchAsLiveTile - Recents animation cancelled and cannot launch task as non-live tile; returning to home: "

    .line 219
    .line 220
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    .line 232
    .line 233
    :cond_7
    iput-boolean v3, p0, Lcom/android/quickstep/views/TaskView;->isClickableAsLiveTile:Z

    .line 234
    .line 235
    return-object p1

    .line 236
    :cond_8
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-static {p1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    invoke-static {p1, v11}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    const-string v1, "Main"

    .line 248
    .line 249
    const-string v2, "composeRecentsLaunchAnimator"

    .line 250
    .line 251
    invoke-static {v1, v2, p1}, Lcom/android/launcher3/testing/K;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 252
    .line 253
    .line 254
    new-instance p1, Lcom/android/launcher3/util/Y1;

    .line 255
    .line 256
    invoke-direct {p1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 257
    .line 258
    .line 259
    move-object v4, v0

    .line 260
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 261
    .line 262
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 263
    .line 264
    .line 265
    iget-object v2, v4, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 266
    .line 267
    iget-object v3, v4, Lcom/android/quickstep/RemoteAnimationTargets;->wallpapers:[Landroid/view/RemoteAnimationTarget;

    .line 268
    .line 269
    iget-object v4, v4, Lcom/android/quickstep/RemoteAnimationTargets;->nonApps:[Landroid/view/RemoteAnimationTarget;

    .line 270
    .line 271
    invoke-virtual {v7}, Lcom/android/quickstep/views/RecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 272
    .line 273
    .line 274
    move-result-object v6

    .line 275
    invoke-virtual {v7}, Lcom/android/quickstep/views/RecentsView;->getDepthController()LP1/h;

    .line 276
    .line 277
    .line 278
    move-result-object v8

    .line 279
    const/4 v9, 0x0

    .line 280
    const/4 v5, 0x1

    .line 281
    move-object v1, p0

    .line 282
    invoke-static/range {v0 .. v9}, Lcom/android/quickstep/TaskViewUtils;->composeRecentsLaunchAnimator(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;ZLcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsView;LP1/h;Landroid/window/TransitionInfo;)V

    .line 283
    .line 284
    .line 285
    new-instance p0, Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;

    .line 286
    .line 287
    invoke-direct {p0, v1, p1}, Lcom/android/quickstep/views/TaskView$launchAsLiveTile$1$1;-><init>(Lcom/android/quickstep/views/TaskView;Lcom/android/launcher3/util/Y1;)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    invoke-static {p0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    invoke-static {p0, v11}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    new-instance v0, Ljava/lang/StringBuilder;

    .line 308
    .line 309
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 310
    .line 311
    .line 312
    const-string v1, "launchAsLiveTile - composeRecentsLaunchAnimator: "

    .line 313
    .line 314
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object p0

    .line 324
    invoke-static {v10, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    .line 326
    .line 327
    invoke-virtual {v7}, Lcom/android/quickstep/views/RecentsView;->onTaskLaunchedInLiveTileMode()V

    .line 328
    .line 329
    .line 330
    return-object p1
.end method

.method public static synthetic launchWithoutAnimation$default(Lcom/android/quickstep/views/TaskView;ZLu4/l;ILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p4, :cond_1

    .line 2
    .line 3
    and-int/lit8 p3, p3, 0x1

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->launchWithoutAnimation(ZLu4/l;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 13
    .line 14
    const-string p1, "Super calls with default arguments not supported in this target, function: launchWithoutAnimation"

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method private static final launchWithoutAnimation$lambda$74(Lcom/android/quickstep/views/TaskView;)V
    .locals 1

    .line 1
    const-string v0, "launchWithoutAnimation"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->notifyTaskLaunchFailed(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->startHome(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mSizeStrategy:Lcom/android/quickstep/BaseContainerInterface;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->K()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private static final launchWithoutAnimation$lambda$75(Lu4/l;J)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private static final launchWithoutAnimation$lambda$76(Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->onTransitionFinished()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final launchWithoutAnimation$lambda$79(Lcom/android/quickstep/views/TaskContainer;Landroid/app/ActivityOptions;Lcom/android/quickstep/views/TaskView;Lu4/l;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 10
    .line 11
    invoke-virtual {v0, p0, p1}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->startActivityFromRecents(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/ActivityOptions;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 18
    .line 19
    new-instance p1, Lcom/android/quickstep/views/r2;

    .line 20
    .line 21
    invoke-direct {p1, p2, p3}, Lcom/android/quickstep/views/r2;-><init>(Lcom/android/quickstep/views/TaskView;Lu4/l;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "toString(...)"

    .line 36
    .line 37
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string p2, "launchWithoutAnimation - startActivityFromRecents: "

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "TaskView"

    .line 58
    .line 59
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private static final launchWithoutAnimation$lambda$79$lambda$78(Lcom/android/quickstep/views/TaskView;Lu4/l;)V
    .locals 1

    .line 1
    const-string v0, "launchTask"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->notifyTaskLaunchFailed(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-interface {p1, p0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic m(Lu4/l;J)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->launchWithoutAnimation$lambda$75(Lu4/l;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/android/quickstep/views/TaskContainer;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->onTaskListVisibilityChanged$lambda$54$lambda$52(Lcom/android/quickstep/views/TaskContainer;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->screenNotHaveLocked$lambda$111(Landroid/content/DialogInterface;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onBind$lambda$38$lambda$37$lambda$36(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;II)Lh4/t;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->updateThumbnailValidity(Lcom/android/quickstep/views/TaskContainer;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/views/TaskView;->updateThumbnailMatrix(Lcom/android/quickstep/views/TaskContainer;II)Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p1, p0}, Lcom/android/quickstep/views/TaskContainer;->refreshOverlay(Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 12
    .line 13
    return-object p0
.end method

.method private final onClick(Landroid/view/View;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->confirmSecondSplitSelectApp()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "toString(...)"

    .line 6
    .line 7
    const-string v2, "b/310064698"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p0, " - onClick - split select is active"

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-static {}, Lx1/O;->r2()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/android/quickstep/TaskUtils;->getLaunchComponentKeyForTask(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Lcom/android/launcher3/util/E;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v0, v0, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 69
    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 80
    .line 81
    invoke-static {v0}, Lcom/android/quickstep/TaskUtils;->getLaunchComponentKeyForTask(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Lcom/android/launcher3/util/E;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v0, v0, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const-string v3, "getPackageName(...)"

    .line 92
    .line 93
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    instance-of p1, p1, Lcom/android/quickstep/views/GroupedTaskView;

    .line 97
    .line 98
    if-nez p1, :cond_2

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {p1, v0}, Lx1/O;->x1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_2

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    if-eqz v3, :cond_1

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    const/4 p0, 0x0

    .line 121
    invoke-static {p0}, Lcom/android/launcher3/util/y2;->a(I)Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 122
    .line 123
    .line 124
    move-result-object v8

    .line 125
    const/4 v9, 0x1

    .line 126
    const/4 v4, 0x0

    .line 127
    const/4 v6, 0x0

    .line 128
    const/4 v7, 0x1

    .line 129
    invoke-virtual/range {v3 .. v9}, Lcom/android/quickstep/views/RecentsView;->initiateSplitSelectMFV(Lcom/android/quickstep/views/TaskView;Lcom/android/systemui/shared/recents/model/Task;IZLcom/android/launcher3/logging/StatsLogManager$d;Z)Z

    .line 130
    .line 131
    .line 132
    :cond_1
    return-void

    .line 133
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->launchWithAnimation()Lcom/android/launcher3/util/Y1;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    if-eqz p1, :cond_3

    .line 138
    .line 139
    new-instance v0, Lcom/android/quickstep/views/f2;

    .line 140
    .line 141
    invoke-direct {v0, p0}, Lcom/android/quickstep/views/f2;-><init>(Lcom/android/quickstep/views/TaskView;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 145
    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_3
    const/4 p1, 0x0

    .line 149
    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-static {v0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    new-instance v1, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string v0, " - onClick - callbackList: "

    .line 169
    .line 170
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 184
    .line 185
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->j:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 202
    .line 203
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method private static final onClick$lambda$67$lambda$66(Lcom/android/quickstep/views/TaskView;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "toString(...)"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p0, " - onClick - launchCompleted"

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "b/310064698"

    .line 32
    .line 33
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private final onForeColorChanged(I)V
    .locals 4

    .line 1
    const/4 v0, -0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    move p1, v0

    .line 5
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->mLastColor:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_4

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_4

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/android/quickstep/views/TaskContainer;

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    if-eqz v3, :cond_2

    .line 34
    .line 35
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    .line 37
    .line 38
    :cond_2
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    if-eqz v3, :cond_1

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    if-ne v0, p1, :cond_3

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    goto :goto_1

    .line 52
    :cond_3
    const/4 v3, 0x0

    .line 53
    :goto_1
    invoke-static {v2, v3}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_4
    if-ne p1, v0, :cond_5

    .line 58
    .line 59
    move v0, p1

    .line 60
    goto :goto_2

    .line 61
    :cond_5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const v1, 0x7f0607e1

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    :goto_2
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 73
    .line 74
    if-eqz v1, :cond_6

    .line 75
    .line 76
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 87
    .line 88
    .line 89
    iget-object v2, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 90
    .line 91
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 95
    .line 96
    .line 97
    :cond_6
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 98
    .line 99
    if-eqz v1, :cond_7

    .line 100
    .line 101
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 115
    .line 116
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 120
    .line 121
    .line 122
    :cond_7
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 123
    .line 124
    if-eqz v1, :cond_8

    .line 125
    .line 126
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 140
    .line 141
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 145
    .line 146
    .line 147
    :cond_8
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mMFVTaskFocusIndicatorHelper:Lcom/android/launcher3/keyboard/b$a;

    .line 148
    .line 149
    if-eqz p0, :cond_9

    .line 150
    .line 151
    invoke-virtual {p0, p1}, Lcom/android/launcher3/keyboard/b$a;->r(I)V

    .line 152
    .line 153
    .line 154
    :cond_9
    return-void
.end method

.method private final onGridProgressChanged()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationX()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationY()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyScale()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private static final onInitializeAccessibilityNodeInfo$lambda$19$lambda$16$lambda$15(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;Landroid/view/accessibility/AccessibilityNodeInfo;)Lh4/t;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/TaskOverlayFactory;->getEnabledShortcuts(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "getEnabledShortcuts(...)"

    .line 6
    .line 7
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/launcher3/popup/P;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/android/launcher3/popup/P;->createAccessibilityAction(Landroid/content/Context;)Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p2, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 39
    .line 40
    return-object p0
.end method

.method private final onModalnessUpdated(F)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/high16 v2, 0x3f800000    # 1.0f

    .line 25
    .line 26
    if-eqz v1, :cond_3

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->mTitleAnimator:Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    if-nez v3, :cond_2

    .line 37
    .line 38
    iget-boolean v3, p0, Lcom/android/quickstep/views/TaskView;->mIsTitleHidden:Z

    .line 39
    .line 40
    if-nez v3, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    sub-float/2addr v2, p1

    .line 47
    invoke-interface {v3, v2}, Lcom/android/quickstep/views/TaskViewIcon;->setModalAlpha(F)V

    .line 48
    .line 49
    .line 50
    :cond_2
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    invoke-virtual {v1, p1}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setBannerOffsetPercentage(F)V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_3
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->isSelectedTask()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_4
    sub-float/2addr v2, p1

    .line 74
    :goto_2
    invoke-direct {p0, v2}, Lcom/android/quickstep/views/TaskView;->setModalAlpha(F)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyScale()V

    .line 78
    .line 79
    .line 80
    :cond_5
    return-void
.end method

.method private final onSettledProgressUpdated(F)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_5

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 20
    .line 21
    const/high16 v2, 0x3f800000    # 1.0f

    .line 22
    .line 23
    cmpg-float v3, p1, v2

    .line 24
    .line 25
    if-gtz v3, :cond_4

    .line 26
    .line 27
    iget-boolean v3, p0, Lcom/android/quickstep/views/TaskView;->mIsTitleHidden:Z

    .line 28
    .line 29
    if-nez v3, :cond_4

    .line 30
    .line 31
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->mTitleAnimator:Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    if-nez v3, :cond_4

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-interface {v3, p1}, Lcom/android/quickstep/views/TaskViewIcon;->setContentAlpha(F)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    if-eqz v3, :cond_1

    .line 47
    .line 48
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 52
    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    invoke-virtual {v3, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 56
    .line 57
    .line 58
    :cond_2
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 59
    .line 60
    if-eqz v3, :cond_3

    .line 61
    .line 62
    invoke-virtual {v3, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 66
    .line 67
    if-eqz v3, :cond_4

    .line 68
    .line 69
    invoke-virtual {v3, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 70
    .line 71
    .line 72
    :cond_4
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    if-eqz v1, :cond_0

    .line 77
    .line 78
    sub-float/2addr v2, p1

    .line 79
    invoke-virtual {v1, v2}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setBannerOffsetPercentage(F)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    return-void
.end method

.method private static final onTaskListVisibilityChanged$lambda$54$lambda$52(Lcom/android/quickstep/views/TaskContainer;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 1

    .line 1
    const-string v0, "thumbnailData"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object p1, v0, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0, p1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setThumbnail(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private static final onTaskListVisibilityChanged$lambda$57$lambda$55(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    const-string v0, "icon"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "contentDescription"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "title"

    .line 12
    .line 13
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object p2, v0, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iput-object p3, p2, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iput-object p4, p2, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, p5}, Lcom/android/quickstep/views/TaskContainer;->setLocked(Ljava/lang/Boolean;)V

    .line 35
    .line 36
    .line 37
    iput-object p6, p0, Lcom/android/quickstep/views/TaskContainer;->supportSplit:Ljava/lang/Boolean;

    .line 38
    .line 39
    iput-object p7, p0, Lcom/android/quickstep/views/TaskContainer;->supportResize:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Lcom/android/quickstep/views/TaskView;->onIconLoaded(Lcom/android/quickstep/views/TaskContainer;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic p(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->setTaskMenuClickListener$lambda$104(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static final pinApplication$lambda$107(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->resourceManagerProxy:Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->m2()Lcom/android/launcher3/resource/r0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/resource/r0;->q()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 12
    .line 13
    new-instance v2, Lcom/android/quickstep/views/v2;

    .line 14
    .line 15
    invoke-direct {v2, v0, p0, p1}, Lcom/android/quickstep/views/v2;-><init>(ILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private static final pinApplication$lambda$107$lambda$106(ILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/android/quickstep/views/TaskView;->screenHaveLocked(Lcom/android/quickstep/views/TaskView;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p1, p2}, Lcom/android/quickstep/views/TaskView;->screenNotHaveLocked(Lcom/android/quickstep/views/TaskView;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic q(Lcom/android/quickstep/views/TaskContainer;Landroid/app/ActivityOptions;Lcom/android/quickstep/views/TaskView;Lu4/l;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/views/TaskView;->launchWithoutAnimation$lambda$79(Lcom/android/quickstep/views/TaskContainer;Landroid/app/ActivityOptions;Lcom/android/quickstep/views/TaskView;Lu4/l;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;J)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->launchWithoutAnimation$lambda$76(Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Lcom/android/quickstep/views/TaskView;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->getFilterUpdateCallback$lambda$88(Lcom/android/quickstep/views/TaskView;Ljava/lang/String;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final screenHaveLocked$lambda$108(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    return-void
.end method

.method private static final screenHaveLocked$lambda$109(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->launchAsStaticTile()Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    sget-object p0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 25
    .line 26
    iget-object p2, p1, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 27
    .line 28
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 46
    .line 47
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->startScreenPinning(I)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method private static final screenNotHaveLocked$lambda$110(Lcom/android/quickstep/views/TaskView;Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    new-instance p1, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-class v0, Lcom/android/launcher3/settings/ChooseLockHelperExt;

    .line 8
    .line 9
    invoke-direct {p1, p2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p2, v0}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 18
    .line 19
    .line 20
    const v0, 0x10008000

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 27
    .line 28
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p2}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private static final screenNotHaveLocked$lambda$111(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    return-void
.end method

.method private final setBoxTranslationY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->boxTranslationY:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationY()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setDismissScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->dismissScale:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyScale()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setDismissTranslationX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationX:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationX()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setDismissTranslationY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationY:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationY()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setGridEndTranslationX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->gridEndTranslationX:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationX()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setGridEndTranslationY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->gridEndTranslationY:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationY()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setHoverBorderVisible(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->hoverBorderVisible:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->hoverBorderVisible:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "toString(...)"

    .line 17
    .line 18
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->hoverBorderVisible:Z

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p1, " - setting border animator visibility to: "

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v0, "TaskView"

    .line 44
    .line 45
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->hoverBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 49
    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    iget-boolean p0, p0, Lcom/android/quickstep/views/TaskView;->hoverBorderVisible:Z

    .line 53
    .line 54
    const/4 v0, 0x1

    .line 55
    invoke-virtual {p1, p0, v0}, Lcom/android/quickstep/util/BorderAnimator;->setBorderVisibility(ZZ)V

    .line 56
    .line 57
    .line 58
    :cond_1
    :goto_0
    return-void
.end method

.method private static final setIcon$lambda$64$lambda$62(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskViewIcon;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->confirmSecondSplitSelectApp()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->showTaskMenu(Lcom/android/quickstep/views/TaskViewIcon;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private static final setIcon$lambda$64$lambda$63(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskViewIcon;Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->requestDisallowInterceptTouchEvent(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->showTaskMenu(Lcom/android/quickstep/views/TaskViewIcon;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private final setIconAndTitle(Lcom/android/quickstep/views/TaskContainer;Landroid/graphics/drawable/Drawable;)V
    .locals 5
    .param p2    # Landroid/graphics/drawable/Drawable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p2, :cond_5

    .line 14
    .line 15
    if-eqz p1, :cond_5

    .line 16
    .line 17
    iget-object p2, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenGroupShortcutsItem:Lcom/android/launcher3/model/data/I;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    check-cast p2, Lcom/android/quickstep/views/TaskContainer;

    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    if-eq v0, p2, :cond_0

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-static {}, Lx1/O;->Q0()Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    const-string v3, "getContext(...)"

    .line 44
    .line 45
    if-eqz p2, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    check-cast p2, Lcom/android/quickstep/views/TaskContainer;

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->isLocked()Ljava/lang/Boolean;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-static {p2, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    goto :goto_0

    .line 68
    :cond_1
    sget-object p2, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-static {v4, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2, v4}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    if-eqz p2, :cond_2

    .line 82
    .line 83
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2}, Lcom/android/launcher3/H5;->A()Ljava/util/ArrayList;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    iget-object v2, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 95
    .line 96
    invoke-virtual {v2}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    :cond_2
    :goto_0
    iget-object p2, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenGroupShortcutsItem:Lcom/android/launcher3/model/data/I;

    .line 105
    .line 106
    if-eqz p2, :cond_3

    .line 107
    .line 108
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {p2, v3}, Lcom/android/launcher3/model/data/z;->F(Landroid/content/Context;)Ls1/o;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    goto :goto_1

    .line 120
    :cond_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-static {p2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p2, p1}, Lcom/android/quickstep/views/TaskView;->processTaskIcon(Landroid/content/Context;Lcom/android/systemui/shared/recents/model/Task;)Landroid/graphics/drawable/Drawable;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    :goto_1
    invoke-interface {v0, p2}, Lcom/android/quickstep/views/TaskViewIcon;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 135
    .line 136
    .line 137
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenGroupShortcutsItem:Lcom/android/launcher3/model/data/I;

    .line 138
    .line 139
    if-eqz v3, :cond_4

    .line 140
    .line 141
    if-eqz v1, :cond_4

    .line 142
    .line 143
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    iget-object p1, v3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 147
    .line 148
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_4
    invoke-direct {p0, v1, p1}, Lcom/android/quickstep/views/TaskView;->setTitleText(Landroid/widget/TextView;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 153
    .line 154
    .line 155
    :goto_2
    invoke-virtual {p0, v0, p2}, Lcom/android/quickstep/views/TaskView;->saveIconDrawable(Lcom/android/quickstep/views/TaskViewIcon;Landroid/graphics/drawable/Drawable;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/TaskView;->setLockImageStatus(Z)V

    .line 159
    .line 160
    .line 161
    instance-of p1, p0, Lcom/android/quickstep/views/GroupedTaskView;

    .line 162
    .line 163
    if-nez p1, :cond_6

    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->updateMiniWindowButtonState()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->updateSplitButtonState()V

    .line 169
    .line 170
    .line 171
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->setTaskMenuClickListener()V

    .line 172
    .line 173
    .line 174
    goto :goto_3

    .line 175
    :cond_5
    const/4 p1, 0x0

    .line 176
    invoke-interface {v0, p1}, Lcom/android/quickstep/views/TaskViewIcon;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/views/TaskView;->saveIconDrawable(Lcom/android/quickstep/views/TaskViewIcon;Landroid/graphics/drawable/Drawable;)V

    .line 180
    .line 181
    .line 182
    invoke-interface {v0, p1}, Lcom/android/quickstep/views/TaskViewIcon;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    .line 184
    .line 185
    invoke-interface {v0, p1}, Lcom/android/quickstep/views/TaskViewIcon;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 186
    .line 187
    .line 188
    instance-of p2, p0, Lcom/android/quickstep/views/GroupedTaskView;

    .line 189
    .line 190
    if-nez p2, :cond_6

    .line 191
    .line 192
    iget-object p2, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 193
    .line 194
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    .line 199
    .line 200
    iget-object p2, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 201
    .line 202
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 209
    .line 210
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 211
    .line 212
    .line 213
    const/16 p2, 0x8

    .line 214
    .line 215
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 216
    .line 217
    .line 218
    :cond_6
    :goto_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    invoke-static {p2}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 227
    .line 228
    .line 229
    move-result p2

    .line 230
    const v0, 0x7f040781

    .line 231
    .line 232
    .line 233
    invoke-static {p1, v0, p2}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->onForeColorChanged(I)V

    .line 238
    .line 239
    .line 240
    return-void
.end method

.method private final setModalAlpha(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->modalAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, p1}, Lcom/android/launcher3/util/u1;->b(Ljava/lang/Object;LB4/i;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private final setSettledProgress(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->settledProgress:F

    .line 2
    .line 3
    cmpg-float v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->settledProgress:F

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->onSettledProgressUpdated(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private final setSettledProgressDismiss(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->settledProgressDismiss$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x6

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, p1}, Lcom/android/launcher3/util/u1;->b(Ljava/lang/Object;LB4/i;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private final setSettledProgressFullscreen(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->settledProgressFullscreen$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, p1}, Lcom/android/launcher3/util/u1;->b(Ljava/lang/Object;LB4/i;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private final setSettledProgressGesture(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->settledProgressGesture$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x5

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, p1}, Lcom/android/launcher3/util/u1;->b(Ljava/lang/Object;LB4/i;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic setShouldShowScreenshot$default(Lcom/android/quickstep/views/TaskView;ZLjava/util/Map;ILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p4, :cond_1

    .line 2
    .line 3
    and-int/lit8 p3, p3, 0x2

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->setShouldShowScreenshot(ZLjava/util/Map;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 13
    .line 14
    const-string p1, "Super calls with default arguments not supported in this target, function: setShouldShowScreenshot"

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method private final setSplitSelectTranslationX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->splitSelectTranslationX:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationX()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setSplitSelectTranslationY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->splitSelectTranslationY:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationY()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setTaskMenuClickListener()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Lcom/android/quickstep/views/E2;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/E2;-><init>(Lcom/android/quickstep/views/TaskView;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 21
    .line 22
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Lcom/android/quickstep/views/d2;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/d2;-><init>(Lcom/android/quickstep/views/TaskView;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 34
    .line 35
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Lcom/android/quickstep/views/e2;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/e2;-><init>(Lcom/android/quickstep/views/TaskView;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 47
    .line 48
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenShort:Lcom/android/launcher3/popup/P;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 58
    .line 59
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 67
    .line 68
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 75
    .line 76
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 83
    .line 84
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method private static final setTaskMenuClickListener$lambda$103(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->showTaskMenu(Lcom/android/quickstep/views/TaskViewIcon;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private static final setTaskMenuClickListener$lambda$104(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)Z
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->requestDisallowInterceptTouchEvent(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->showTaskMenu(Lcom/android/quickstep/views/TaskViewIcon;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method private static final setTaskMenuClickListener$lambda$105(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->startMiniWindowMode()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final setTaskOffsetTranslationX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->taskOffsetTranslationX:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationX()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setTaskOffsetTranslationY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->taskOffsetTranslationY:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationY()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setTaskResistanceTranslationX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->taskResistanceTranslationX:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationX()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setTaskResistanceTranslationY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->taskResistanceTranslationY:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationY()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final setTitleText(Landroid/widget/TextView;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 5
    .line 6
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0, p2}, Lcom/android/quickstep/TaskUtils;->getTaskName(Landroid/content/Context;Lcom/android/systemui/shared/recents/model/Task;)Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p2, "getTaskName(...)"

    .line 15
    .line 16
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private static final settledProgressPropertyFactory$lambda$4(FF)F
    .locals 0

    .line 1
    mul-float/2addr p0, p1

    .line 2
    return p0
.end method

.method private final showTaskMenu(Lcom/android/quickstep/views/TaskViewIcon;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->canLaunchFullscreenTask()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    iget-object v2, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 18
    .line 19
    invoke-interface {v2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->G0:Z

    .line 24
    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isClearAllHidden()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {v0, p0}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 38
    .line 39
    .line 40
    return v1

    .line 41
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_4

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    move-object v3, v2

    .line 60
    check-cast v3, Lcom/android/quickstep/views/TaskContainer;

    .line 61
    .line 62
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    if-ne v3, p1, :cond_3

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_4
    const/4 v2, 0x0

    .line 70
    :goto_0
    check-cast v2, Lcom/android/quickstep/views/TaskContainer;

    .line 71
    .line 72
    if-nez v2, :cond_5

    .line 73
    .line 74
    return v1

    .line 75
    :cond_5
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 76
    .line 77
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->K:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 94
    .line 95
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 96
    .line 97
    .line 98
    invoke-direct {p0, v2}, Lcom/android/quickstep/views/TaskView;->showTaskMenuWithContainer(Lcom/android/quickstep/views/TaskContainer;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    return p0
.end method

.method private final showTaskMenuWithContainer(Lcom/android/quickstep/views/TaskContainer;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->B()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->setTaskBorderEnabled(Z)V

    .line 16
    .line 17
    .line 18
    :cond_1
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_3

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    instance-of v2, v2, Lcom/android/quickstep/views/IconAppChipView;

    .line 29
    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/android/quickstep/views/IconAppChipView;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/android/quickstep/views/IconAppChipView;->getStatus()Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    sget-object v3, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->Expanded:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 43
    .line 44
    if-ne v2, v3, :cond_2

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->closeTaskMenu()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_2
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Lcom/android/quickstep/views/IconAppChipView;

    .line 56
    .line 57
    const/4 v2, 0x2

    .line 58
    const/4 v3, 0x0

    .line 59
    const/4 v4, 0x1

    .line 60
    invoke-static {p0, v4, v1, v2, v3}, Lcom/android/quickstep/views/IconAppChipView;->revealAnim$Launcher_aospWithQuickstepInternalMiFavorRelease$default(Lcom/android/quickstep/views/IconAppChipView;ZZILjava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    sget-object p0, Lcom/android/quickstep/views/TaskMenuView;->Companion:Lcom/android/quickstep/views/TaskMenuView$Companion;

    .line 64
    .line 65
    new-instance v1, Lcom/android/quickstep/views/c2;

    .line 66
    .line 67
    invoke-direct {v1, v0, p1}, Lcom/android/quickstep/views/c2;-><init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskContainer;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1, v1}, Lcom/android/quickstep/views/TaskMenuView$Companion;->showForTask(Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Runnable;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    return p0

    .line 75
    :cond_3
    sget-object p0, Lcom/android/quickstep/views/TaskMenuView;->Companion:Lcom/android/quickstep/views/TaskMenuView$Companion;

    .line 76
    .line 77
    new-instance v1, Lcom/android/quickstep/views/n2;

    .line 78
    .line 79
    invoke-direct {v1, v0}, Lcom/android/quickstep/views/n2;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p1, v1}, Lcom/android/quickstep/views/TaskMenuView$Companion;->showForTask(Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Runnable;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    return p0
.end method

.method private static final showTaskMenuWithContainer$lambda$82(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskContainer;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isSplitSelectionActive()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    xor-int/2addr v0, v1

    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/android/quickstep/views/IconAppChipView;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p1, v2, v0}, Lcom/android/quickstep/views/IconAppChipView;->revealAnim$Launcher_aospWithQuickstepInternalMiFavorRelease(ZZ)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/y0;->B()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setTaskBorderEnabled(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private static final showTaskMenuWithContainer$lambda$83(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setTaskBorderEnabled(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic t(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->pinApplication$lambda$107(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskView;->launchWithoutAnimation$lambda$74(Lcom/android/quickstep/views/TaskView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final updateFilterCallback(Landroid/view/View;Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    :goto_0
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private final updatePivots()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->modalPivot:Landroid/graphics/PointF;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, v0, Landroid/graphics/PointF;->x:F

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 8
    .line 9
    .line 10
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 17
    .line 18
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget v0, v0, Lcom/android/launcher3/h0;->S2:I

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 25
    .line 26
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutDirection()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x1

    .line 39
    if-ne v1, v2, :cond_1

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRight()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLeft()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    sub-int/2addr v1, v2

    .line 52
    :goto_0
    int-to-float v1, v1

    .line 53
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 54
    .line 55
    .line 56
    int-to-float v0, v0

    .line 57
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRight()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLeft()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    sub-int/2addr v1, v2

    .line 70
    int-to-float v1, v1

    .line 71
    const/high16 v2, 0x3f000000    # 0.5f

    .line 72
    .line 73
    mul-float/2addr v1, v2

    .line 74
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 75
    .line 76
    .line 77
    int-to-float v1, v0

    .line 78
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    sub-int/2addr v3, v0

    .line 83
    int-to-float v0, v3

    .line 84
    mul-float/2addr v0, v2

    .line 85
    add-float/2addr v1, v0

    .line 86
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method private final updateSnapshotBackground(Lcom/android/quickstep/views/TaskContainer;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const v0, 0x7f060734

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p0, v0, v1}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget-object v0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->BACKGROUND_PAINT_COLOR:Landroid/util/IntProperty;

    .line 22
    .line 23
    filled-new-array {p0}, [I

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p1, v0, p0}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "ofArgb(...)"

    .line 32
    .line 33
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const-wide/16 v0, 0x78

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    sget-object p1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private final updateTaskViewState(Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;)V
    .locals 12

    .line 1
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "TaskView.updateTaskViewState"

    .line 8
    .line 9
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->getSysUiStatusNavFlags()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Lcom/android/quickstep/views/TaskView;->sysUiStatusNavFlags:I

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->getTasks()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/16 v2, 0xa

    .line 23
    .line 24
    invoke-static {v1, v2}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-static {v2}, Li4/F;->a(I)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/16 v3, 0x10

    .line 33
    .line 34
    invoke-static {v2, v3}, LA4/d;->c(II)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    new-instance v3, Ljava/util/LinkedHashMap;

    .line 39
    .line 40
    invoke-direct {v3, v2}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    move-object v4, v2

    .line 58
    check-cast v4, Lcom/android/quickstep/recents/ui/viewmodel/TaskData;

    .line 59
    .line 60
    invoke-virtual {v4}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData;->getTaskId()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catchall_0
    move-exception p0

    .line 73
    goto/16 :goto_9

    .line 74
    .line 75
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_d

    .line 88
    .line 89
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    check-cast v2, Lcom/android/quickstep/views/TaskContainer;

    .line 94
    .line 95
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    iget-object v4, v4, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 100
    .line 101
    iget v4, v4, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 102
    .line 103
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    check-cast v5, Lcom/android/quickstep/recents/ui/viewmodel/TaskData;

    .line 112
    .line 113
    iget-object v6, p0, Lcom/android/quickstep/views/TaskView;->type:Lcom/android/quickstep/views/TaskViewType;

    .line 114
    .line 115
    sget-object v7, Lcom/android/quickstep/views/TaskViewType;->DESKTOP:Lcom/android/quickstep/views/TaskViewType;

    .line 116
    .line 117
    const/4 v8, 0x1

    .line 118
    const/4 v9, 0x0

    .line 119
    if-ne v6, v7, :cond_3

    .line 120
    .line 121
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    if-eqz v6, :cond_3

    .line 126
    .line 127
    move v6, v8

    .line 128
    goto :goto_2

    .line 129
    :cond_3
    move v6, v9

    .line 130
    :goto_2
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isLiveTile()Z

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    const/4 v10, 0x0

    .line 135
    if-eqz v6, :cond_4

    .line 136
    .line 137
    new-instance v11, Lcom/android/quickstep/views/A2;

    .line 138
    .line 139
    invoke-direct {v11, p0, v4}, Lcom/android/quickstep/views/A2;-><init>(Lcom/android/quickstep/views/TaskView;I)V

    .line 140
    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_4
    move-object v11, v10

    .line 144
    :goto_3
    if-eqz v11, :cond_5

    .line 145
    .line 146
    new-instance v4, Lcom/android/quickstep/views/B2;

    .line 147
    .line 148
    invoke-direct {v4, v11}, Lcom/android/quickstep/views/B2;-><init>(Lu4/l;)V

    .line 149
    .line 150
    .line 151
    goto :goto_4

    .line 152
    :cond_5
    move-object v4, v10

    .line 153
    :goto_4
    invoke-virtual {v2, v5, v7, v6, v4}, Lcom/android/quickstep/views/TaskContainer;->setState(Lcom/android/quickstep/recents/ui/viewmodel/TaskData;ZZLandroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    invoke-direct {p0, v2}, Lcom/android/quickstep/views/TaskView;->updateThumbnailValidity(Lcom/android/quickstep/views/TaskContainer;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getWidth()I

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getHeight()I

    .line 172
    .line 173
    .line 174
    move-result v6

    .line 175
    invoke-direct {p0, v2, v4, v6}, Lcom/android/quickstep/views/TaskView;->updateThumbnailMatrix(Lcom/android/quickstep/views/TaskContainer;II)Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 176
    .line 177
    .line 178
    move-result-object v4

    .line 179
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->getTaskOverlayEnabled()Z

    .line 180
    .line 181
    .line 182
    move-result v6

    .line 183
    invoke-virtual {v2, v6, v4}, Lcom/android/quickstep/views/TaskContainer;->setOverlayEnabled(ZLcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->isCentralTask()Z

    .line 187
    .line 188
    .line 189
    move-result v6

    .line 190
    if-eqz v6, :cond_c

    .line 191
    .line 192
    iget-object v6, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 193
    .line 194
    invoke-interface {v6}, Lcom/android/quickstep/views/RecentsViewContainer;->getActionsView()Lcom/android/quickstep/views/OverviewActionsView;

    .line 195
    .line 196
    .line 197
    move-result-object v6

    .line 198
    if-eqz v4, :cond_6

    .line 199
    .line 200
    invoke-virtual {v4}, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->isRotated()Z

    .line 201
    .line 202
    .line 203
    move-result v4

    .line 204
    goto :goto_5

    .line 205
    :cond_6
    move v4, v9

    .line 206
    :goto_5
    const/4 v7, 0x2

    .line 207
    invoke-virtual {v6, v7, v4}, Lcom/android/quickstep/views/OverviewActionsView;->updateDisabledFlags(IZ)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;->getTasks()Ljava/util/List;

    .line 211
    .line 212
    .line 213
    move-result-object v4

    .line 214
    if-eqz v4, :cond_8

    .line 215
    .line 216
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    .line 217
    .line 218
    .line 219
    move-result v7

    .line 220
    if-eqz v7, :cond_8

    .line 221
    .line 222
    :cond_7
    move v8, v9

    .line 223
    goto :goto_8

    .line 224
    :cond_8
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    :cond_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 229
    .line 230
    .line 231
    move-result v7

    .line 232
    if-eqz v7, :cond_7

    .line 233
    .line 234
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v7

    .line 238
    check-cast v7, Lcom/android/quickstep/recents/ui/viewmodel/TaskData;

    .line 239
    .line 240
    instance-of v11, v7, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 241
    .line 242
    if-eqz v11, :cond_a

    .line 243
    .line 244
    check-cast v7, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 245
    .line 246
    goto :goto_6

    .line 247
    :cond_a
    move-object v7, v10

    .line 248
    :goto_6
    if-eqz v7, :cond_b

    .line 249
    .line 250
    invoke-virtual {v7}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getThumbnailData()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 251
    .line 252
    .line 253
    move-result-object v7

    .line 254
    if-eqz v7, :cond_b

    .line 255
    .line 256
    invoke-virtual {v7}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 257
    .line 258
    .line 259
    move-result-object v7

    .line 260
    goto :goto_7

    .line 261
    :cond_b
    move-object v7, v10

    .line 262
    :goto_7
    if-nez v7, :cond_9

    .line 263
    .line 264
    :goto_8
    const/4 v4, 0x4

    .line 265
    invoke-virtual {v6, v4, v8}, Lcom/android/quickstep/views/OverviewActionsView;->updateDisabledFlags(IZ)V

    .line 266
    .line 267
    .line 268
    :cond_c
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 269
    .line 270
    .line 271
    move-result v4

    .line 272
    if-eqz v4, :cond_2

    .line 273
    .line 274
    invoke-virtual {p0, v2, v5}, Lcom/android/quickstep/views/TaskView;->setIconState(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/recents/ui/viewmodel/TaskData;)V

    .line 275
    .line 276
    .line 277
    goto/16 :goto_1

    .line 278
    .line 279
    :cond_d
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 280
    .line 281
    if-eqz v0, :cond_e

    .line 282
    .line 283
    invoke-static {}, LK0/a;->b()V

    .line 284
    .line 285
    .line 286
    :cond_e
    return-void

    .line 287
    :goto_9
    if-eqz v0, :cond_f

    .line 288
    .line 289
    invoke-static {}, LK0/a;->b()V

    .line 290
    .line 291
    .line 292
    :cond_f
    throw p0
.end method

.method private static final updateTaskViewState$lambda$31$lambda$30$lambda$26(Lcom/android/quickstep/views/TaskView;ILandroid/view/View;)Lh4/t;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    invoke-virtual {p0, p1, p2, p2}, Lcom/android/quickstep/views/RecentsView;->dismissTask(IZZ)V

    .line 9
    .line 10
    .line 11
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 12
    .line 13
    return-object p0
.end method

.method private static final updateTaskViewState$lambda$31$lambda$30$lambda$27(Lu4/l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final updateThumbnailMatrix(Lcom/android/quickstep/views/TaskContainer;II)Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "TaskView.updateThumbnailMatrix"

    .line 8
    .line 9
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->viewModel:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 13
    .line 14
    if-eqz v1, :cond_3

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailData$Launcher_aospWithQuickstepInternalMiFavorRelease()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {v1, v2, p2, p3, p0}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->getThumbnailPosition(Lcom/android/systemui/shared/recents/model/ThumbnailData;IIZ)Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/recents/domain/usecase/ThumbnailPosition;->getMatrix()Landroid/graphics/Matrix;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p1, p2}, Lcom/android/quickstep/views/TaskContainer;->updateThumbnailMatrix(Landroid/graphics/Matrix;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-static {}, LK0/a;->b()V

    .line 41
    .line 42
    .line 43
    :cond_2
    return-object p0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    invoke-static {}, LK0/a;->b()V

    .line 50
    .line 51
    .line 52
    :cond_4
    return-object p0

    .line 53
    :goto_1
    if-eqz v0, :cond_5

    .line 54
    .line 55
    invoke-static {}, LK0/a;->b()V

    .line 56
    .line 57
    .line 58
    :cond_5
    throw p0
.end method

.method private final updateThumbnailValidity(Lcom/android/quickstep/views/TaskContainer;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->viewModel:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailData$Launcher_aospWithQuickstepInternalMiFavorRelease()Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->isThumbnailValid(Lcom/android/systemui/shared/recents/model/ThumbnailData;II)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p1, v0}, Lcom/android/quickstep/views/TaskContainer;->setThumbnailValid$Launcher_aospWithQuickstepInternalMiFavorRelease(Z)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyThumbnailSplashAlpha()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public static synthetic v(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;Landroid/view/accessibility/AccessibilityNodeInfo;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->onInitializeAccessibilityNodeInfo$lambda$19$lambda$16$lambda$15(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;Landroid/view/accessibility/AccessibilityNodeInfo;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic w(Lcom/android/quickstep/views/TaskView;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->getDismissIconFadeOutAnimator$lambda$6(Lcom/android/quickstep/views/TaskView;Ljava/lang/Float;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Lu4/l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskView;->updateTaskViewState$lambda$31$lambda$30$lambda$27(Lu4/l;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/views/TaskView;->screenHaveLocked$lambda$109(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;Landroid/content/DialogInterface;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z(Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskView;->onClick$lambda$67$lambda$66(Lcom/android/quickstep/views/TaskView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public addChildrenForAccessibility(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "outChildren"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {p0}, Li4/m;->t0(Ljava/lang/Iterable;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/TaskContainer;->addChildForAccessibility(Ljava/util/ArrayList;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-void
.end method

.method public final animateLockButtonDisplay()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/ImageView;->getAlpha()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    const/high16 v1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->a(Ljava/lang/Float;F)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->mhasLockButton:Z

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    if-nez v0, :cond_3

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 36
    .line 37
    .line 38
    :cond_2
    iput-boolean v2, p0, Lcom/android/quickstep/views/TaskView;->mIsLockShown:Z

    .line 39
    .line 40
    return-void

    .line 41
    :cond_3
    new-instance v0, Lkotlin/jvm/internal/C;

    .line 42
    .line 43
    invoke-direct {v0}, Lkotlin/jvm/internal/C;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    .line 47
    .line 48
    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 49
    .line 50
    const/4 v4, 0x2

    .line 51
    new-array v4, v4, [F

    .line 52
    .line 53
    fill-array-data v4, :array_0

    .line 54
    .line 55
    .line 56
    invoke-static {v1, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, v0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    const-wide/16 v3, 0x12c

    .line 65
    .line 66
    invoke-virtual {v1, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    sget-object v3, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 73
    .line 74
    invoke-virtual {v1, v3}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    iget-object v1, v0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast v1, Landroid/animation/ObjectAnimator;

    .line 80
    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    new-instance v3, Lcom/android/quickstep/views/TaskView$animateLockButtonDisplay$1;

    .line 84
    .line 85
    invoke-direct {v3, v0}, Lcom/android/quickstep/views/TaskView$animateLockButtonDisplay$1;-><init>(Lkotlin/jvm/internal/C;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v3}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 89
    .line 90
    .line 91
    :cond_5
    iget-object v0, v0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v0, Landroid/animation/ObjectAnimator;

    .line 94
    .line 95
    if-eqz v0, :cond_6

    .line 96
    .line 97
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 98
    .line 99
    .line 100
    :cond_6
    iput-boolean v2, p0, Lcom/android/quickstep/views/TaskView;->mIsLockShown:Z

    .line 101
    .line 102
    return-void

    .line 103
    :cond_7
    :goto_1
    const-string p0, "TaskView"

    .line 104
    .line 105
    const-string v0, "animateTitleDisplay: no Lock Button or has been shown , return !"

    .line 106
    .line 107
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final animateTitleDisplay()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->SHOW_TITLE:Landroid/util/FloatProperty;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Float;

    .line 8
    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->a(Ljava/lang/Float;F)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string p0, "TaskView"

    .line 18
    .line 19
    const-string v0, "animateTitleDisplay: has been show , return !!"

    .line 20
    .line 21
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mTitleAnimator:Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->SHOW_TITLE:Landroid/util/FloatProperty;

    .line 36
    .line 37
    const/4 v2, 0x2

    .line 38
    new-array v2, v2, [F

    .line 39
    .line 40
    fill-array-data v2, :array_0

    .line 41
    .line 42
    .line 43
    invoke-static {p0, v0, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/android/quickstep/views/TaskView;->mTitleAnimator:Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    const-wide/16 v2, 0x12c

    .line 52
    .line 53
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mTitleAnimator:Landroid/animation/ObjectAnimator;

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    new-instance v2, Lcom/android/quickstep/views/TaskView$animateTitleDisplay$1;

    .line 69
    .line 70
    invoke-direct {v2, p0}, Lcom/android/quickstep/views/TaskView$animateTitleDisplay$1;-><init>(Lcom/android/quickstep/views/TaskView;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 74
    .line 75
    .line 76
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mTitleAnimator:Landroid/animation/ObjectAnimator;

    .line 77
    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 81
    .line 82
    .line 83
    :cond_4
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/TaskView;->setSettledProgress(F)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public bind(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/quickstep/TaskOverlayFactory;)V
    .locals 10

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "orientedState"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "taskOverlayFactory"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->cancelPendingLoadTasks()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p2}, Lcom/android/quickstep/views/TaskView;->setOrientedState(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 20
    .line 21
    .line 22
    const v7, 0x7f0b0214

    .line 23
    .line 24
    .line 25
    const/4 v8, -0x1

    .line 26
    const v3, 0x7f0b0565

    .line 27
    .line 28
    .line 29
    const v4, 0x7f0b02fc

    .line 30
    .line 31
    .line 32
    const v5, 0x7f0b03c6

    .line 33
    .line 34
    .line 35
    const v6, 0x7f0b0556

    .line 36
    .line 37
    .line 38
    move-object v1, p0

    .line 39
    move-object v2, p1

    .line 40
    move-object v9, p3

    .line 41
    invoke-virtual/range {v1 .. v9}, Lcom/android/quickstep/views/TaskView;->createTaskContainer(Lcom/android/systemui/shared/recents/model/Task;IIIIIILcom/android/quickstep/TaskOverlayFactory;)Lcom/android/quickstep/views/TaskContainer;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v1, p0}, Lcom/android/quickstep/views/TaskView;->setTaskContainers(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p2}, Lcom/android/quickstep/views/TaskView;->onBind(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method protected cancelPendingLoadTasks()V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "TaskView.cancelPendingLoadTasks"

    .line 8
    .line 9
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->pendingThumbnailLoadRequests:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/android/launcher3/util/w;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/android/launcher3/util/w;->e()V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_2

    .line 36
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->pendingThumbnailLoadRequests:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->pendingIconLoadRequests:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_2

    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lcom/android/launcher3/util/w;

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/android/launcher3/util/w;->e()V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->pendingIconLoadRequests:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 66
    .line 67
    .line 68
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    invoke-static {}, LK0/a;->b()V

    .line 73
    .line 74
    .line 75
    :cond_3
    return-void

    .line 76
    :goto_2
    if-eqz v0, :cond_4

    .line 77
    .line 78
    invoke-static {}, LK0/a;->b()V

    .line 79
    .line 80
    .line 81
    :cond_4
    throw p0
.end method

.method public final clearRemovingActions()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mRemovingActions:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected confirmSecondSplitSelectApp()Z
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getLastSelectedChildTaskIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-lt v0, v1, :cond_0

    .line 15
    .line 16
    return v2

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    return v2

    .line 34
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {v1}, Lcom/android/quickstep/views/TaskViewIcon;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnail()Landroid/graphics/Bitmap;

    .line 51
    .line 52
    .line 53
    move-result-object v8

    .line 54
    const/4 v10, 0x0

    .line 55
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 56
    .line 57
    .line 58
    move-result-object v11

    .line 59
    const/4 v9, 0x0

    .line 60
    move-object v4, p0

    .line 61
    invoke-virtual/range {v3 .. v11}, Lcom/android/quickstep/views/RecentsView;->confirmSplitSelect(Lcom/android/quickstep/views/TaskView;Lcom/android/systemui/shared/recents/model/Task;Landroid/graphics/drawable/Drawable;Landroid/view/View;Landroid/graphics/Bitmap;Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/model/data/y;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    return p0
.end method

.method public final containsMultipleTasks()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-le p0, v0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final containsTaskId(I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->getTaskContainerById(I)Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

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

.method protected final createTaskContainer(Lcom/android/systemui/shared/recents/model/Task;IIIIIILcom/android/quickstep/TaskOverlayFactory;)Lcom/android/quickstep/views/TaskContainer;
    .locals 15

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    invoke-static {v2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "taskOverlayFactory"

    .line 9
    .line 10
    move-object/from16 v10, p8

    .line 11
    .line 12
    invoke-static {v10, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 16
    .line 17
    .line 18
    move-result v14

    .line 19
    if-eqz v14, :cond_0

    .line 20
    .line 21
    const-string v0, "TaskView.createTaskContainer"

    .line 22
    .line 23
    invoke-static {v0}, LK0/a;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    move/from16 v0, p3

    .line 27
    .line 28
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v3, "null cannot be cast to non-null type com.android.quickstep.views.TaskViewIcon"

    .line 33
    .line 34
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    move-object v4, v0

    .line 38
    check-cast v4, Lcom/android/quickstep/views/TaskViewIcon;

    .line 39
    .line 40
    move/from16 v0, p4

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    move-object v5, v0

    .line 47
    check-cast v5, Landroid/widget/TextView;

    .line 48
    .line 49
    new-instance v0, Lcom/android/quickstep/views/TaskContainer;

    .line 50
    .line 51
    move/from16 v3, p2

    .line 52
    .line 53
    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const-string v6, "findViewById(...)"

    .line 58
    .line 59
    invoke-static {v3, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    new-instance v6, Lcom/android/launcher3/util/L2;

    .line 63
    .line 64
    invoke-interface {v4}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    invoke-direct {v6, v7}, Lcom/android/launcher3/util/L2;-><init>(Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    move/from16 v7, p6

    .line 72
    .line 73
    invoke-virtual {p0, v7}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    invoke-static {v7}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    move-object v8, v7

    .line 81
    check-cast v8, Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 82
    .line 83
    move/from16 v7, p5

    .line 84
    .line 85
    invoke-virtual {p0, v7}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v9

    .line 89
    invoke-static {v9}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    const/4 v12, 0x0

    .line 93
    const/4 v13, 0x0

    .line 94
    const/4 v11, 0x0

    .line 95
    move-object v1, p0

    .line 96
    move/from16 v7, p7

    .line 97
    .line 98
    invoke-direct/range {v0 .. v13}, Lcom/android/quickstep/views/TaskContainer;-><init>(Lcom/android/quickstep/views/TaskView;Lcom/android/systemui/shared/recents/model/Task;Landroid/view/View;Lcom/android/quickstep/views/TaskViewIcon;Landroid/widget/TextView;Lcom/android/launcher3/util/L2;ILcom/android/quickstep/views/DigitalWellBeingToast;Landroid/view/View;Lcom/android/quickstep/TaskOverlayFactory;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    .line 100
    .line 101
    if-eqz v14, :cond_1

    .line 102
    .line 103
    invoke-static {}, LK0/a;->b()V

    .line 104
    .line 105
    .line 106
    :cond_1
    return-object v0

    .line 107
    :catchall_0
    move-exception v0

    .line 108
    if-eqz v14, :cond_2

    .line 109
    .line 110
    invoke-static {}, LK0/a;->b()V

    .line 111
    .line 112
    .line 113
    :cond_2
    throw v0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    const-string v0, "ev"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->isSplitSelectActive()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_4

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_3

    .line 46
    .line 47
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lcom/android/quickstep/views/TaskContainer;

    .line 52
    .line 53
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget-object v3, v3, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 58
    .line 59
    iget v3, v3, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getInitialTaskId()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-eq v3, v4, :cond_2

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_3
    :goto_0
    return v1

    .line 69
    :cond_4
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_5

    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->lastTouchDownPosition:Landroid/graphics/PointF;

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iput v1, v0, Landroid/graphics/PointF;->y:F

    .line 88
    .line 89
    :cond_5
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    return p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/BorderAnimator;->drawBorder(Landroid/graphics/Canvas;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->hoverBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/BorderAnimator;->drawBorder(Landroid/graphics/Canvas;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final getAttachAlpha()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->attachAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/util/u1;->a(Ljava/lang/Object;LB4/i;)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final getBorderEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/views/TaskView;->borderEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getConstantPx(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->M0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    int-to-float v0, v0

    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const v2, 0x7f070b33

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    float-to-int v1, v1

    .line 24
    int-to-float v1, v1

    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    div-float/2addr p0, v1

    .line 34
    mul-float/2addr p0, v0

    .line 35
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method protected final getContainer()Lcom/android/quickstep/views/RecentsViewContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getDismissIconFadeInAnimator()Landroid/animation/ObjectAnimator;
    .locals 4

    .line 1
    sget-object v0, Lcom/android/quickstep/views/TaskView;->SETTLED_PROGRESS_DISMISS:Landroid/util/FloatProperty;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    new-array v1, v1, [F

    .line 5
    .line 6
    const/high16 v2, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    aput v2, v1, v3

    .line 10
    .line 11
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-wide/16 v0, 0x78

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/android/quickstep/views/TaskView;->FADE_IN_ICON_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 23
    .line 24
    .line 25
    const-string v0, "apply(...)"

    .line 26
    .line 27
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method public final getDismissIconFadeOutAnimator()Landroid/animation/ObjectAnimator;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/views/q2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/q2;-><init>(Lcom/android/quickstep/views/TaskView;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    .line 9
    .line 10
    .line 11
    const/high16 p0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "animateToValue(...)"

    .line 19
    .line 20
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method public getDisplayId()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Li4/m;->d0(Ljava/util/List;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/quickstep/views/TaskContainer;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-static {p0}, Lcom/android/quickstep/util/ExternalDisplaysKt;->getSafeDisplayId(Lcom/android/systemui/shared/recents/model/Task;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public final getFirstItemInfo()Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public final getFirstTask()Lcom/android/systemui/shared/recents/model/Task;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public final getFirstTaskContainer()Lcom/android/quickstep/views/TaskContainer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Li4/m;->d0(Ljava/util/List;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/quickstep/views/TaskContainer;

    .line 10
    .line 11
    return-object p0
.end method

.method protected final getFullscreenProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->fullscreenProgress:F

    .line 2
    .line 3
    return p0
.end method

.method public final getGRID_TO_SINGLE_DEFAULT_SCALE()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->GRID_TO_SINGLE_DEFAULT_SCALE:F

    .line 2
    .line 3
    return p0
.end method

.method protected final getGridProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->gridProgress:F

    .line 2
    .line 3
    return p0
.end method

.method protected final getGridToSingleScale()F
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->GRID_TO_SINGLE_DEFAULT_SCALE:F

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getGridToSingleScale()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    return v0
.end method

.method public final getGridTranslationSecondary()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->gridTranslationX:F

    .line 6
    .line 7
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->gridTranslationY:F

    .line 8
    .line 9
    invoke-interface {v0, v1, p0}, Lcom/android/launcher3/touch/G;->getSecondaryValue(FF)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method protected final getGridTranslationX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->gridTranslationX:F

    .line 2
    .line 3
    return p0
.end method

.method public final getGridTranslationY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->gridTranslationY:F

    .line 2
    .line 3
    return p0
.end method

.method public final getIconSize(Lcom/android/launcher3/h0;)F
    .locals 3

    .line 1
    const-string v0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const v2, 0x7f070b53

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {v0, v1}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-float v0, v0

    .line 26
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->GRID_TO_SINGLE_DEFAULT_SCALE:F

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getGridToSingleScale()F

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    const/4 v2, 0x1

    .line 69
    if-gt v1, v2, :cond_1

    .line 70
    .line 71
    iget p1, p1, Lcom/android/launcher3/X3;->w0:I

    .line 72
    .line 73
    int-to-float p1, p1

    .line 74
    mul-float/2addr v0, p1

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    iget p1, p1, Lcom/android/launcher3/X3;->w0:I

    .line 77
    .line 78
    int-to-float v0, p1

    .line 79
    :cond_2
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_4

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_3

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const p1, 0x7f070a23

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    :goto_1
    float-to-int p0, p0

    .line 107
    int-to-float p0, p0

    .line 108
    return p0

    .line 109
    :cond_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const p1, 0x7f070a22

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    goto :goto_1

    .line 121
    :cond_4
    return v0
.end method

.method public final getItemInfo()Lcom/android/launcher3/model/data/E;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/E;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/model/data/E;-><init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method protected getLastSelectedChildTaskIndex()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected final getLastTouchDownPosition()Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->lastTouchDownPosition:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final getMIsLockShown()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/views/TaskView;->mIsLockShown:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getMIsSkipContentAlphaChange()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/views/TaskView;->mIsSkipContentAlphaChange:Z

    .line 2
    .line 3
    return p0
.end method

.method protected final getMIsTitleHidden()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/views/TaskView;->mIsTitleHidden:Z

    .line 2
    .line 3
    return p0
.end method

.method protected final getMMenuButton()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final getMMiniWindowButton()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final getMSplitScreenButton()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final getMSplitScreenGroupShortcutsItem()Lcom/android/launcher3/model/data/I;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenGroupShortcutsItem:Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final getMTitleAnimator()Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mTitleAnimator:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getModalPivot()Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->modalPivot:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getModalScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->modalScale:F

    .line 2
    .line 3
    return p0
.end method

.method protected final getModalness()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->modalness:F

    .line 2
    .line 3
    return p0
.end method

.method protected final getNonGridScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->nonGridScale:F

    .line 2
    .line 3
    return p0
.end method

.method protected final getNonGridTranslationX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->nonGridTranslationX:F

    .line 2
    .line 3
    return p0
.end method

.method public final getOffsetAdjustment(Z)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->getScrollAdjustment(Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final getOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->orientedState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "orientedState"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "getOrientationHandler(...)"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method protected final getPersistentScale()F
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->gridProgress:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->nonGridScale:F

    .line 4
    .line 5
    const/high16 v2, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackScale:F

    mul-float/2addr v0, v1

    return v0
.end method

.method protected final getPersistentTranslationX()F
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->nonGridTranslationX:F

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->getNonGridTrans(F)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->gridTranslationX:F

    .line 8
    .line 9
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/TaskView;->getGridTrans(F)F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-float/2addr v0, v1

    iget v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTranslationX:F

    add-float/2addr v0, v1

    .line 14
    return v0
.end method

.method public final getPersistentTranslationY()F
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->boxTranslationY:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->gridTranslationY:F

    .line 4
    .line 5
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/TaskView;->getGridTrans(F)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-float/2addr v0, v1

    iget v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTranslationY:F

    add-float/2addr v0, v1

    .line 10
    return v0
.end method

.method public final getPrimaryDismissTranslationProperty()Landroid/util/FloatProperty;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/quickstep/views/TaskView;->DISMISS_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 6
    .line 7
    sget-object v1, Lcom/android/quickstep/views/TaskView;->DISMISS_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 8
    .line 9
    invoke-interface {p0, v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/util/FloatProperty;

    .line 14
    .line 15
    return-object p0
.end method

.method protected final getPrimarySplitTranslationProperty()Landroid/util/FloatProperty;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/quickstep/views/TaskView;->SPLIT_SELECT_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 6
    .line 7
    sget-object v1, Lcom/android/quickstep/views/TaskView;->SPLIT_SELECT_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 8
    .line 9
    invoke-interface {p0, v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/util/FloatProperty;

    .line 14
    .line 15
    return-object p0
.end method

.method protected final getPrimaryTaskOffsetTranslationProperty()Landroid/util/FloatProperty;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/quickstep/views/TaskView;->TASK_OFFSET_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 6
    .line 7
    sget-object v1, Lcom/android/quickstep/views/TaskView;->TASK_OFFSET_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 8
    .line 9
    invoke-interface {p0, v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/util/FloatProperty;

    .line 14
    .line 15
    return-object p0
.end method

.method public final getRecentsView()Lcom/android/quickstep/views/RecentsView;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public final getResourceManagerProxy()Lcom/android/launcher3/resource/g0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->resourceManagerProxy:Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final getScrollAdjustment(Z)I
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->gridTranslationX:F

    .line 8
    .line 9
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->gridTranslationY:F

    .line 10
    .line 11
    invoke-interface {p1, v0, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(FF)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    :goto_0
    float-to-int p0, p0

    .line 16
    return p0

    .line 17
    :cond_0
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->nonGridTranslationX:F

    .line 18
    .line 19
    goto :goto_0
.end method

.method public final getSecondaryDismissTranslationProperty()Landroid/util/FloatProperty;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/quickstep/views/TaskView;->DISMISS_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 6
    .line 7
    sget-object v1, Lcom/android/quickstep/views/TaskView;->DISMISS_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 8
    .line 9
    invoke-interface {p0, v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/util/FloatProperty;

    .line 14
    .line 15
    return-object p0
.end method

.method protected final getSecondarySplitTranslationProperty()Landroid/util/FloatProperty;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/quickstep/views/TaskView;->SPLIT_SELECT_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 6
    .line 7
    sget-object v1, Lcom/android/quickstep/views/TaskView;->SPLIT_SELECT_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 8
    .line 9
    invoke-interface {p0, v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/util/FloatProperty;

    .line 14
    .line 15
    return-object p0
.end method

.method protected final getSecondaryTaskOffsetTranslationProperty()Landroid/util/FloatProperty;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/quickstep/views/TaskView;->TASK_OFFSET_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 6
    .line 7
    sget-object v1, Lcom/android/quickstep/views/TaskView;->TASK_OFFSET_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 8
    .line 9
    invoke-interface {p0, v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/util/FloatProperty;

    .line 14
    .line 15
    return-object p0
.end method

.method protected final getShouldShowScreenshot()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/quickstep/views/TaskView;->shouldShowScreenshot:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public final getSizeAdjustment(Z)F
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->nonGridScale:F

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    return p0
.end method

.method public final getSnapshotViews()[Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    invoke-static {p0, v1}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    new-array p0, p0, [Landroid/view/View;

    .line 42
    .line 43
    invoke-interface {v0, p0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, [Landroid/view/View;

    .line 48
    .line 49
    return-object p0
.end method

.method public final getSplitAlpha()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->splitAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/util/u1;->a(Ljava/lang/Object;LB4/i;)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final getSplitSplashAlpha()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->splitSplashAlpha:F

    .line 2
    .line 3
    return p0
.end method

.method protected final getStableAlpha()F
    .locals 0

    # Keep the native alpha contract independent from the visual stack alpha.
    # This prevents native animations that read then write stableAlpha from
    # multiplying the stack fade into themselves on every frame.
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->nativeStableAlpha:F

    return p0
.end method

.method public final getSysUiStatusNavFlags()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->sysUiStatusNavFlags:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->getSysUiStatusNavFlags()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final getTaskContainerById(I)Lcom/android/quickstep/views/TaskContainer;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    move-object v1, v0

    .line 20
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 27
    .line 28
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 29
    .line 30
    if-ne v1, p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v0, 0x0

    .line 34
    :goto_0
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 35
    .line 36
    return-object v0
.end method

.method public final getTaskContainers()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/quickstep/views/TaskContainer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->taskContainers:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "taskContainers"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getTaskIdSet()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    invoke-static {p0, v1}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 37
    .line 38
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 39
    .line 40
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-static {v0}, Li4/m;->I0(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public final getTaskIds()[I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    invoke-static {p0, v1}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 37
    .line 38
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 39
    .line 40
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-static {v0}, Li4/m;->D0(Ljava/util/Collection;)[I

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method protected final getTaskResistanceTranslationProperty()Landroid/util/FloatProperty;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/quickstep/views/TaskView;->TASK_RESISTANCE_TRANSLATION_X:Landroid/util/FloatProperty;

    .line 6
    .line 7
    sget-object v1, Lcom/android/quickstep/views/TaskView;->TASK_RESISTANCE_TRANSLATION_Y:Landroid/util/FloatProperty;

    .line 8
    .line 9
    invoke-interface {p0, v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/util/FloatProperty;

    .line 14
    .line 15
    return-object p0
.end method

.method protected final getTaskThumbnailSplashAlpha()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->taskThumbnailSplashAlpha:F

    .line 2
    .line 3
    return p0
.end method

.method public final getTaskViewId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->taskViewId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getTextPaddingLeft()F
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const v2, 0x7f0703fc

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {v0, v1}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->GRID_TO_SINGLE_DEFAULT_SCALE:F

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getGridToSingleScale()F

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->shouldInflateGridStyle()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const v2, 0x7f0703fd

    .line 51
    .line 52
    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-static {v0, v1}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    int-to-float v0, v0

    .line 72
    goto :goto_0

    .line 73
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-static {v1, v2}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    int-to-float v1, v1

    .line 90
    mul-float/2addr v1, v0

    .line 91
    move v0, v1

    .line 92
    :cond_2
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_3

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-nez v1, :cond_3

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const v0, 0x7f070a21

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    float-to-int p0, p0

    .line 120
    int-to-float p0, p0

    .line 121
    return p0

    .line 122
    :cond_3
    return v0
.end method

.method public final getTextSize()F
    .locals 4

    .line 1
    const v0, 0x7f070b2f

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->getConstantPx(I)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    int-to-float v0, v0

    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->GRID_TO_SINGLE_DEFAULT_SCALE:F

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getGridToSingleScale()F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const v2, 0x7f0703f5

    .line 39
    .line 40
    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    const/4 v3, 0x1

    .line 55
    if-gt v1, v3, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-static {v1, v2}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    int-to-float v1, v1

    .line 74
    mul-float/2addr v0, v1

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-static {v0, v1}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    int-to-float v0, v0

    .line 93
    :cond_2
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_4

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_3

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const v0, 0x7f070a25

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    :goto_1
    float-to-int p0, p0

    .line 121
    int-to-float p0, p0

    .line 122
    return p0

    .line 123
    :cond_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    const v0, 0x7f070a24

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    goto :goto_1

    .line 135
    :cond_4
    return v0
.end method

.method public final getThumbnailBounds(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    const-string v0, "bounds"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lcom/android/quickstep/views/TaskView;->getThumbnailBounds$default(Lcom/android/quickstep/views/TaskView;Landroid/graphics/Rect;ZILjava/lang/Object;)V

    return-void
.end method

.method public getThumbnailBounds(Landroid/graphics/Rect;Z)V
    .locals 4

    const-string v0, "bounds"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    move-result-object v0

    .line 4
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 5
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    if-eqz p2, :cond_0

    .line 6
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v3}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    move-result-object v3

    .line 7
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    move-result-object v1

    .line 8
    invoke-virtual {v3, v1, v2}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    goto :goto_1

    .line 9
    :cond_0
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    move-result-object v1

    invoke-static {v2, v1}, Lj2/a;->b(Landroid/graphics/Rect;Landroid/view/View;)V

    .line 10
    :goto_1
    invoke-virtual {p1, v2}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected final getThumbnailFullscreenParams()Lcom/android/quickstep/FullscreenDrawParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->thumbnailFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getType()Lcom/android/quickstep/views/TaskViewType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->type:Lcom/android/quickstep/views/TaskViewType;

    .line 2
    .line 3
    return-object p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected inflateViewStubs()V
    .locals 2

    .line 1
    const v0, 0x7f0b0565

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/view/ViewStub;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const v1, 0x7f0e0221

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const v1, 0x7f0e0222

    .line 23
    .line 24
    .line 25
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    :cond_1
    const v0, 0x7f0b02fc

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Landroid/view/ViewStub;

    .line 39
    .line 40
    if-eqz p0, :cond_3

    .line 41
    .line 42
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    const v0, 0x7f0e0107

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    const v0, 0x7f0e0108

    .line 53
    .line 54
    .line 55
    :goto_1
    invoke-virtual {p0, v0}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    :cond_3
    return-void
.end method

.method public final isEndQuickSwitchCuj()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/views/TaskView;->isEndQuickSwitchCuj:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isExternalDisplay()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Lcom/android/quickstep/util/ExternalDisplaysKt;->isExternalDisplay(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method protected final isGridSingleTask()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    const/4 v0, 0x1

    .line 25
    if-ne p0, v0, :cond_0

    .line 26
    .line 27
    return v0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public final isGridTask()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/X3;->b()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public final isLargeTile()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final isRunningTask()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    if-ne p0, v0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public launchAsStaticTile()Lcom/android/launcher3/util/Y1;
    .locals 8

    .line 1
    const-string v0, "getDisplay(...)"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    return-object v2

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v3}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v4, "toString(...)"

    .line 20
    .line 21
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v5, "Main"

    .line 25
    .line 26
    const-string v6, "startActivityFromRecentsAsync"

    .line 27
    .line 28
    invoke-static {v5, v6, v3}, Lcom/android/launcher3/testing/K;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 32
    .line 33
    invoke-interface {v3, p0, v2}, Lcom/android/quickstep/views/RecentsViewContainer;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    :try_start_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    const-string v6, "display"

    .line 42
    .line 43
    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    const-string v6, "null cannot be cast to non-null type android.hardware.display.DisplayManager"

    .line 48
    .line 49
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    check-cast v5, Landroid/hardware/display/DisplayManager;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getDisplayId()I

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    invoke-virtual {v5, v6}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getDisplay()Landroid/view/Display;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-static {v6, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, v3, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 73
    .line 74
    if-eqz v6, :cond_1

    .line 75
    .line 76
    if-eqz v5, :cond_1

    .line 77
    .line 78
    const-string v7, "dsp_virtual_display"

    .line 79
    .line 80
    invoke-virtual {v5}, Landroid/view/Display;->getName()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    if-eqz v5, :cond_1

    .line 89
    .line 90
    invoke-virtual {v6}, Landroid/view/Display;->getDisplayId()I

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    goto :goto_0

    .line 95
    :catch_0
    move-exception v0

    .line 96
    goto :goto_1

    .line 97
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getDisplayId()I

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    :goto_0
    invoke-virtual {v0, v5}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .line 103
    .line 104
    goto :goto_2

    .line 105
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 106
    .line 107
    .line 108
    iget-object v0, v3, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getDisplayId()I

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    invoke-virtual {v0, v5}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;

    .line 115
    .line 116
    .line 117
    :goto_2
    const-string v0, "apply(...)"

    .line 118
    .line 119
    invoke-static {v3, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 131
    .line 132
    iget-object v5, v3, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 133
    .line 134
    invoke-virtual {v0, v1, v5}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->startActivityFromRecents(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/ActivityOptions;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-eqz v0, :cond_4

    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-static {v0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {v0, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    new-instance v1, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 154
    .line 155
    .line 156
    const-string v4, "launchAsStaticTile - startActivityFromRecents: "

    .line 157
    .line 158
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    const-string v1, "TaskView"

    .line 169
    .line 170
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    sget-object v0, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    .line 174
    .line 175
    sget-object v1, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->EXPECTING_TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 176
    .line 177
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/ActiveGestureLog;->trackEvent(Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    if-nez p0, :cond_2

    .line 185
    .line 186
    return-object v2

    .line 187
    :cond_2
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 188
    .line 189
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_3

    .line 194
    .line 195
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskViewId()I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    const/4 v1, -0x1

    .line 200
    if-eq v0, v1, :cond_3

    .line 201
    .line 202
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 203
    .line 204
    if-eqz v0, :cond_3

    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->onTaskLaunchedInLiveTileMode()V

    .line 207
    .line 208
    .line 209
    new-instance v0, Lcom/android/launcher3/util/Y1;

    .line 210
    .line 211
    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->addSideTaskLaunchCallback(Lcom/android/launcher3/util/Y1;)V

    .line 215
    .line 216
    .line 217
    return-object v0

    .line 218
    :cond_3
    iget-object v0, v3, Lcom/android/launcher3/util/b;->b:Lcom/android/launcher3/util/Y1;

    .line 219
    .line 220
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->addSideTaskLaunchCallback(Lcom/android/launcher3/util/Y1;)V

    .line 221
    .line 222
    .line 223
    iget-object p0, v3, Lcom/android/launcher3/util/b;->b:Lcom/android/launcher3/util/Y1;

    .line 224
    .line 225
    return-object p0

    .line 226
    :cond_4
    const-string v0, "launchAsStaticTile"

    .line 227
    .line 228
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->notifyTaskLaunchFailed(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    return-object v2
.end method

.method public final launchWithAnimation()Lcom/android/launcher3/util/Y1;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move-object v0, v1

    .line 20
    :goto_0
    if-eqz v0, :cond_2

    .line 21
    .line 22
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 23
    .line 24
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :cond_1
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/TaskView;->launchAsLiveTile([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/launcher3/util/Y1;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->launchAsStaticTile()Lcom/android/launcher3/util/Y1;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public final launchWithoutAnimation(Lu4/l;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "callback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, v2, p1, v0, v1}, Lcom/android/quickstep/views/TaskView;->launchWithoutAnimation$default(Lcom/android/quickstep/views/TaskView;ZLu4/l;ILjava/lang/Object;)V

    return-void
.end method

.method public launchWithoutAnimation(ZLu4/l;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lu4/l<",
            "-",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    const-string v0, "callback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 3
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "toString(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    const-string v2, "Main"

    const-string v3, "startActivityFromRecentsAsync"

    invoke-static {v2, v3, v1}, Lcom/android/launcher3/testing/K;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 5
    new-instance v1, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;-><init>(Landroid/content/Context;)V

    if-eqz p1, :cond_1

    .line 6
    iget-object v2, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v3

    iget-object v3, v3, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    iget v3, v3, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    new-instance v4, Lcom/android/quickstep/views/i2;

    invoke-direct {v4, p0}, Lcom/android/quickstep/views/i2;-><init>(Lcom/android/quickstep/views/TaskView;)V

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;->register(Lcom/android/quickstep/views/RecentsViewContainer;ILjava/lang/Runnable;)V

    .line 7
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    .line 8
    sget-object v2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    invoke-virtual {v2}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    move-result-object v8

    .line 9
    new-instance v9, Lcom/android/quickstep/views/j2;

    invoke-direct {v9, p2}, Lcom/android/quickstep/views/j2;-><init>(Lu4/l;)V

    new-instance v10, Lcom/android/quickstep/views/k2;

    invoke-direct {v10, v1}, Lcom/android/quickstep/views/k2;-><init>(Lcom/android/quickstep/util/TaskRemovedDuringLaunchListener;)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v5 .. v10}, Landroid/app/ActivityOptions;->makeCustomTaskAnimation(Landroid/content/Context;IILandroid/os/Handler;Landroid/app/ActivityOptions$OnAnimationStartedListener;Landroid/app/ActivityOptions$OnAnimationFinishedListener;)Landroid/app/ActivityOptions;

    move-result-object v1

    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getDisplay()Landroid/view/Display;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/view/Display;->getDisplayId()I

    move-result v2

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v1, v2}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;

    if-eqz p1, :cond_3

    .line 11
    invoke-virtual {v1}, Landroid/app/ActivityOptions;->setFreezeRecentTasksReordering()V

    .line 12
    :cond_3
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getShouldShowSplashView()Z

    move-result p1

    invoke-virtual {v1, p1}, Landroid/app/ActivityOptions;->setDisableStartingWindow(Z)V

    .line 13
    const-string p1, "apply(...)"

    invoke-static {v1, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    new-instance v2, Lcom/android/quickstep/views/l2;

    invoke-direct {v2, v0, v1, p0, p2}, Lcom/android/quickstep/views/l2;-><init>(Lcom/android/quickstep/views/TaskContainer;Landroid/app/ActivityOptions;Lcom/android/quickstep/views/TaskView;Lu4/l;)V

    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected needsUpdate(II)Z
    .locals 0

    .line 1
    and-int p0, p1, p2

    .line 2
    .line 3
    if-ne p0, p2, :cond_0

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

.method protected final notifyTaskLaunchFailed(Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "launchMethod"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "toString(...)"

    .line 17
    .line 18
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, " - Failed to launch task: "

    .line 30
    .line 31
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p1, "\n"

    .line 38
    .line 39
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_0

    .line 62
    .line 63
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget-object v2, v2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 74
    .line 75
    iget-object v2, v2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->baseIntent:Landroid/content/Intent;

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 82
    .line 83
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 84
    .line 85
    new-instance v3, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    const-string v4, "(task="

    .line 91
    .line 92
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v2, " userId="

    .line 99
    .line 100
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v1, ")\n"

    .line 107
    .line 108
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_0
    const-string p1, "TaskView"

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    const p1, 0x7f140046

    .line 133
    .line 134
    .line 135
    const/4 v0, 0x0

    .line 136
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public offerTouchToChildren(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->tempCoordinates:[F

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getIconTouchDelegate()Lcom/android/launcher3/util/L2;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-direct {p0, v2, v3, v4}, Lcom/android/quickstep/views/TaskView;->computeAndSetIconTouchDelegate(Lcom/android/quickstep/views/TaskViewIcon;[FLcom/android/launcher3/util/L2;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getIconTouchDelegate()Lcom/android/launcher3/util/L2;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/L2;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_1
    const/4 p0, 0x0

    .line 58
    return p0
.end method

.method protected onAttachedToWindow()V
    .locals 8

    .line 1
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const-string v0, "TaskView.onAttachedToWindow"

    .line 8
    .line 9
    invoke-static {v0}, LK0/a;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->coroutineJobs:Ljava/util/List;

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->getCoroutineScope()LF4/I;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->getDispatcherProvider()Li2/b;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-interface {v3}, Li2/b;->b()LF4/E;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    new-instance v5, Lcom/android/quickstep/views/TaskView$onAttachedToWindow$1$1;

    .line 36
    .line 37
    const/4 v4, 0x0

    .line 38
    invoke-direct {v5, p0, v4}, Lcom/android/quickstep/views/TaskView$onAttachedToWindow$1$1;-><init>(Lcom/android/quickstep/views/TaskView;Ll4/d;)V

    .line 39
    .line 40
    .line 41
    const/4 v6, 0x2

    .line 42
    const/4 v7, 0x0

    .line 43
    const/4 v4, 0x0

    .line 44
    invoke-static/range {v2 .. v7}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {v0, p0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception v0

    .line 53
    move-object p0, v0

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    invoke-static {}, LK0/a;->b()V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void

    .line 63
    :goto_1
    if-eqz v1, :cond_3

    .line 64
    .line 65
    invoke-static {}, LK0/a;->b()V

    .line 66
    .line 67
    .line 68
    :cond_3
    throw p0
.end method

.method protected onBind(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "orientedState"

    .line 4
    .line 5
    move-object/from16 v2, p1

    .line 6
    .line 7
    invoke-static {v2, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    const-string v3, "TaskView.onBind"

    .line 17
    .line 18
    invoke-static {v3}, LK0/a;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    :try_start_0
    const-string v3, "TaskView.onBind.createViewModel"

    .line 22
    .line 23
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-eqz v4, :cond_1

    .line 28
    .line 29
    invoke-static {v3}, LK0/a;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    move/from16 v16, v1

    .line 35
    .line 36
    goto/16 :goto_5

    .line 37
    .line 38
    :cond_1
    :goto_0
    :try_start_1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_2

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const-string v5, "TaskView"

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/android/quickstep/util/RecentsOrientedState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    new-instance v7, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v8, "onBind "

    .line 60
    .line 61
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v8, " "

    .line 68
    .line 69
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    new-instance v7, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 83
    .line 84
    iget-object v8, v0, Lcom/android/quickstep/views/TaskView;->type:Lcom/android/quickstep/views/TaskViewType;

    .line 85
    .line 86
    sget-object v5, Lcom/android/quickstep/recents/di/RecentsDependencies;->Companion:Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;

    .line 87
    .line 88
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    new-instance v6, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 92
    .line 93
    const/4 v9, 0x1

    .line 94
    const/4 v10, 0x0

    .line 95
    invoke-direct {v6, v10, v9, v10}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 99
    .line 100
    .line 101
    move-result v11

    .line 102
    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v11

    .line 106
    invoke-virtual {v5}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 107
    .line 108
    .line 109
    move-result-object v12

    .line 110
    const-class v13, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 111
    .line 112
    invoke-virtual {v12, v13, v11, v6, v10}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    check-cast v6, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 117
    .line 118
    new-instance v11, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 119
    .line 120
    invoke-direct {v11, v10, v9, v10}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 124
    .line 125
    .line 126
    move-result v12

    .line 127
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v12

    .line 131
    invoke-virtual {v5}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 132
    .line 133
    .line 134
    move-result-object v13

    .line 135
    const-class v14, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;

    .line 136
    .line 137
    invoke-virtual {v13, v14, v12, v11, v10}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v11

    .line 141
    check-cast v11, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;

    .line 142
    .line 143
    new-instance v12, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 144
    .line 145
    invoke-direct {v12, v10, v9, v10}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 149
    .line 150
    .line 151
    move-result v13

    .line 152
    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v13

    .line 156
    invoke-virtual {v5}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 157
    .line 158
    .line 159
    move-result-object v14

    .line 160
    const-class v15, Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;

    .line 161
    .line 162
    invoke-virtual {v14, v15, v13, v12, v10}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v12

    .line 166
    check-cast v12, Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;

    .line 167
    .line 168
    new-instance v13, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 169
    .line 170
    invoke-direct {v13, v10, v9, v10}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 174
    .line 175
    .line 176
    move-result v14

    .line 177
    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v14

    .line 181
    invoke-virtual {v5}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 182
    .line 183
    .line 184
    move-result-object v15

    .line 185
    const-class v9, Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;

    .line 186
    .line 187
    invoke-virtual {v15, v9, v14, v13, v10}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v9

    .line 191
    check-cast v9, Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;

    .line 192
    .line 193
    new-instance v13, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 194
    .line 195
    const/4 v14, 0x1

    .line 196
    invoke-direct {v13, v10, v14, v10}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 200
    .line 201
    .line 202
    move-result v14

    .line 203
    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v14

    .line 207
    invoke-virtual {v5}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 208
    .line 209
    .line 210
    move-result-object v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 211
    move/from16 v16, v1

    .line 212
    .line 213
    :try_start_2
    const-class v1, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;

    .line 214
    .line 215
    invoke-virtual {v15, v1, v14, v13, v10}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    move-object v13, v1

    .line 220
    check-cast v13, Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;

    .line 221
    .line 222
    new-instance v1, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 223
    .line 224
    const/4 v14, 0x1

    .line 225
    invoke-direct {v1, v10, v14, v10}, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/j;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 229
    .line 230
    .line 231
    move-result v3

    .line 232
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v3

    .line 236
    invoke-virtual {v5}, Lcom/android/quickstep/recents/di/RecentsDependencies$Companion;->getInstance()Lcom/android/quickstep/recents/di/RecentsDependencies;

    .line 237
    .line 238
    .line 239
    move-result-object v5

    .line 240
    const-class v14, Li2/b;

    .line 241
    .line 242
    invoke-virtual {v5, v14, v3, v1, v10}, Lcom/android/quickstep/recents/di/RecentsDependencies;->inject(Ljava/lang/Class;Ljava/lang/String;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;Lu4/l;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    move-object v14, v1

    .line 247
    check-cast v14, Li2/b;

    .line 248
    .line 249
    move-object v10, v11

    .line 250
    move-object v11, v12

    .line 251
    move-object v12, v9

    .line 252
    move-object v9, v6

    .line 253
    invoke-direct/range {v7 .. v14}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;-><init>(Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/recents/viewmodel/RecentsViewData;Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;Li2/b;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    array-length v3, v1

    .line 261
    invoke-static {v1, v3}, Ljava/util/Arrays;->copyOf([II)[I

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-virtual {v7, v1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->bind([I)V

    .line 266
    .line 267
    .line 268
    iput-object v7, v0, Lcom/android/quickstep/views/TaskView;->viewModel:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 269
    .line 270
    goto :goto_1

    .line 271
    :catchall_1
    move-exception v0

    .line 272
    goto :goto_4

    .line 273
    :catchall_2
    move-exception v0

    .line 274
    move/from16 v16, v1

    .line 275
    .line 276
    goto :goto_4

    .line 277
    :cond_2
    move/from16 v16, v1

    .line 278
    .line 279
    :goto_1
    sget-object v1, Lh4/t;->a:Lh4/t;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 280
    .line 281
    if-eqz v4, :cond_3

    .line 282
    .line 283
    :try_start_3
    invoke-static {}, LK0/a;->b()V

    .line 284
    .line 285
    .line 286
    goto :goto_2

    .line 287
    :catchall_3
    move-exception v0

    .line 288
    goto :goto_5

    .line 289
    :cond_3
    :goto_2
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    :cond_4
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 298
    .line 299
    .line 300
    move-result v3

    .line 301
    if-eqz v3, :cond_5

    .line 302
    .line 303
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v3

    .line 307
    check-cast v3, Lcom/android/quickstep/views/TaskContainer;

    .line 308
    .line 309
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->bind()V

    .line 310
    .line 311
    .line 312
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 313
    .line 314
    .line 315
    move-result v4

    .line 316
    if-eqz v4, :cond_4

    .line 317
    .line 318
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 319
    .line 320
    .line 321
    move-result-object v4

    .line 322
    iget-object v5, v0, Lcom/android/quickstep/views/TaskView;->thumbnailFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    .line 323
    .line 324
    invoke-virtual {v5}, Lcom/android/quickstep/FullscreenDrawParams;->getCurrentCornerRadius()F

    .line 325
    .line 326
    .line 327
    move-result v5

    .line 328
    invoke-virtual {v4, v5}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->setCornerRadius(F)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    .line 332
    .line 333
    .line 334
    move-result-object v4

    .line 335
    new-instance v5, Lcom/android/quickstep/views/w2;

    .line 336
    .line 337
    invoke-direct {v5, v0, v3}, Lcom/android/quickstep/views/w2;-><init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {v4, v5}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->doOnSizeChange(Lu4/p;)V

    .line 341
    .line 342
    .line 343
    goto :goto_3

    .line 344
    :cond_5
    invoke-virtual/range {p0 .. p1}, Lcom/android/quickstep/views/TaskView;->setOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 345
    .line 346
    .line 347
    sget-object v0, Lh4/t;->a:Lh4/t;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 348
    .line 349
    if-eqz v16, :cond_6

    .line 350
    .line 351
    invoke-static {}, LK0/a;->b()V

    .line 352
    .line 353
    .line 354
    :cond_6
    return-void

    .line 355
    :goto_4
    if-eqz v4, :cond_7

    .line 356
    .line 357
    :try_start_4
    invoke-static {}, LK0/a;->b()V

    .line 358
    .line 359
    .line 360
    :cond_7
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 361
    :goto_5
    if-eqz v16, :cond_8

    .line 362
    .line 363
    invoke-static {}, LK0/a;->b()V

    .line 364
    .line 365
    .line 366
    :cond_8
    throw v0
.end method

.method protected onDetachedFromWindow()V
    .locals 9

    .line 1
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const-string v0, "TaskView.onDetachedFromWindow"

    .line 8
    .line 9
    invoke-static {v0}, LK0/a;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mRemovingActions:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mRemovingActions:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v2, "iterator(...)"

    .line 27
    .line 28
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "next(...)"

    .line 42
    .line 43
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    check-cast v2, Ljava/lang/Runnable;

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception v0

    .line 53
    move-object p0, v0

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mRemovingActions:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 58
    .line 59
    .line 60
    :cond_2
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->coroutineJobs:Ljava/util/List;

    .line 70
    .line 71
    invoke-static {v0}, Li4/m;->E0(Ljava/lang/Iterable;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v2, p0, Lcom/android/quickstep/views/TaskView;->coroutineJobs:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->getCoroutineScope()LF4/I;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->getDispatcherProvider()Li2/b;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p0}, Li2/b;->getBackground()LF4/E;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    new-instance v6, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;

    .line 93
    .line 94
    const/4 p0, 0x0

    .line 95
    invoke-direct {v6, v0, p0}, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;-><init>(Ljava/util/List;Ll4/d;)V

    .line 96
    .line 97
    .line 98
    const/4 v7, 0x2

    .line 99
    const/4 v8, 0x0

    .line 100
    const/4 v5, 0x0

    .line 101
    invoke-static/range {v3 .. v8}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 102
    .line 103
    .line 104
    :cond_3
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    .line 106
    if-eqz v1, :cond_4

    .line 107
    .line 108
    invoke-static {}, LK0/a;->b()V

    .line 109
    .line 110
    .line 111
    :cond_4
    return-void

    .line 112
    :goto_1
    if-eqz v1, :cond_5

    .line 113
    .line 114
    invoke-static {}, LK0/a;->b()V

    .line 115
    .line 116
    .line 117
    :cond_5
    throw p0
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->inflateViewStubs()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->initViewMFV()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p0, Lcom/android/quickstep/views/TaskView;->borderEnabled:Z

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/BorderAnimator;->setBorderVisibility(ZZ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method protected onFullscreenProgressChanged(F)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 20
    .line 21
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const/high16 v3, 0x3f800000    # 1.0f

    .line 32
    .line 33
    cmpg-float v3, p1, v3

    .line 34
    .line 35
    if-gez v3, :cond_0

    .line 36
    .line 37
    iget-boolean v3, p0, Lcom/android/quickstep/views/TaskView;->mIsTitleHidden:Z

    .line 38
    .line 39
    if-nez v3, :cond_0

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    const/4 v3, 0x4

    .line 44
    :goto_1
    invoke-interface {v2, v3}, Lcom/android/quickstep/views/TaskViewIcon;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getOverlay()Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1, p1}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->setFullscreenProgress(F)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    sget-object v0, Lcom/android/quickstep/views/TaskView;->SETTLED_PROGRESS_FAST_OUT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    int-to-float v1, v1

    .line 59
    sub-float/2addr v1, p1

    .line 60
    invoke-interface {v0, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setSettledProgressFullscreen(F)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->updateFullscreenParams()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->borderEnabled:Z

    .line 7
    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x7

    .line 15
    if-eq v0, v1, :cond_3

    .line 16
    .line 17
    const/16 v1, 0x9

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    const/16 v1, 0xa

    .line 23
    .line 24
    if-eq v0, v1, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    invoke-direct {p0, v2}, Lcom/android/quickstep/views/TaskView;->setHoverBorderVisible(Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    invoke-static {}, Lcom/android/launcher3/y0;->B()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->thumbnailBounds:Landroid/graphics/Rect;

    .line 38
    .line 39
    const/4 v1, 0x2

    .line 40
    const/4 v3, 0x0

    .line 41
    invoke-static {p0, v0, v2, v1, v3}, Lcom/android/quickstep/views/TaskView;->getThumbnailBounds$default(Lcom/android/quickstep/views/TaskView;Landroid/graphics/Rect;ZILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->isWithinThumbnailBounds(Landroid/view/MotionEvent;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const/4 v0, 0x1

    .line 50
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setHoverBorderVisible(Z)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_3
    invoke-static {}, Lcom/android/launcher3/y0;->B()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->isWithinThumbnailBounds(Landroid/view/MotionEvent;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setHoverBorderVisible(Z)V

    .line 65
    .line 66
    .line 67
    :cond_4
    :goto_1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onHoverEvent(Landroid/view/MotionEvent;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    return p0
.end method

.method protected onIconLoaded(Lcom/android/quickstep/views/TaskContainer;)V
    .locals 1

    .line 1
    const-string v0, "taskContainer"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/views/TaskView;->setIconAndTitle(Lcom/android/quickstep/views/TaskContainer;Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {p0, v0}, Lcom/android/quickstep/views/TaskViewIcon;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->initialize()V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method protected onIconUnloaded(Lcom/android/quickstep/views/TaskContainer;)V
    .locals 1

    .line 1
    const-string v0, "taskContainer"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/views/TaskView;->setIconAndTitle(Lcom/android/quickstep/views/TaskContainer;Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0, v0}, Lcom/android/quickstep/views/TaskViewIcon;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 7

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->modalness:F

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    cmpg-float v0, v0, v1

    .line 13
    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isSplitSelectionActive()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 47
    .line 48
    new-instance v2, Lcom/android/quickstep/views/m2;

    .line 49
    .line 50
    invoke-direct {v2, p0, v1, p1}, Lcom/android/quickstep/views/m2;-><init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 51
    .line 52
    .line 53
    const-string v1, "TV.a11yInfo"

    .line 54
    .line 55
    invoke-static {v1, v2}, Lcom/android/launcher3/util/K2;->allowIpcs(Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    if-eqz v1, :cond_1

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/android/quickstep/views/DigitalWellBeingToast;->getDWBAccessibilityAction()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    if-eqz v1, :cond_1

    .line 90
    .line 91
    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    new-instance v1, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getAccessibilityChildren()Ljava/util/List;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-interface {v0, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    const/4 v5, 0x1

    .line 112
    const/4 v6, 0x0

    .line 113
    const/4 v2, 0x0

    .line 114
    const/4 v3, 0x1

    .line 115
    invoke-direct/range {v1 .. v6}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;-><init>(IIIIZ)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionItemInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;)V

    .line 119
    .line 120
    .line 121
    :cond_3
    return-void
.end method

.method public onInterceptHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->B()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptHoverEvent(Landroid/view/MotionEvent;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->k()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptHoverEvent(Landroid/view/MotionEvent;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/android/quickstep/views/TaskView;->setPivot(IIII)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/y0;->B()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->thumbnailBounds:Landroid/graphics/Rect;

    .line 14
    .line 15
    const/4 p2, 0x2

    .line 16
    const/4 p3, 0x0

    .line 17
    const/4 p4, 0x0

    .line 18
    invoke-static {p0, p1, p4, p2, p3}, Lcom/android/quickstep/views/TaskView;->getThumbnailBounds$default(Lcom/android/quickstep/views/TaskView;Landroid/graphics/Rect;ZILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onRecycle()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->resetPersistentViewTransforms()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/quickstep/views/TaskView;->viewModel:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/TaskView;->setAttachAlpha(F)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/TaskView;->setSplitAlpha(F)V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/TaskView;->setSplitSplashAlpha(F)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/TaskView;->setModalAlpha(F)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/TaskView;->setModalScale(F)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->setModalPivot(Landroid/graphics/PointF;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/TaskView;->setTaskThumbnailSplashAlpha(F)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Lcom/android/quickstep/views/TaskContainer;

    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v3, v2, v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setThumbnail(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    const/4 v0, 0x0

    .line 70
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->setOverlayEnabled(Z)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->onTaskListVisibilityChanged(Z)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->setBorderEnabled(Z)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setHoverBorderVisible(Z)V

    .line 80
    .line 81
    .line 82
    const/4 v1, -0x1

    .line 83
    iput v1, p0, Lcom/android/quickstep/views/TaskView;->taskViewId:I

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_1

    .line 98
    .line 99
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    check-cast v2, Lcom/android/quickstep/views/TaskContainer;

    .line 104
    .line 105
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->destroy()V

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_1
    iput-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->mIsSkipContentAlphaChange:Z

    .line 110
    .line 111
    return-void
.end method

.method public final onTaskListVisibilityChanged(Z)V
    .locals 1

    const/4 v0, 0x7

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/views/TaskView;->onTaskListVisibilityChanged(ZI)V

    return-void
.end method

.method public onTaskListVisibilityChanged(ZI)V
    .locals 6

    .line 2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->cancelPendingLoadTasks()V

    .line 3
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/RecentsModel;

    const/4 v1, 0x2

    .line 4
    invoke-virtual {p0, p2, v1}, Lcom/android/quickstep/views/TaskView;->needsUpdate(II)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    move-result v1

    if-nez v1, :cond_2

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    move-result-object v1

    .line 6
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/quickstep/views/TaskContainer;

    if-eqz p1, :cond_1

    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsModel;->getThumbnailCache()Lcom/android/quickstep/TaskThumbnailCache;

    move-result-object v3

    .line 8
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v4

    new-instance v5, Lcom/android/quickstep/views/o2;

    invoke-direct {v5, v2}, Lcom/android/quickstep/views/o2;-><init>(Lcom/android/quickstep/views/TaskContainer;)V

    invoke-virtual {v3, v4, v5}, Lcom/android/quickstep/TaskThumbnailCache;->getThumbnailInBackground(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)Lcom/android/launcher3/util/w;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 9
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->pendingThumbnailLoadRequests:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 10
    :cond_1
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v4}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setThumbnail(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 11
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v2

    iput-object v4, v2, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    goto :goto_0

    :cond_2
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p0, p2, v1}, Lcom/android/quickstep/views/TaskView;->needsUpdate(II)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    move-result v1

    if-nez v1, :cond_5

    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    move-result-object v1

    .line 14
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/quickstep/views/TaskContainer;

    if-eqz p1, :cond_4

    .line 15
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsModel;->getIconCache()Lcom/android/quickstep/TaskIconCache;

    move-result-object v3

    .line 16
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v4

    .line 17
    new-instance v5, Lcom/android/quickstep/views/p2;

    invoke-direct {v5, v2, p0}, Lcom/android/quickstep/views/p2;-><init>(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;)V

    invoke-virtual {v3, v4, v2, v5}, Lcom/android/quickstep/TaskIconCache;->getIconInBackgroundMFV(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallbackMFV;)Lcom/android/launcher3/util/w;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 18
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->pendingIconLoadRequests:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 19
    :cond_4
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/TaskView;->onIconUnloaded(Lcom/android/quickstep/views/TaskContainer;)V

    goto :goto_1

    :cond_5
    const/4 p1, 0x4

    .line 20
    invoke-virtual {p0, p2, p1}, Lcom/android/quickstep/views/TaskView;->needsUpdate(II)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 21
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->thumbnailFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p2, "getContext(...)"

    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Lcom/android/quickstep/FullscreenDrawParams;->updateCornerRadius(Landroid/content/Context;)V

    :cond_6
    return-void
.end method

.method public performAccessibilityAction(ILandroid/os/Bundle;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_3

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const/4 v3, 0x1

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {v2, p1}, Lcom/android/quickstep/views/DigitalWellBeingToast;->handleAccessibilityAction(I)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-ne v2, v3, :cond_1

    .line 33
    .line 34
    return v3

    .line 35
    :cond_1
    invoke-static {p0, v1}, Lcom/android/quickstep/TaskOverlayFactory;->getEnabledShortcuts(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "getEnabledShortcuts(...)"

    .line 40
    .line 41
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_0

    .line 53
    .line 54
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Lcom/android/launcher3/popup/P;

    .line 59
    .line 60
    invoke-virtual {v2, p1}, Lcom/android/launcher3/popup/P;->hasHandlerForAction(I)Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    if-eqz v4, :cond_2

    .line 65
    .line 66
    invoke-interface {v2, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    return v3

    .line 70
    :cond_3
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    return p0
.end method

.method public final pinApplication(Lcom/android/quickstep/views/TaskView;)V
    .locals 2

    .line 1
    const-string v0, "taskView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    new-instance v1, Lcom/android/quickstep/views/s2;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/views/s2;-><init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final processTaskIcon(Landroid/content/Context;Lcom/android/systemui/shared/recents/model/Task;)Landroid/graphics/drawable/Drawable;
    .locals 11

    .line 1
    const-string p0, "TaskView"

    .line 2
    .line 3
    const-string v0, "context"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "task"

    .line 9
    .line 10
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :try_start_0
    const-string v0, "com.tencent.mm"

    .line 14
    .line 15
    iget-object v1, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    const/4 v1, 0x2

    .line 26
    const/4 v2, 0x0

    .line 27
    const-string v3, "getClassName(...)"

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    :try_start_1
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string v5, "plugin.appbrand.ui.AppBrandUI"

    .line 44
    .line 45
    invoke-static {v0, v5, v4, v1, v2}, LD4/g;->y(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p2, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    return-object v0

    .line 56
    :catch_0
    move-exception v0

    .line 57
    move-object p1, v0

    .line 58
    goto/16 :goto_1

    .line 59
    .line 60
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 61
    .line 62
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    invoke-virtual {v5}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-static {v5, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    const-string v6, "$"

    .line 77
    .line 78
    invoke-static {v5, v6, v4, v1, v2}, LD4/g;->y(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_2

    .line 83
    .line 84
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    invoke-static {v5, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-nez v1, :cond_1

    .line 100
    .line 101
    const-string v6, "$"

    .line 102
    .line 103
    const/4 v9, 0x6

    .line 104
    const/4 v10, 0x0

    .line 105
    const/4 v7, 0x0

    .line 106
    const/4 v8, 0x0

    .line 107
    invoke-static/range {v5 .. v10}, LD4/g;->G(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-lez v1, :cond_1

    .line 112
    .line 113
    invoke-virtual {v5, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    const-string v1, "substring(...)"

    .line 118
    .line 119
    invoke-static {v5, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_1
    new-instance v1, Landroid/content/ComponentName;

    .line 123
    .line 124
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-direct {v1, v3, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_2
    iget-object v1, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    if-eqz v1, :cond_3

    .line 150
    .line 151
    iget-object v1, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    if-eqz v1, :cond_3

    .line 162
    .line 163
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    if-eqz v1, :cond_3

    .line 168
    .line 169
    iget-object v1, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 170
    .line 171
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-nez v1, :cond_3

    .line 192
    .line 193
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    new-instance v3, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 200
    .line 201
    .line 202
    const-string v4, "processTaskIcon: top = "

    .line 203
    .line 204
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    iget-object v1, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 218
    .line 219
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 224
    .line 225
    .line 226
    const/4 v4, 0x1

    .line 227
    goto :goto_0

    .line 228
    :cond_3
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 237
    .line 238
    .line 239
    :goto_0
    sget-object v1, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 240
    .line 241
    invoke-virtual {v1, p1}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    iget-object v5, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 258
    .line 259
    iget v5, v5, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 260
    .line 261
    invoke-virtual {v3, v5}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    invoke-virtual {v1, v0, v3}, Lcom/android/launcher3/c1;->w(Landroid/content/Intent;Landroid/os/UserHandle;)LI/d;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    const-string v3, "getIconInCache(...)"

    .line 270
    .line 271
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iget-object v3, v1, LI/d;->b:Ljava/lang/Object;

    .line 275
    .line 276
    check-cast v3, Landroid/graphics/Bitmap;

    .line 277
    .line 278
    invoke-static {p1, v3}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    const-string v3, "bitmap2Drawable(...)"

    .line 283
    .line 284
    invoke-static {p1, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 288
    .line 289
    .line 290
    move-result-object v3

    .line 291
    iget-object v5, v1, LI/d;->a:Ljava/lang/Object;

    .line 292
    .line 293
    new-instance v6, Ljava/lang/StringBuilder;

    .line 294
    .line 295
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 296
    .line 297
    .line 298
    const-string v7, "processTaskIcon "

    .line 299
    .line 300
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    const-string v3, ", dataPair : "

    .line 307
    .line 308
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v3

    .line 318
    invoke-static {p0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 319
    .line 320
    .line 321
    if-eqz v4, :cond_5

    .line 322
    .line 323
    sget-object v3, Lcom/android/quickstep/TaskIconCache;->Companion:Lcom/android/quickstep/TaskIconCache$Companion;

    .line 324
    .line 325
    invoke-virtual {v3}, Lcom/android/quickstep/TaskIconCache$Companion;->getAIGC_PACKAGE_NAME()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v3

    .line 329
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    if-eqz v0, :cond_4

    .line 334
    .line 335
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v2

    .line 339
    :cond_4
    invoke-static {v3, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-nez v0, :cond_5

    .line 344
    .line 345
    iget-object v0, v1, LI/d;->a:Ljava/lang/Object;

    .line 346
    .line 347
    check-cast v0, Ljava/lang/String;

    .line 348
    .line 349
    iput-object v0, p2, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 350
    .line 351
    :cond_5
    return-object p1

    .line 352
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 353
    .line 354
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 355
    .line 356
    .line 357
    const-string v1, "processTaskIcon exception "

    .line 358
    .line 359
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    .line 371
    .line 372
    iget-object p0, p2, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 373
    .line 374
    return-object p0
.end method

.method protected refreshTaskThumbnailSplash()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->refreshSplashView()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return-void
.end method

.method public final resetPersistentViewTransforms()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    iget-boolean v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTranslationLocked:Z

    if-nez v1, :native_stack_preserve_entry_anchor

    iput-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackChromeInitialized:Z

    # A pooled TaskView must never carry a deck transform into a later bind.
    iput v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTranslationX:F
    iput v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTranslationY:F

    const/high16 v1, 0x3f800000    # 1.0f
    iput v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackScale:F
    iput v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackAlpha:F

    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationX()V
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationY()V
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyScale()V
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyNativeStackAlpha()V

    const/4 v2, -0x1

    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/TaskView;->setNativeStackClipRight(I)V

    :native_stack_preserve_entry_anchor

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->setNonGridTranslationX(F)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->setGridTranslationX(F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->setGridTranslationY(F)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setBoxTranslationY(F)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/android/quickstep/views/TaskContainer;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v3, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v2, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->resetViewTransforms()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final resetViewTransforms()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setDismissTranslationX(F)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setTaskOffsetTranslationX(F)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setTaskResistanceTranslationX(F)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setSplitSelectTranslationX(F)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setGridEndTranslationX(F)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setDismissTranslationY(F)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setTaskOffsetTranslationY(F)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setTaskResistanceTranslationY(F)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v2, 0x1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->isSplitSelectionActive()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-ne v1, v2, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setSplitSelectTranslationY(F)V

    .line 41
    .line 42
    .line 43
    :goto_0
    const/high16 v1, 0x3f800000    # 1.0f

    .line 44
    .line 45
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/TaskView;->setDismissScale(F)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setTranslationZ(F)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/TaskView;->setIconVisibleForGesture(Z)V

    .line 52
    .line 53
    .line 54
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/TaskView;->setSettledProgressDismiss(F)V

    .line 55
    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/views/TaskView;->setColorTint(FI)V

    .line 59
    .line 60
    .line 61
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setGridEndTranslationY(F)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final runOnRemoving(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const-string v0, "action"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mRemovingActions:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public saveIconDrawable(Lcom/android/quickstep/views/TaskViewIcon;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/views/TaskView;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-void
.end method

.method public final screenHaveLocked(Lcom/android/quickstep/views/TaskView;)V
    .locals 7

    .line 1
    const-string v0, "taskView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/quickstep/views/y2;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/android/quickstep/views/y2;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v0, v1}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v2, Lcom/android/quickstep/views/z2;

    .line 17
    .line 18
    invoke-direct {v2, p1, p0}, Lcom/android/quickstep/views/z2;-><init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v2, v1}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 26
    .line 27
    invoke-interface {v2}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v2}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    sget-object v3, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 36
    .line 37
    const v4, 0x7f1400f9

    .line 38
    .line 39
    .line 40
    const v5, 0x7f1400f7

    .line 41
    .line 42
    .line 43
    const v6, 0x7f1402fe

    .line 44
    .line 45
    .line 46
    if-ne v2, v3, :cond_0

    .line 47
    .line 48
    new-instance v2, Lx1/e;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-direct {v2, p1}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, v6}, Lx1/e;->n(I)Lx1/e;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const v2, 0x7f1401dc

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v2}, Lx1/e;->d(I)Lx1/e;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1, v5, v0}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1, v4, v1}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Lx1/e;->p()Landroid/app/Dialog;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {v0, p1}, LK1/g;->b(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, p1}, LK1/g;->b(Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    new-instance v2, Lx1/e;

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-direct {v2, p1}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v2, v6}, Lx1/e;->n(I)Lx1/e;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    const v2, 0x7f140474

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, v2}, Lx1/e;->d(I)Lx1/e;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p1, v5, v0}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1, v4, v1}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Lx1/e;->p()Landroid/app/Dialog;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {v0, p1}, LK1/g;->b(Ljava/lang/Object;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1, p1}, LK1/g;->b(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    :goto_0
    if-eqz p1, :cond_2

    .line 126
    .line 127
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    if-eqz p1, :cond_2

    .line 132
    .line 133
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_1

    .line 138
    .line 139
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    const v0, 0x7f070ab2

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    goto :goto_1

    .line 151
    :cond_1
    const/4 p0, -0x1

    .line 152
    :goto_1
    const/4 v0, -0x2

    .line 153
    invoke-virtual {p1, p0, v0}, Landroid/view/Window;->setLayout(II)V

    .line 154
    .line 155
    .line 156
    :cond_2
    return-void
.end method

.method public final screenNotHaveLocked(Lcom/android/quickstep/views/TaskView;)V
    .locals 3

    .line 1
    const-string v0, "taskView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/quickstep/views/g2;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/android/quickstep/views/g2;-><init>(Lcom/android/quickstep/views/TaskView;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v0, v1}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v2, Lcom/android/quickstep/views/h2;

    .line 17
    .line 18
    invoke-direct {v2}, Lcom/android/quickstep/views/h2;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v2, v1}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Lx1/e;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-direct {v2, p1}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    const p1, 0x7f1402fe

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, p1}, Lx1/e;->n(I)Lx1/e;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const v2, 0x7f14036b

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v2}, Lx1/e;->d(I)Lx1/e;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const v2, 0x7f1400f7

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v2, v1}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const v2, 0x7f1400f9

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v2, v0}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lx1/e;->p()Landroid/app/Dialog;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const-string v2, "show(...)"

    .line 67
    .line 68
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, p1}, LK1/g;->b(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p1}, LK1/g;->b(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    if-eqz p1, :cond_1

    .line 82
    .line 83
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_0

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const v0, 0x7f070ab2

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    goto :goto_0

    .line 101
    :cond_0
    const/4 p0, -0x1

    .line 102
    :goto_0
    const/4 v0, -0x2

    .line 103
    invoke-virtual {p1, p0, v0}, Landroid/view/Window;->setLayout(II)V

    .line 104
    .line 105
    .line 106
    :cond_1
    return-void
.end method

.method public final setAppLockState(Ljava/lang/String;I)Z
    .locals 7

    .line 1
    const-string p0, "getMethod(...)"

    .line 2
    .line 3
    const-string v0, "TaskView"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    const-string v2, "setAppLockState Enter"

    .line 7
    .line 8
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lx1/O;->R0()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "getInstance"

    .line 16
    .line 17
    new-array v4, v1, [Ljava/lang/Class;

    .line 18
    .line 19
    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-array v3, v1, [Ljava/lang/Object;

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "invoke(...)"

    .line 34
    .line 35
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lx1/O;->R0()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const-string v4, "setAppLockState"

    .line 43
    .line 44
    const-class v5, Ljava/lang/String;

    .line 45
    .line 46
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 47
    .line 48
    filled-new-array {v5, v6}, [Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v3, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v3, v2, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "null cannot be cast to non-null type kotlin.Boolean"

    .line 72
    .line 73
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    check-cast p0, Ljava/lang/Boolean;

    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    new-instance p1, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    const-string p2, "setAppLockState: isSuccessful "

    .line 88
    .line 89
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    .line 102
    return p0

    .line 103
    :catch_0
    move-exception p0

    .line 104
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 105
    .line 106
    .line 107
    return v1
.end method

.method public final setAppLocked(Lcom/android/quickstep/views/TaskViewIcon;)V
    .locals 7

    .line 1
    const-string v0, "iconView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/android/quickstep/TaskOverlayFactory;->MENU_OPTIONS:[Lcom/android/quickstep/TaskShortcutFactory;

    .line 15
    .line 16
    invoke-static {v1}, Lkotlin/jvm/internal/d;->a([Ljava/lang/Object;)Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_8

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/android/quickstep/TaskShortcutFactory;

    .line 31
    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    const/4 v6, 0x0

    .line 46
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    check-cast v5, Lcom/android/quickstep/views/TaskContainer;

    .line 51
    .line 52
    invoke-virtual {v5}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    if-ne p1, v5, :cond_2

    .line 57
    .line 58
    move v5, v6

    .line 59
    goto :goto_1

    .line 60
    :cond_2
    const/4 v5, 0x1

    .line 61
    :goto_1
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Lcom/android/quickstep/views/TaskContainer;

    .line 66
    .line 67
    invoke-interface {v2, v3, v4}, Lcom/android/quickstep/TaskShortcutFactory;->getShortcuts(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    if-nez v2, :cond_3

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    :cond_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_0

    .line 83
    .line 84
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Lcom/android/launcher3/popup/P;

    .line 89
    .line 90
    instance-of v4, v3, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;

    .line 91
    .line 92
    if-eqz v4, :cond_4

    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->shouldInflateGridStyle()Z

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-eqz v4, :cond_5

    .line 103
    .line 104
    const v4, 0x7f0e0225

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_5
    const v4, 0x7f0e0226

    .line 109
    .line 110
    .line 111
    :goto_2
    const/4 v5, 0x0

    .line 112
    invoke-virtual {v2, v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    const-string v4, "null cannot be cast to non-null type android.view.ViewGroup"

    .line 117
    .line 118
    invoke-static {v2, v4}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    check-cast v2, Landroid/view/ViewGroup;

    .line 122
    .line 123
    check-cast v3, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;

    .line 124
    .line 125
    invoke-virtual {v3, v2}, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->init(Landroid/view/ViewGroup;)V

    .line 126
    .line 127
    .line 128
    invoke-static {}, Lx1/O;->Q0()Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    invoke-virtual {v3, p0, v2}, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->isAppLocked(Lcom/android/quickstep/views/TaskView;Z)Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    if-eqz v4, :cond_6

    .line 141
    .line 142
    iget-object v4, v4, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 143
    .line 144
    if-eqz v4, :cond_6

    .line 145
    .line 146
    invoke-virtual {v4}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    :cond_6
    iget-object v4, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 151
    .line 152
    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    if-eqz v2, :cond_7

    .line 157
    .line 158
    const v2, 0x7f140135

    .line 159
    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_7
    const v2, 0x7f140133

    .line 163
    .line 164
    .line 165
    :goto_3
    invoke-virtual {v4, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-static {v5, v2}, Lh1/a;->J(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v3, p0}, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->onClick(Landroid/view/View;)V

    .line 173
    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_8
    return-void
.end method

.method public final setAttachAlpha(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->attachAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, p1}, Lcom/android/launcher3/util/u1;->b(Ljava/lang/Object;LB4/i;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final setBorderEnabled(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->borderEnabled:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->borderEnabled:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->hoverBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isHovered()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    move p1, v2

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move p1, v1

    .line 25
    :goto_0
    invoke-virtual {v0, p1, v2}, Lcom/android/quickstep/util/BorderAnimator;->setBorderVisibility(ZZ)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 29
    .line 30
    if-eqz p1, :cond_4

    .line 31
    .line 32
    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->borderEnabled:Z

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isFocused()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_3

    .line 41
    .line 42
    move v1, v2

    .line 43
    :cond_3
    invoke-virtual {p1, v1, v2}, Lcom/android/quickstep/util/BorderAnimator;->setBorderVisibility(ZZ)V

    .line 44
    .line 45
    .line 46
    :cond_4
    :goto_1
    return-void
.end method

.method public setColorTint(FI)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

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
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 20
    .line 21
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/TaskContainer;->updateTintAmount(F)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1, p1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setDimAlpha(F)V

    .line 36
    .line 37
    .line 38
    :goto_1
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {v1, p2, p1}, Lcom/android/quickstep/views/TaskViewIcon;->setIconColorTint(IF)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0, p2, p1}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setColorTint(IF)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    return-void
.end method

.method public final setEndQuickSwitchCuj(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->isEndQuickSwitchCuj:Z

    .line 2
    .line 3
    return-void
.end method

.method protected final setFullscreenProgress(F)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->fullscreenProgress:F

    .line 2
    .line 3
    cmpg-float v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->fullscreenProgress:F

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->onFullscreenProgressChanged(F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method protected final setGridProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->gridProgress:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->onGridProgressChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final setGridTranslationPrimary(F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->setGridTranslationX(F)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    instance-of v0, v0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->setGridTranslationY(F)V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationPrimary()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final setGridTranslationSecondary(F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->setGridTranslationY(F)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    instance-of v1, v0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->setGridTranslationX(F)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    instance-of v0, v0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    neg-float p1, p1

    .line 26
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->setGridTranslationX(F)V

    .line 27
    .line 28
    .line 29
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationSecondary()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method protected final setGridTranslationX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->gridTranslationX:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationX()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected final setGridTranslationY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->gridTranslationY:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationY()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected final setIcon(Lcom/android/quickstep/views/TaskViewIcon;Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    const-string v0, "iconView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-interface {p1, p2}, Lcom/android/quickstep/views/TaskViewIcon;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    new-instance p2, Lcom/android/quickstep/views/t2;

    .line 12
    .line 13
    invoke-direct {p2, p0, p1}, Lcom/android/quickstep/views/t2;-><init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskViewIcon;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1, p2}, Lcom/android/quickstep/views/TaskViewIcon;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    new-instance p2, Lcom/android/quickstep/views/u2;

    .line 20
    .line 21
    invoke-direct {p2, p0, p1}, Lcom/android/quickstep/views/u2;-><init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskViewIcon;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1, p2}, Lcom/android/quickstep/views/TaskViewIcon;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    invoke-interface {p1, p0}, Lcom/android/quickstep/views/TaskViewIcon;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p1, p0}, Lcom/android/quickstep/views/TaskViewIcon;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p1, p0}, Lcom/android/quickstep/views/TaskViewIcon;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method protected setIconState(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/recents/ui/viewmodel/TaskData;)V
    .locals 3

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v1, "TaskView.setIconState"

    .line 13
    .line 14
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    instance-of v1, p2, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v2, p2

    .line 32
    check-cast v2, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {p0, v1, v2}, Lcom/android/quickstep/views/TaskView;->setIcon(Lcom/android/quickstep/views/TaskViewIcon;Landroid/graphics/drawable/Drawable;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p2, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;

    .line 46
    .line 47
    invoke-virtual {p2}, Lcom/android/quickstep/recents/ui/viewmodel/TaskData$Data;->getTitle()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-interface {p0, p2}, Lcom/android/quickstep/views/TaskViewIcon;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->initialize()V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-virtual {p0, p2, v1}, Lcom/android/quickstep/views/TaskView;->setIcon(Lcom/android/quickstep/views/TaskViewIcon;Landroid/graphics/drawable/Drawable;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-interface {p0, v1}, Lcom/android/quickstep/views/TaskViewIcon;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .line 83
    if-eqz v0, :cond_3

    .line 84
    .line 85
    invoke-static {}, LK0/a;->b()V

    .line 86
    .line 87
    .line 88
    :cond_3
    return-void

    .line 89
    :goto_1
    if-eqz v0, :cond_4

    .line 90
    .line 91
    invoke-static {}, LK0/a;->b()V

    .line 92
    .line 93
    .line 94
    :cond_4
    throw p0
.end method

.method public final setIconVisibleForGesture(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->iconFadeInOnGestureCompleteAnimator:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    const/high16 p1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 p1, 0x0

    .line 14
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setSettledProgressGesture(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setLayoutDirection(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "null cannot be cast to non-null type com.android.quickstep.views.IconAppChipView"

    .line 47
    .line 48
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    check-cast v0, Lcom/android/quickstep/views/IconAppChipView;

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    return-void
.end method

.method public final setLockButtonAlpha(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "TaskView"

    .line 6
    .line 7
    const-string p1, "animateTitleDisplay: no Lock Button , return !!"

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    .line 21
    cmpg-float p1, p1, v0

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 p1, 0x0

    .line 28
    :goto_0
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->mIsLockShown:Z

    .line 29
    .line 30
    return-void
.end method

.method public final setLockImageStatus(Z)V
    .locals 5

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->mhasLockButton:Z

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->mIsTitleHidden:Z

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/android/quickstep/views/TaskView;->mIsLockShown:Z

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/widget/ImageView;->getAlpha()F

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v2, 0x0

    .line 21
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v4, "setLockImageStatus "

    .line 27
    .line 28
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v4, ", mIsTitleHidden="

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v0, ", mIsLockShown="

    .line 43
    .line 44
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v0, ", alpha="

    .line 51
    .line 52
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "TaskView"

    .line 63
    .line 64
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lcom/android/quickstep/RecentsModel;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsModel;->getIconCache()Lcom/android/quickstep/TaskIconCache;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const/4 v2, 0x0

    .line 88
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1, p1}, Lcom/android/quickstep/TaskIconCache;->updateIconCacheLockedState(Lcom/android/systemui/shared/recents/model/Task;Z)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 110
    .line 111
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/TaskContainer;->setLocked(Ljava/lang/Boolean;)V

    .line 116
    .line 117
    .line 118
    if-eqz p1, :cond_1

    .line 119
    .line 120
    iget-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->mIsTitleHidden:Z

    .line 121
    .line 122
    if-nez p1, :cond_1

    .line 123
    .line 124
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    .line 125
    .line 126
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 130
    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    .line 134
    .line 135
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    const/16 v0, 0x8

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 141
    .line 142
    .line 143
    :goto_1
    iget-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->mIsLockShown:Z

    .line 144
    .line 145
    if-eqz p1, :cond_2

    .line 146
    .line 147
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    .line 148
    .line 149
    if-eqz p0, :cond_2

    .line 150
    .line 151
    const/high16 p1, 0x3f800000    # 1.0f

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 154
    .line 155
    .line 156
    :cond_2
    return-void
.end method

.method protected final setMIsLockShown(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->mIsLockShown:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setMIsSkipContentAlphaChange(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->mIsSkipContentAlphaChange:Z

    .line 2
    .line 3
    return-void
.end method

.method protected final setMIsTitleHidden(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->mIsTitleHidden:Z

    .line 2
    .line 3
    return-void
.end method

.method protected final setMMenuButton(Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-void
.end method

.method protected final setMMiniWindowButton(Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-void
.end method

.method protected final setMSplitScreenButton(Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-void
.end method

.method protected final setMSplitScreenGroupShortcutsItem(Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenGroupShortcutsItem:Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    return-void
.end method

.method protected final setMTitleAnimator(Landroid/animation/ObjectAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView;->mTitleAnimator:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    return-void
.end method

.method public final setModalPivot(Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView;->modalPivot:Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->updatePivots()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final setModalScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->modalScale:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyScale()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected final setModalness(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->modalness:F

    .line 2
    .line 3
    cmpg-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->modalness:F

    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->onModalnessUpdated(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected final setNonGridScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->nonGridScale:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyScale()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected final setNonGridTranslationX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->nonGridTranslationX:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationX()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 2

    .line 1
    const-string v0, "orientationState"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v1, "TaskView.setOrientationState"

    .line 13
    .line 14
    invoke-static {v1}, LK0/a;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->setOrientedState(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->setThumbnailOrientation(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-static {}, LK0/a;->b()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-static {}, LK0/a;->b()V

    .line 35
    .line 36
    .line 37
    :cond_2
    throw p0
.end method

.method public final setOrientedState(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView;->orientedState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 7
    .line 8
    return-void
.end method

.method public setOverlayEnabled(Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/TaskContainer;->setOverlayEnabled(Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method protected setPivot(IIII)V
    .locals 0

    .line 1
    sub-int/2addr p3, p1

    .line 2
    int-to-float p1, p3

    .line 3
    const/high16 p2, 0x3f000000    # 0.5f

    .line 4
    .line 5
    mul-float/2addr p1, p2

    .line 6
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 p3, 0x0

    .line 14
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    int-to-float p1, p1

    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    check-cast p3, Lcom/android/quickstep/views/TaskContainer;

    .line 38
    .line 39
    invoke-virtual {p3}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    int-to-float p3, p3

    .line 48
    mul-float/2addr p3, p2

    .line 49
    add-float/2addr p1, p3

    .line 50
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final setResourceManagerProxy(Lcom/android/launcher3/resource/g0;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView;->resourceManagerProxy:Lcom/android/launcher3/resource/g0;

    .line 7
    .line 8
    return-void
.end method

.method public final setShouldShowScreenshot(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, v1, v0}, Lcom/android/quickstep/views/TaskView;->setShouldShowScreenshot$default(Lcom/android/quickstep/views/TaskView;ZLjava/util/Map;ILjava/lang/Object;)V

    return-void
.end method

.method public setShouldShowScreenshot(ZLjava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)V"
        }
    .end annotation

    .line 2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getShouldShowScreenshot()Z

    move-result v0

    if-ne v0, p1, :cond_0

    goto :goto_2

    .line 3
    :cond_0
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->shouldShowScreenshot:Z

    .line 4
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_2

    .line 5
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    move-result-object p0

    .line 6
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    if-eqz p2, :cond_2

    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v0

    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    iget v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_3

    .line 8
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setThumbnail(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    goto :goto_0

    .line 9
    :cond_3
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->refresh()V

    goto :goto_0

    :cond_4
    :goto_2
    return-void
.end method

.method public final setSkipContentAlphaChange(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->mIsSkipContentAlphaChange:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setSplitAlpha(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->splitAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, p1}, Lcom/android/launcher3/util/u1;->b(Ljava/lang/Object;LB4/i;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final setSplitSplashAlpha(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->splitSplashAlpha:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyThumbnailSplashAlpha()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final applyNativeStackAlpha()V
    .locals 4

    iget v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStableAlpha:F
    iget v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackAlpha:F
    mul-float/2addr v0, v1

    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->stableAlpha$delegate:Lcom/android/launcher3/util/u1;
    sget-object v2, Lcom/android/quickstep/views/TaskView;->$$delegatedProperties:[LB4/i;
    const/4 v3, 0x0
    aget-object v2, v2, v3
    invoke-virtual {v1, p0, v2, v0}, Lcom/android/launcher3/util/u1;->b(Ljava/lang/Object;LB4/i;F)V
    return-void
.end method

.method public final getNativeStackTranslationX()F
    .locals 0
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTranslationX:F
    return p0
.end method

.method public final getNativeStackTranslationY()F
    .locals 0
    iget p0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTranslationY:F
    return p0
.end method

.method public final getNativeDismissTranslationX()F
    .locals 0

    iget p0, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationX:F

    return p0
.end method

.method public final getNativeDismissTranslationY()F
    .locals 0

    iget p0, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationY:F

    return p0
.end method

.method public final lockNativeStackEntryTranslation()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTranslationLocked:Z

    if-nez v0, :native_stack_entry_lock_done

    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    move-result v0

    iget v1, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationX:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTargetTranslationX:F

    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    iget v1, p0, Lcom/android/quickstep/views/TaskView;->dismissTranslationY:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTargetTranslationY:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTranslationLocked:Z

    :native_stack_entry_lock_done
    return-void
.end method

.method public final unlockNativeStackEntryTranslation()V
    .locals 1

    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTranslationLocked:Z

    if-eqz v0, :native_stack_entry_unlock_done

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTranslationLocked:Z

    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationX()V

    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationY()V

    :native_stack_entry_unlock_done
    return-void
.end method

.method public final getNativeStackTitleProperty()Landroid/util/FloatProperty;
    .locals 0

    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->SHOW_TITLE:Landroid/util/FloatProperty;

    return-object p0
.end method

.method public final getNativeStackTitleView()Landroid/widget/TextView;
    .locals 2

    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :native_stack_title_missing

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    move-result-object v0

    return-object v0

    :native_stack_title_missing
    const/4 v0, 0x0

    return-object v0
.end method

.method public setNativeStackChromeAlpha(FF)V
    .locals 2

    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackChromeInitialized:Z

    if-eqz v0, :native_stack_chrome_apply

    iget v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTitleAlpha:F

    cmpl-float v0, v1, p1

    if-nez v0, :native_stack_chrome_apply

    iget v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackActionAlpha:F

    cmpl-float v0, v1, p2

    if-nez v0, :native_stack_chrome_apply

    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getNativeStackTitleView()Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :native_stack_chrome_apply

    invoke-virtual {v0}, Landroid/widget/TextView;->getAlpha()F

    move-result v1

    cmpl-float v0, v1, p1

    if-nez v0, :native_stack_chrome_apply

    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    if-nez v0, :native_stack_check_action_alpha

    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    :native_stack_check_action_alpha
    if-eqz v0, :native_stack_chrome_cached

    invoke-virtual {v0}, Landroid/widget/ImageView;->getAlpha()F

    move-result v1

    cmpl-float v0, v1, p2

    if-nez v0, :native_stack_chrome_apply

    :native_stack_chrome_cached
    return-void

    :native_stack_chrome_apply
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackChromeInitialized:Z

    iput p1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTitleAlpha:F

    iput p2, p0, Lcom/android/quickstep/views/TaskView;->nativeStackActionAlpha:F

    # Preserve GroupedTaskView's title handling, then independently gate the
    # controls that occupy the card's trailing edge.
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->setTitleAlpha(F)V

    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    if-eqz v0, :native_stack_chrome_split

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setAlpha(F)V

    :native_stack_chrome_split
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    if-eqz v0, :native_stack_chrome_menu

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setAlpha(F)V

    :native_stack_chrome_menu
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    if-eqz v0, :native_stack_chrome_done

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setAlpha(F)V

    :native_stack_chrome_done
    return-void
.end method

.method public final setNativeStackClipRight(I)V
    .locals 4

    if-ltz p1, :native_stack_clip_clear

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-lez v0, :native_stack_clip_clear

    if-lez v1, :native_stack_clip_clear

    if-ge p1, v0, :native_stack_clip_clear

    iget v2, p0, Lcom/android/quickstep/views/TaskView;->nativeStackClipRight:I

    if-ne v2, p1, :native_stack_clip_apply

    iget v2, p0, Lcom/android/quickstep/views/TaskView;->nativeStackClipHeight:I

    if-ne v2, v1, :native_stack_clip_apply

    return-void

    :native_stack_clip_apply
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackClipRight:I

    iput v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackClipHeight:I

    iget-object v2, p0, Lcom/android/quickstep/views/TaskView;->nativeStackClipRect:Landroid/graphics/Rect;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v3, p1, v1}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    return-void

    :native_stack_clip_clear
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackClipRight:I

    const/4 v1, -0x1

    if-ne v0, v1, :native_stack_clip_do_clear

    return-void

    :native_stack_clip_do_clear
    iput v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackClipRight:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackClipHeight:I

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public final setNativeStackTransform(FFFFF)V
    .locals 2

    # Update each composed property independently.  Horizontal paging changes
    # X/depth every frame, but Y and Z normally stay constant; rewriting all
    # five RenderNode properties for every TaskView was unnecessary work on the
    # 144 Hz entry and paging paths.
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTranslationX:F
    cmpl-float v1, v0, p1
    if-eqz v1, :native_stack_transform_y

    iget-boolean v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTranslationLocked:Z
    if-eqz v1, :native_stack_transform_x_store

    iget v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTargetTranslationX:F
    sub-float v0, p1, v0
    add-float/2addr v1, v0
    iput v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTargetTranslationX:F

    :native_stack_transform_x_store
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTranslationX:F
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationX()V

    :native_stack_transform_y
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTranslationY:F
    cmpl-float v1, v0, p2
    if-eqz v1, :native_stack_transform_scale

    iget-boolean v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTranslationLocked:Z
    if-eqz v1, :native_stack_transform_y_store

    iget v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTargetTranslationY:F
    sub-float v0, p2, v0
    add-float/2addr v1, v0
    iput v1, p0, Lcom/android/quickstep/views/TaskView;->nativeStackEntryTargetTranslationY:F

    :native_stack_transform_y_store
    iput p2, p0, Lcom/android/quickstep/views/TaskView;->nativeStackTranslationY:F
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyTranslationY()V

    :native_stack_transform_scale
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackScale:F
    cmpl-float v0, v0, p3
    if-eqz v0, :native_stack_transform_alpha

    iput p3, p0, Lcom/android/quickstep/views/TaskView;->nativeStackScale:F
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyScale()V

    :native_stack_transform_alpha
    iget v0, p0, Lcom/android/quickstep/views/TaskView;->nativeStackAlpha:F
    cmpl-float v0, v0, p4
    if-eqz v0, :native_stack_transform_z

    iput p4, p0, Lcom/android/quickstep/views/TaskView;->nativeStackAlpha:F
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyNativeStackAlpha()V

    :native_stack_transform_z
    invoke-virtual {p0}, Landroid/view/View;->getTranslationZ()F
    move-result v0
    cmpl-float v0, v0, p5
    if-eqz v0, :native_stack_transform_done

    invoke-virtual {p0, p5}, Landroid/view/View;->setTranslationZ(F)V

    :native_stack_transform_done
    return-void
.end method

.method protected final setStableAlpha(F)V
    .locals 0
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->nativeStableAlpha:F
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyNativeStackAlpha()V
    return-void
.end method

.method protected final setTaskContainers(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/quickstep/views/TaskContainer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView;->taskContainers:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method

.method public final setTaskOutlineOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected final setTaskThumbnailSplashAlpha(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->taskThumbnailSplashAlpha:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskView;->applyThumbnailSplashAlpha()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final setTaskViewId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/TaskView;->taskViewId:I

    .line 2
    .line 3
    return-void
.end method

.method protected setThumbnailOrientation(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "orientationState"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    move-result-object v2

    .line 2
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/quickstep/views/TaskContainer;

    .line 3
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getOverlay()Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->updateOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 4
    iget-object v4, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v4

    iget v4, v4, Lcom/android/launcher3/h0;->S2:I

    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 6
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    iget-object v5, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v5}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/quickstep/views/RecentsView;->getThumbnailTopMargin(Lcom/android/launcher3/h0;)I

    move-result v4

    .line 7
    :cond_0
    iget-object v5, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v5}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v5

    const-string v6, "getDeviceProfile(...)"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Lcom/android/quickstep/views/TaskView;->getIconSize(Lcom/android/launcher3/h0;)F

    move-result v5

    .line 8
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f070b57

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    invoke-static {v6, v7}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v6

    const v7, 0x7f070b55

    .line 9
    invoke-virtual {v0, v7}, Lcom/android/quickstep/views/TaskView;->getConstantPx(I)I

    move-result v7

    int-to-float v7, v7

    .line 10
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f070b34

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    invoke-static {v8, v9}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v8

    int-to-float v8, v8

    .line 11
    invoke-static {}, Lm1/a;->a()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 12
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v8

    .line 13
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f070b36

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 14
    invoke-static {v8, v9}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v8

    int-to-float v8, v8

    .line 15
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/launcher3/resource/B;->s()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 16
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v8

    .line 17
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f070b35

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 18
    invoke-static {v8, v9}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v8

    int-to-float v8, v8

    :cond_2
    const v9, 0x7f070b59

    .line 19
    invoke-virtual {v0, v9}, Lcom/android/quickstep/views/TaskView;->getConstantPx(I)I

    move-result v9

    .line 20
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTextPaddingLeft()F

    move-result v11

    .line 21
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTextSize()F

    move-result v12

    .line 22
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f070b19

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v14

    invoke-static {v13, v14}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v13

    .line 23
    iget v14, v0, Lcom/android/quickstep/views/TaskView;->GRID_TO_SINGLE_DEFAULT_SCALE:F

    .line 24
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    move-result v15

    if-eqz v15, :cond_a

    .line 25
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 26
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    move-result-object v6

    invoke-static {v6}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->getGridToSingleScale()F

    move-result v14

    .line 27
    :cond_3
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridSingleTask()Z

    move-result v6

    const v7, 0x7f0703f8

    if-eqz v6, :cond_4

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    invoke-static {v6, v7}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v14

    :goto_1
    move v7, v6

    goto :goto_2

    :cond_4
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    invoke-static {v6, v7}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v6

    int-to-float v6, v6

    goto :goto_1

    .line 28
    :goto_2
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridSingleTask()Z

    move-result v6

    const v9, 0x7f0703fc

    if-eqz v6, :cond_5

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v14

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    goto :goto_3

    .line 29
    :cond_5
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 30
    :goto_3
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridSingleTask()Z

    move-result v15

    const v10, 0x7f0703fa

    if-eqz v15, :cond_6

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v15

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    invoke-static {v15, v9}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, v14

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    goto :goto_4

    :cond_6
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v15

    invoke-static {v9, v15}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v9

    .line 31
    :goto_4
    iget-object v15, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v15}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v15

    iget-boolean v15, v15, Lcom/android/launcher3/h0;->G0:Z

    if-nez v15, :cond_8

    .line 32
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridSingleTask()Z

    move-result v15

    if-eqz v15, :cond_7

    goto :goto_5

    :cond_7
    int-to-float v13, v13

    div-float/2addr v13, v14

    invoke-static {v13}, Ljava/lang/Math;->round(F)I

    move-result v13

    .line 33
    :cond_8
    :goto_5
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridSingleTask()Z

    move-result v15

    if-eqz v15, :cond_9

    mul-float/2addr v8, v14

    .line 34
    :cond_9
    iget-object v15, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v15}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v15

    iget-boolean v15, v15, Lcom/android/launcher3/h0;->G0:Z

    if-eqz v15, :cond_b

    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridSingleTask()Z

    move-result v15

    if-eqz v15, :cond_b

    .line 35
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0703f0

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    invoke-static {v4, v5}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v4

    int-to-float v5, v4

    .line 36
    iget-object v4, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v4

    iget v4, v4, Lcom/android/launcher3/h0;->S2:I

    .line 37
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0703f9

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    invoke-static {v6, v7}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v6

    int-to-float v7, v6

    .line 38
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0703fc

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v6, v8}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v9

    .line 39
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-static {v6, v8}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v6

    .line 40
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070b1a

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    invoke-static {v8, v10}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v13

    .line 41
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070b34

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    invoke-static {v8, v10}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v8

    int-to-float v8, v8

    .line 42
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0703fe

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    invoke-static {v10, v11}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v10

    int-to-float v11, v10

    .line 43
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v15, 0x7f0703f5

    invoke-virtual {v12, v15}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    invoke-static {v10, v12}, Lx1/O;->A0(Landroid/content/Context;I)I

    move-result v10

    int-to-float v12, v10

    :cond_a
    move v15, v14

    move v14, v5

    move v5, v12

    move v12, v8

    move v8, v15

    :goto_6
    move v15, v13

    move v13, v7

    move v7, v15

    move v15, v11

    goto :goto_7

    :cond_b
    move v15, v14

    move v14, v5

    move v5, v12

    move v12, v8

    move v8, v15

    move v15, v9

    move v9, v6

    move v6, v15

    goto :goto_6

    .line 44
    :goto_7
    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    move-result-object v11

    invoke-static {v11}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v11}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    invoke-direct {v10, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    instance-of v11, v0, Lcom/android/quickstep/views/GroupedTaskView;

    if-eqz v11, :cond_d

    iget-object v1, v0, Lcom/android/quickstep/views/TaskView;->mSplitScreenGroupShortcutsItem:Lcom/android/launcher3/model/data/I;

    if-nez v1, :cond_d

    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->shouldInflateGridStyle()Z

    move-result v1

    if-eqz v1, :cond_c

    iget-object v1, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    iget v1, v1, Lcom/android/launcher3/X3;->j0:I

    :goto_8
    int-to-float v1, v1

    sub-float/2addr v1, v15

    goto :goto_9

    :cond_c
    iget-object v1, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    iget v1, v1, Lcom/android/launcher3/X3;->i0:I

    goto :goto_8

    .line 46
    :cond_d
    iget-object v1, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    iget v1, v1, Lcom/android/launcher3/X3;->g0:I

    int-to-float v1, v1

    .line 47
    :goto_9
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridSingleTask()Z

    move-result v16

    if-nez v16, :cond_e

    if-eqz v11, :cond_f

    iget-object v11, v0, Lcom/android/quickstep/views/TaskView;->mSplitScreenGroupShortcutsItem:Lcom/android/launcher3/model/data/I;

    if-eqz v11, :cond_f

    :cond_e
    mul-float/2addr v1, v8

    .line 48
    :cond_f
    iget-object v11, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v11}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v11

    iget-boolean v11, v11, Lcom/android/launcher3/h0;->G0:Z

    if-eqz v11, :cond_10

    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridSingleTask()Z

    move-result v11

    if-eqz v11, :cond_10

    .line 49
    iget-object v1, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    iget v1, v1, Lcom/android/launcher3/X3;->h0:I

    int-to-float v1, v1

    mul-float/2addr v1, v8

    .line 50
    :cond_10
    iget-object v8, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v8}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v8

    iget-boolean v8, v8, Lcom/android/launcher3/h0;->G0:Z

    if-eqz v8, :cond_11

    iget-object v8, v0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    invoke-interface {v8}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v8

    iget-boolean v8, v8, Lcom/android/launcher3/h0;->N0:Z

    if-nez v8, :cond_11

    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridSingleTask()Z

    move-result v8

    if-nez v8, :cond_11

    add-float v8, v14, v13

    add-float/2addr v8, v1

    add-float/2addr v8, v15

    int-to-float v11, v6

    add-float/2addr v8, v11

    add-float/2addr v8, v11

    int-to-float v11, v9

    add-float/2addr v8, v11

    .line 51
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    move-result-object v11

    if-eqz v11, :cond_11

    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    move-result-object v11

    invoke-static {v11}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v11}, Lcom/android/quickstep/views/RecentsView;->getLastComputedTaskSize()Landroid/graphics/Rect;

    move-result-object v11

    if-eqz v11, :cond_11

    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    move-result-object v11

    invoke-static {v11}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v11}, Lcom/android/quickstep/views/RecentsView;->getLastComputedTaskSize()Landroid/graphics/Rect;

    move-result-object v11

    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v11

    int-to-float v11, v11

    cmpl-float v11, v8, v11

    if-lez v11, :cond_11

    .line 52
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    move-result-object v11

    invoke-static {v11}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v11}, Lcom/android/quickstep/views/RecentsView;->getLastComputedTaskSize()Landroid/graphics/Rect;

    move-result-object v11

    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v11

    int-to-float v11, v11

    sub-float/2addr v8, v11

    sub-float/2addr v1, v8

    :cond_11
    move v11, v1

    .line 53
    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 54
    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v8

    iput v8, v10, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 55
    iput v1, v10, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 56
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    move-result-object v8

    move-object/from16 v20, v2

    if-eqz v8, :cond_12

    const/16 v2, 0x10

    invoke-virtual {v8, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 57
    :cond_12
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    move-result-object v2

    const/4 v8, 0x0

    if-eqz v2, :cond_13

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 58
    :cond_13
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    move-result-object v2

    if-eqz v2, :cond_14

    invoke-virtual {v2, v8, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 59
    :cond_14
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/quickstep/views/TaskViewIcon;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    invoke-direct {v2, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    invoke-static {v14}, Ljava/lang/Math;->round(F)I

    move-result v5

    int-to-float v8, v5

    move/from16 v17, v8

    .line 61
    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->round(F)I

    move-result v8

    iput v8, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iput v8, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 62
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    move-result-object v8

    invoke-interface {v8, v5, v5}, Lcom/android/quickstep/views/TaskViewIcon;->setDrawableSize(II)V

    const/high16 v5, 0x40000000    # 2.0f

    div-float v8, v17, v5

    int-to-float v1, v1

    div-float/2addr v1, v5

    sub-float v1, v8, v1

    .line 63
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    move/from16 v17, v5

    int-to-float v5, v6

    div-float v5, v5, v17

    sub-float/2addr v8, v5

    .line 64
    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v19

    .line 65
    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v5, v0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    invoke-static {v5}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v5}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    invoke-direct {v8, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    move/from16 v5, v17

    move/from16 v17, v9

    .line 66
    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    move/from16 v18, v5

    iget-object v5, v0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    invoke-static {v5}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v5}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    invoke-direct {v9, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    move-result-object v21

    move/from16 v22, v1

    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-direct {v5, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    move-object/from16 v21, v2

    iget-object v2, v0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    int-to-float v2, v4

    move/from16 v23, v2

    int-to-float v2, v7

    div-float v2, v2, v18

    sub-float v2, v23, v2

    .line 69
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    move-object/from16 v18, v5

    .line 70
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutDirection()I

    move-result v5

    move/from16 v23, v6

    const/4 v6, 0x1

    if-ne v5, v6, :cond_15

    goto :goto_a

    :cond_15
    const/4 v6, 0x0

    .line 71
    :goto_a
    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v5

    move-object v0, v10

    move v10, v6

    move-object v6, v0

    move/from16 v24, v7

    move-object/from16 v0, v18

    move-object/from16 v7, v21

    move/from16 v16, v22

    move/from16 v18, v23

    invoke-interface/range {v5 .. v19}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setTaskTitleAndIconOrientationState(Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;ZFFFFFIIII)V

    move-object v5, v6

    move/from16 v6, v18

    .line 72
    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v11

    invoke-interface {v11, v0, v4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setTaskThumbnailOrientationState(Landroid/widget/FrameLayout$LayoutParams;I)V

    .line 73
    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v4

    invoke-interface {v4, v1, v2, v10}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setTaskLockIconOrientationState(Landroid/widget/FrameLayout$LayoutParams;IZ)V

    .line 74
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "getClassName(...)"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v4, 0x2

    const/4 v10, 0x0

    const-string v11, "DesktopClockSettingsActivity"

    const/4 v12, 0x0

    invoke-static {v2, v11, v12, v4, v10}, LD4/g;->y(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    move-object/from16 v2, p0

    .line 75
    invoke-direct {v2, v3}, Lcom/android/quickstep/views/TaskView;->updateSnapshotBackground(Lcom/android/quickstep/views/TaskContainer;)V

    goto :goto_b

    :cond_16
    move-object/from16 v2, p0

    .line 76
    :goto_b
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    move-result-object v0

    invoke-interface {v0, v7}, Lcom/android/quickstep/views/TaskViewIcon;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    move-result v4

    invoke-interface {v0, v4}, Lcom/android/quickstep/views/TaskViewIcon;->setRotation(F)V

    .line 79
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_17

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    :cond_17
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_18

    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setRotation(F)V

    .line 81
    :cond_18
    iput v6, v8, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 82
    iput v6, v8, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 83
    iget-object v0, v2, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    if-eqz v0, :cond_19

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    :cond_19
    iget-object v0, v2, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    if-eqz v0, :cond_1a

    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setRotation(F)V

    .line 85
    :cond_1a
    iput v6, v9, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iput v6, v9, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 86
    iget-object v0, v2, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    if-eqz v0, :cond_1b

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 87
    :cond_1b
    iget-object v0, v2, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    if-eqz v0, :cond_1c

    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setRotation(F)V

    :cond_1c
    move/from16 v13, v24

    .line 88
    iput v13, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iput v13, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 89
    iget-object v0, v2, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    if-eqz v0, :cond_1d

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    :cond_1d
    iget-object v0, v2, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    if-eqz v0, :cond_1e

    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setRotation(F)V

    .line 91
    :cond_1e
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    move-result-object v0

    if-eqz v0, :cond_1f

    invoke-virtual {v0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->initialize()V

    :cond_1f
    move-object/from16 v1, p1

    move-object v0, v2

    move-object/from16 v2, v20

    goto/16 :goto_0

    :cond_20
    return-void
.end method

.method public setThumbnailVisibility(II)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

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
    if-eqz v0, :cond_4

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 28
    .line 29
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 30
    .line 31
    if-ne v1, p2, :cond_0

    .line 32
    .line 33
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    :cond_2
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getShowWindowsView()Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    :cond_3
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getOverlay()Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0, p1}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_4
    return-void
.end method

.method public setTitleAlpha(F)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/TaskView;->mIsSupportWindowResize:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    instance-of v0, v0, Lcom/android/quickstep/views/IconView;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v2, "null cannot be cast to non-null type com.android.quickstep.views.IconView"

    .line 47
    .line 48
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    check-cast v0, Lcom/android/quickstep/views/IconView;

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/IconView;->setContentAlpha(F)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 57
    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Lcom/android/quickstep/views/TaskContainer;

    .line 72
    .line 73
    if-eqz p0, :cond_3

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    if-eqz p0, :cond_3

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 82
    .line 83
    .line 84
    :cond_3
    return-void
.end method

.method public setTitleHidden(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->mIsTitleHidden:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 7
    .line 8
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 17
    .line 18
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p1, v1}, Lcom/android/quickstep/views/TaskViewIcon;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 42
    .line 43
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 58
    .line 59
    if-eqz p1, :cond_0

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    .line 71
    .line 72
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    iget-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->mIsSupportWindowResize:Z

    .line 80
    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 84
    .line 85
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 89
    .line 90
    .line 91
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 92
    .line 93
    if-eqz p1, :cond_3

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-interface {p1, v0}, Lcom/android/quickstep/views/TaskViewIcon;->setVisibility(I)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 127
    .line 128
    invoke-interface {p1, v1}, Lcom/android/quickstep/views/TaskViewIcon;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 129
    .line 130
    .line 131
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/views/TaskView;->mMenuButton:Landroid/widget/ImageView;

    .line 132
    .line 133
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 148
    .line 149
    if-eqz p1, :cond_4

    .line 150
    .line 151
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    if-eqz p1, :cond_4

    .line 156
    .line 157
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 158
    .line 159
    .line 160
    :cond_4
    iget-boolean p1, p0, Lcom/android/quickstep/views/TaskView;->mhasLockButton:Z

    .line 161
    .line 162
    if-eqz p1, :cond_5

    .line 163
    .line 164
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mLockButton:Landroid/widget/ImageView;

    .line 165
    .line 166
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 170
    .line 171
    .line 172
    :cond_5
    return-void
.end method

.method public setUpShowAllInstancesListener()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getShowWindowsView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/TaskView;->getFilterUpdateCallback(Ljava/lang/String;)Landroid/view/View$OnClickListener;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-direct {p0, v2, v1}, Lcom/android/quickstep/views/TaskView;->updateFilterCallback(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    return-void
.end method

.method public final shouldInflateGridStyle()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->b()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 24
    .line 25
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "null cannot be cast to non-null type com.android.quickstep.views.RecentsView<*, *>"

    .line 30
    .line 31
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    const/4 v0, 0x1

    .line 41
    if-le p0, v0, :cond_0

    .line 42
    .line 43
    return v0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return p0
.end method

.method public final shouldShowSplash$Launcher_aospWithQuickstepInternalMiFavorRelease()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->isThumbnailValid()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_2
    return v0
.end method

.method public final startIconFadeInOnGestureComplete()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->iconFadeInOnGestureCompleteAnimator:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object v0, Lcom/android/quickstep/views/TaskView;->SETTLED_PROGRESS_GESTURE:Landroid/util/FloatProperty;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    new-array v1, v1, [F

    .line 12
    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    aput v2, v1, v3

    .line 17
    .line 18
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-wide/16 v1, 0x78

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Lcom/android/quickstep/views/TaskView$startIconFadeInOnGestureComplete$1$1;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/TaskView$startIconFadeInOnGestureComplete$1$1;-><init>(Lcom/android/quickstep/views/TaskView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/quickstep/views/TaskView;->iconFadeInOnGestureCompleteAnimator:Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    return-void
.end method

.method public final startMiniWindowMode()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->sourceComponent:Landroid/content/ComponentName;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->sourceComponent:Landroid/content/ComponentName;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Lh1/a;->I(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->startHome()V

    .line 57
    .line 58
    .line 59
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 67
    .line 68
    iget v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 69
    .line 70
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 71
    .line 72
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const/4 v1, 0x0

    .line 77
    invoke-static {p0, v0, v1}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->startActivityFromRecentsMiniWindowMode(Landroid/content/Context;II)V

    .line 78
    .line 79
    .line 80
    :cond_3
    :goto_0
    return-void
.end method

.method public final startWindowFreeForm(Landroid/content/Context;Landroid/content/Intent;II)V
    .locals 4

    .line 1
    const-string p0, "startWindowFreeForm i="

    .line 2
    .line 3
    const-string v0, "TaskView"

    .line 4
    .line 5
    const-string v1, "context"

    .line 6
    .line 7
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "i"

    .line 11
    .line 12
    invoke-static {p2, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :try_start_0
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x5

    .line 20
    invoke-virtual {v1, v2}, Landroid/app/ActivityOptions;->setLaunchWindowingMode(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const-string v2, "WindowReply"

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v3, " startMode ="

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    const-string v2, "Start_WindowReply_Mode"

    .line 62
    .line 63
    invoke-virtual {v1, v2, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 64
    .line 65
    .line 66
    :try_start_1
    new-instance p4, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    invoke-static {p3}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p1, p2, v1, p0}, Landroid/content/Context;->startActivityAsUser(Landroid/content/Intent;Landroid/os/Bundle;Landroid/os/UserHandle;)V

    .line 89
    .line 90
    .line 91
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 92
    .line 93
    return-void

    .line 94
    :catch_0
    move-exception p0

    .line 95
    :try_start_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    const-string p2, "startWindowFreeForm e="

    .line 101
    .line 102
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    goto :goto_1

    .line 116
    :catch_1
    move-exception p0

    .line 117
    goto :goto_0

    .line 118
    :cond_0
    const-string p0, "startWindowFreeForm null"

    .line 119
    .line 120
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    const-string p2, "startWindowFreeForm e2="

    .line 130
    .line 131
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    :goto_1
    return-void
.end method

.method protected updateFullscreenParams()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->thumbnailFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/TaskView;->updateFullscreenParams(Lcom/android/quickstep/FullscreenDrawParams;)V

    .line 2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    move-result-object v0

    .line 3
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 4
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 5
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailView()Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;

    move-result-object v2

    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->thumbnailFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    invoke-virtual {v3}, Lcom/android/quickstep/FullscreenDrawParams;->getCurrentCornerRadius()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;->setCornerRadius(F)V

    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    move-result-object v2

    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->thumbnailFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    invoke-virtual {v2, v3}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setFullscreenParams(Lcom/android/quickstep/FullscreenDrawParams;)V

    .line 7
    :goto_1
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getOverlay()Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    move-result-object v1

    iget-object v2, p0, Lcom/android/quickstep/views/TaskView;->thumbnailFullscreenParams:Lcom/android/quickstep/FullscreenDrawParams;

    invoke-virtual {v1, v2}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->setFullscreenParams(Lcom/android/quickstep/FullscreenDrawParams;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected final updateFullscreenParams(Lcom/android/quickstep/FullscreenDrawParams;)V
    .locals 2

    const-string v0, "fullscreenParams"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/android/quickstep/views/TaskView;->fullscreenProgress:F

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScaleX()F

    move-result v0

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScaleX()F

    move-result p0

    invoke-virtual {p1, v1, v0, p0}, Lcom/android/quickstep/FullscreenDrawParams;->setProgress(FFF)V

    :cond_0
    return-void
.end method

.method public final updateMiniWindowButtonState()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Lx1/O;->T1()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/16 v1, 0x8

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v0, :cond_a

    .line 14
    .line 15
    invoke-static {}, Lx1/O;->C2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-static {}, Lx1/O;->k1()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_a

    .line 26
    .line 27
    :cond_1
    invoke-static {}, Lx1/O;->I2()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_a

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->y0()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-static {}, Lx1/O;->S1()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_a

    .line 52
    .line 53
    :cond_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->G0()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_a

    .line 66
    .line 67
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 74
    .line 75
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->b()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_a

    .line 84
    .line 85
    :cond_3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    iget-object v0, v0, Lcom/android/quickstep/views/TaskContainer;->supportResize:Ljava/lang/Boolean;

    .line 92
    .line 93
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 94
    .line 95
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    goto :goto_0

    .line 100
    :cond_4
    move v0, v2

    .line 101
    :goto_0
    if-nez v0, :cond_5

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 105
    .line 106
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 110
    .line 111
    invoke-interface {v3}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->O0:Z

    .line 116
    .line 117
    const/4 v4, 0x1

    .line 118
    xor-int/2addr v3, v4

    .line 119
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 123
    .line 124
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    iget-object v3, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 128
    .line 129
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v3}, Landroid/widget/ImageView;->isEnabled()Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-eqz v3, :cond_6

    .line 137
    .line 138
    iget v3, p0, Lcom/android/quickstep/views/TaskView;->ALPHA_ENABLE:I

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_6
    iget v3, p0, Lcom/android/quickstep/views/TaskView;->ALPHA_DISABLE:I

    .line 142
    .line 143
    :goto_1
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    if-eqz v0, :cond_7

    .line 151
    .line 152
    iget-object v0, v0, Lcom/android/quickstep/views/TaskContainer;->supportResize:Ljava/lang/Boolean;

    .line 153
    .line 154
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 155
    .line 156
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    goto :goto_2

    .line 161
    :cond_7
    move v0, v2

    .line 162
    :goto_2
    if-eqz v0, :cond_8

    .line 163
    .line 164
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->isShowInOtherDisplay(Lcom/android/systemui/shared/recents/model/Task;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-nez v0, :cond_8

    .line 173
    .line 174
    goto :goto_3

    .line 175
    :cond_8
    move v4, v2

    .line 176
    :goto_3
    iput-boolean v4, p0, Lcom/android/quickstep/views/TaskView;->mIsSupportWindowResize:Z

    .line 177
    .line 178
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 179
    .line 180
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    iget-boolean v3, p0, Lcom/android/quickstep/views/TaskView;->mIsTitleHidden:Z

    .line 184
    .line 185
    if-nez v3, :cond_9

    .line 186
    .line 187
    iget-boolean p0, p0, Lcom/android/quickstep/views/TaskView;->mIsSupportWindowResize:Z

    .line 188
    .line 189
    if-eqz p0, :cond_9

    .line 190
    .line 191
    move v1, v2

    .line 192
    :cond_9
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_a
    :goto_4
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mMiniWindowButton:Landroid/widget/ImageView;

    .line 197
    .line 198
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 202
    .line 203
    .line 204
    iput-boolean v2, p0, Lcom/android/quickstep/views/TaskView;->mIsSupportWindowResize:Z

    .line 205
    .line 206
    return-void
.end method

.method public final updateSplitButtonState()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 9
    .line 10
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "asContext(...)"

    .line 15
    .line 16
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/android/launcher3/P2$a;->a(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->f0:Z

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView;->mSplitScreenButton:Landroid/widget/ImageView;

    .line 26
    .line 27
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    const/16 v0, 0x8

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public updateTaskSize(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    const-string v0, "lastComputedTaskSize"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "lastComputedGridTaskSize"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->updateTaskSizeMFV(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 19
    .line 20
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget v0, v0, Lcom/android/launcher3/h0;->S2:I

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iget-object v2, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 35
    .line 36
    invoke-interface {v2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->G0:Z

    .line 41
    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    move p2, p1

    .line 51
    move v2, v1

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    :goto_0
    add-int/2addr p2, v0

    .line 62
    int-to-float v1, v1

    .line 63
    int-to-float v3, v2

    .line 64
    div-float/2addr v1, v3

    .line 65
    sub-int v0, p2, v0

    .line 66
    .line 67
    sub-int/2addr v0, p1

    .line 68
    int-to-float p1, v0

    .line 69
    const/high16 v0, 0x40000000    # 2.0f

    .line 70
    .line 71
    div-float/2addr p1, v0

    .line 72
    goto :goto_1

    .line 73
    :cond_2
    add-int p2, p1, v0

    .line 74
    .line 75
    const/high16 p1, 0x3f800000    # 1.0f

    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    move v2, v1

    .line 79
    move v1, p1

    .line 80
    move p1, v0

    .line 81
    :goto_1
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/TaskView;->setNonGridScale(F)V

    .line 82
    .line 83
    .line 84
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/TaskView;->setBoxTranslationY(F)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    if-eqz p1, :cond_3

    .line 92
    .line 93
    iput v2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 94
    .line 95
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->updateThumbnailSize()V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_3
    new-instance p0, Ljava/lang/NullPointerException;

    .line 105
    .line 106
    const-string p1, "null cannot be cast to non-null type android.view.ViewGroup.LayoutParams"

    .line 107
    .line 108
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw p0
.end method

.method public updateTaskSizeMFV(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .locals 3

    .line 1
    const-string v0, "lastComputedTaskSize"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "lastComputedGridTaskSize"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 25
    .line 26
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->getThumbnailTopMargin(Lcom/android/launcher3/h0;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 36
    .line 37
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget v0, v0, Lcom/android/launcher3/h0;->S2:I

    .line 42
    .line 43
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v2, v1, p1, v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->updateTaskExpectedWidthAndHeight(III)Landroid/graphics/Point;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object v0, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 60
    .line 61
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->b()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 76
    .line 77
    .line 78
    iget p2, p1, Landroid/graphics/Point;->x:I

    .line 79
    .line 80
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 81
    .line 82
    int-to-float v1, v1

    .line 83
    int-to-float v0, v0

    .line 84
    div-float/2addr v1, v0

    .line 85
    goto :goto_1

    .line 86
    :cond_1
    iget p2, p1, Landroid/graphics/Point;->x:I

    .line 87
    .line 88
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 89
    .line 90
    const/high16 v1, 0x3f800000    # 1.0f

    .line 91
    .line 92
    :goto_1
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/TaskView;->setNonGridScale(F)V

    .line 93
    .line 94
    .line 95
    const/4 v0, 0x0

    .line 96
    invoke-direct {p0, v0}, Lcom/android/quickstep/views/TaskView;->setBoxTranslationY(F)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    if-eqz v0, :cond_2

    .line 104
    .line 105
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 106
    .line 107
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->updateThumbnailSize()V

    .line 113
    .line 114
    .line 115
    const/4 p0, 0x1

    .line 116
    return p0

    .line 117
    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    .line 118
    .line 119
    const-string p1, "null cannot be cast to non-null type android.view.ViewGroup.LayoutParams"

    .line 120
    .line 121
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    throw p0
.end method

.method protected updateThumbnailSize()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/quickstep/views/TaskView;->container:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 22
    .line 23
    invoke-interface {v2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget v2, v2, Lcom/android/launcher3/h0;->S2:I

    .line 28
    .line 29
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 36
    .line 37
    const-string v0, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 38
    .line 39
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw p0

    .line 43
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setupLayout()V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    return-void
.end method
