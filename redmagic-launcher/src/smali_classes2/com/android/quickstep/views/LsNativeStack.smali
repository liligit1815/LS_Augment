.class public final Lcom/android/quickstep/views/LsNativeStack;
.super Ljava/lang/Object;
.source "LsNativeStack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/LsNativeStack$FrameUpdate;,
        Lcom/android/quickstep/views/LsNativeStack$InitialFrameCommit;,
        Lcom/android/quickstep/views/LsNativeStack$EntryRevealStart;,
        Lcom/android/quickstep/views/LsNativeStack$EntryRevealUpdate;,
        Lcom/android/quickstep/views/LsNativeStack$EntryRevealEnd;,
        Lcom/android/quickstep/views/LsNativeStack$MemoryRefresh;,
        Lcom/android/quickstep/views/LsNativeStack$GestureLayerReset;
    }
.end annotation


# static fields
.field private static final EMPTY_ENTRY_TASK_IDS:[I

.field private static final EMPTY_ENTRY_TASK_VIEWS:[Lcom/android/quickstep/views/TaskView;

.field private static final MIUI_ALPHA_RATE:F = 4.0f

.field private static final MIUI_ALPHA_START:F = 0.4f

.field private static final MIUI_BASE_OFFSET_FRACTION:F = -0.087064676f

.field private static final MIUI_BASE_TASK_SCALE:F = 0.7f

.field private static final MIUI_DEPTH_SCALE_GAIN:F = 0.2f

.field private static final MIUI_DEPTH_STEP:F = 0.125f

.field private static final MIUI_EXP_RATE:F = 8.0f

.field private static final MIUI_FOCUS_DEPTH:F = -0.1799278f

.field private static final MIUI_INTERIOR_SCROLL_CORRECTION:F = 0.15f

.field private static final MIUI_TITLE_RATE:F = 12.0f

.field private static final MIUI_TITLE_START:F = 0.2f

.field private static final NATIVE_STACK_STYLE:I = 0x3

.field private static final PREF_SHOW_MEMORY:Ljava/lang/String; = "ls_recents_stack_show_memory"

.field private static final RES_CLEAR_ALL_BUTTON:I = 0x7f0b04d6

.field private static final RES_CLEAR_ALL_CONTAINER:I = 0x7f0b04d7

.field private static final RES_EMPTY_MESSAGE:I = 0x7f0b06ca

.field private static final RES_FIRST_BACK_CENTER:I = 0x7f0c010a

.field private static final RES_FOCUS_CENTER:I = 0x7f0c0109

.field private static final RES_FOCUS_SCALE:I = 0x7f0c0104

.field private static final RES_INCOMING_DISTANCE:I = 0x7f0c010d

.field private static final RES_INCOMING_SCALE_GAIN:I = 0x7f0c010e

.field private static final RES_MAX_DEPTH:I = 0x7f0c0106

.field private static final RES_MEMORY_AVAILABLE:I = 0x7f0b06c7

.field private static final RES_MEMORY_AVAILABLE_FORMAT:I = 0x7f1404b8

.field private static final RES_MEMORY_CONTAINER:I = 0x7f0b06c6

.field private static final RES_MEMORY_TOTAL:I = 0x7f0b06c9

.field private static final RES_MEMORY_TOTAL_FORMAT:I = 0x7f1404b9

.field private static final RES_MIN_BACK_SCALE:I = 0x7f0c010f

.field private static final RES_NATIVE_CENTER_CORRECTION:I = 0x7f0c0110

.field private static final RES_RECENT_STYLE_KEY:I = 0x7f1403b7

.field private static final RES_SCALE_STEP:I = 0x7f0c0105

.field private static final RES_TAIL_DECAY:I = 0x7f0c010c

.field private static final RES_TAIL_GAP:I = 0x7f0c010b

.field private static final TAG:Ljava/lang/String; = "LsNativeStack"

.field private static final TEMP_DESCENDANT_BOUNDS:Landroid/graphics/Rect;

.field private static final TEMP_HIT_BOUNDS:Landroid/graphics/Rect;

.field private static final TEMP_LIVE_SURFACE_BOUNDS:Landroid/graphics/RectF;

.field private static final TEMP_ROOT_LOCATION:[I

.field private static final TEMP_VIEW_LOCATION:[I

.field private static activeOverviewRecents:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/RecentsView;",
            ">;"
        }
    .end annotation
.end field

.field private static cachedDensityDpi:I

.field private static clearAllHostBaseTranslationY:F

.field private static decorationRecents:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/RecentsView;",
            ">;"
        }
    .end annotation
.end field

.field private static drawUpdatePending:Z

.field private static drawUpdateRecents:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/RecentsView;",
            ">;"
        }
    .end annotation
.end field

.field private static entryAnchorPage:I

.field private static entryAnchorRecents:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/RecentsView;",
            ">;"
        }
    .end annotation
.end field

.field private static entryAnchorTask:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static entryAnchorTaskId:I

.field private static entryFromApp:Z

.field private static entryOrderRecents:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/RecentsView;",
            ">;"
        }
    .end annotation
.end field

.field private static entryRevealAnimator:Landroid/animation/ValueAnimator;

.field private static entryRevealProgress:F

.field private static entryRevealRecents:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/RecentsView;",
            ">;"
        }
    .end annotation
.end field

.field private static entryStabilizerGeneration:I

.field private static entryTaskOrderIds:[I

.field private static entryTaskOrderSize:I

.field private static entryTaskOrderViews:[Lcom/android/quickstep/views/TaskView;

.field private static firstBackCenterFraction:F

.field private static focusCenterFraction:F

.field private static focusScale:F

.field private static frameUpdateRecents:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/RecentsView;",
            ">;"
        }
    .end annotation
.end field

.field private static frameUpdateScheduled:Z

.field private static gestureLayerGeneration:I

.field private static gestureLayerTask:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static incomingDistanceFraction:F

.field private static incomingScaleGain:F

.field private static lastAuditedPage:I

.field private static lastDecorationHeight:I

.field private static lastDecorationShowMemory:Z

.field private static lastDecorationTaskCount:I

.field private static lastDecorationWidth:I

.field private static lastErrorLogMs:J

.field private static lastLiveAppliedScale:F

.field private static lastMemoryUpdateMs:J

.field private static liveEntryPageProgress:F

.field private static liveEntryStartScale:F

.field private static liveSimulatorOverviewTarget:Z

.field private static maxDepth:I

.field private static memoryRefreshRecents:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/RecentsView;",
            ">;"
        }
    .end annotation
.end field

.field private static memoryRefreshScheduled:Z

.field private static minBackScale:F

.field private static nativeCenterCorrectionFraction:F

.field private static overviewActive:Z

.field private static overviewEntryGeneration:I

.field private static overviewEntryPending:Z

.field private static overviewPendingRecents:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/RecentsView;",
            ">;"
        }
    .end annotation
.end field

.field private static pagerAuditRecents:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/RecentsView;",
            ">;"
        }
    .end annotation
.end field

.field private static pendingDismissOrdinal:I

.field private static pendingDismissPagePosition:F

.field private static pendingDismissRecents:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/RecentsView;",
            ">;"
        }
    .end annotation
.end field

.field private static pendingDismissTask:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation
.end field

.field private static scaleStep:F

.field private static tailDecay:F

.field private static tailGapFraction:F

.field private static translatedClearAllHost:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 80
    const/4 v0, -0x1

    sput v0, Lcom/android/quickstep/views/LsNativeStack;->cachedDensityDpi:I

    .line 81
    const/4 v1, 0x0

    new-array v2, v1, [Lcom/android/quickstep/views/TaskView;

    sput-object v2, Lcom/android/quickstep/views/LsNativeStack;->EMPTY_ENTRY_TASK_VIEWS:[Lcom/android/quickstep/views/TaskView;

    .line 82
    new-array v1, v1, [I

    sput-object v1, Lcom/android/quickstep/views/LsNativeStack;->EMPTY_ENTRY_TASK_IDS:[I

    .line 95
    new-instance v1, Ljava/lang/ref/WeakReference;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcom/android/quickstep/views/LsNativeStack;->decorationRecents:Ljava/lang/ref/WeakReference;

    .line 97
    const/high16 v1, -0x80000000

    sput v1, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationTaskCount:I

    .line 98
    sput v0, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationWidth:I

    .line 99
    sput v0, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationHeight:I

    .line 100
    const/4 v3, 0x1

    sput-boolean v3, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationShowMemory:Z

    .line 101
    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v3, Lcom/android/quickstep/views/LsNativeStack;->translatedClearAllHost:Ljava/lang/ref/WeakReference;

    .line 105
    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v3, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorRecents:Ljava/lang/ref/WeakReference;

    .line 107
    sput v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    .line 108
    sput v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorTaskId:I

    .line 109
    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v3, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorTask:Ljava/lang/ref/WeakReference;

    .line 111
    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v3, Lcom/android/quickstep/views/LsNativeStack;->entryOrderRecents:Ljava/lang/ref/WeakReference;

    .line 113
    sget-object v3, Lcom/android/quickstep/views/LsNativeStack;->EMPTY_ENTRY_TASK_VIEWS:[Lcom/android/quickstep/views/TaskView;

    sput-object v3, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderViews:[Lcom/android/quickstep/views/TaskView;

    .line 114
    sget-object v3, Lcom/android/quickstep/views/LsNativeStack;->EMPTY_ENTRY_TASK_IDS:[I

    sput-object v3, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderIds:[I

    .line 117
    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v3, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    .line 123
    const/high16 v3, 0x7fc00000    # Float.NaN

    sput v3, Lcom/android/quickstep/views/LsNativeStack;->lastLiveAppliedScale:F

    .line 124
    sput v3, Lcom/android/quickstep/views/LsNativeStack;->liveEntryStartScale:F

    .line 125
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v4, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    .line 129
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v4, Lcom/android/quickstep/views/LsNativeStack;->entryRevealRecents:Ljava/lang/ref/WeakReference;

    .line 131
    const/high16 v4, 0x3f800000    # 1.0f

    sput v4, Lcom/android/quickstep/views/LsNativeStack;->entryRevealProgress:F

    .line 133
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v4, Lcom/android/quickstep/views/LsNativeStack;->gestureLayerTask:Ljava/lang/ref/WeakReference;

    .line 136
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v4, Lcom/android/quickstep/views/LsNativeStack;->pagerAuditRecents:Ljava/lang/ref/WeakReference;

    .line 138
    sput v1, Lcom/android/quickstep/views/LsNativeStack;->lastAuditedPage:I

    .line 139
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcom/android/quickstep/views/LsNativeStack;->frameUpdateRecents:Ljava/lang/ref/WeakReference;

    .line 151
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcom/android/quickstep/views/LsNativeStack;->drawUpdateRecents:Ljava/lang/ref/WeakReference;

    .line 154
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    .line 156
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissTask:Ljava/lang/ref/WeakReference;

    .line 158
    sput v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissOrdinal:I

    .line 167
    sput v3, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissPagePosition:F

    .line 168
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->memoryRefreshRecents:Ljava/lang/ref/WeakReference;

    .line 171
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->TEMP_DESCENDANT_BOUNDS:Landroid/graphics/Rect;

    .line 172
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->TEMP_HIT_BOUNDS:Landroid/graphics/Rect;

    .line 173
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->TEMP_LIVE_SURFACE_BOUNDS:Landroid/graphics/RectF;

    .line 174
    const/4 v0, 0x2

    new-array v1, v0, [I

    sput-object v1, Lcom/android/quickstep/views/LsNativeStack;->TEMP_VIEW_LOCATION:[I

    .line 175
    new-array v0, v0, [I

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->TEMP_ROOT_LOCATION:[I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 178
    return-void
.end method

.method static synthetic access$000()Ljava/lang/ref/WeakReference;
    .locals 1

    .line 33
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->frameUpdateRecents:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/quickstep/views/RecentsView;I)V
    .locals 0

    .line 33
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->setEntryPageAligned(Lcom/android/quickstep/views/RecentsView;I)V

    return-void
.end method

.method static synthetic access$102(Z)Z
    .locals 0

    .line 33
    sput-boolean p0, Lcom/android/quickstep/views/LsNativeStack;->frameUpdateScheduled:Z

    return p0
.end method

.method static synthetic access$1100(Lcom/android/quickstep/views/RecentsView;I)Z
    .locals 0

    .line 33
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->isEntryGeometryReady(Lcom/android/quickstep/views/RecentsView;I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1202(I)I
    .locals 0

    .line 33
    sput p0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    return p0
.end method

.method static synthetic access$1300()Ljava/lang/ref/WeakReference;
    .locals 1

    .line 33
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealRecents:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$1402(F)F
    .locals 0

    .line 33
    sput p0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealProgress:F

    return p0
.end method

.method static synthetic access$1500()Landroid/animation/ValueAnimator;
    .locals 1

    .line 33
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealAnimator:Landroid/animation/ValueAnimator;

    return-object v0
.end method

.method static synthetic access$1502(Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 33
    sput-object p0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealAnimator:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 33
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->finishEntryReveal(Lcom/android/quickstep/views/RecentsView;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 33
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->startEntryRevealIfArmed(Lcom/android/quickstep/views/RecentsView;)V

    return-void
.end method

.method static synthetic access$1800()I
    .locals 1

    .line 33
    sget v0, Lcom/android/quickstep/views/LsNativeStack;->gestureLayerGeneration:I

    return v0
.end method

.method static synthetic access$1900()Ljava/lang/ref/WeakReference;
    .locals 1

    .line 33
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->gestureLayerTask:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/ref/WeakReference;
    .locals 1

    .line 33
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->memoryRefreshRecents:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$302(Z)Z
    .locals 0

    .line 33
    sput-boolean p0, Lcom/android/quickstep/views/LsNativeStack;->memoryRefreshScheduled:Z

    return p0
.end method

.method static synthetic access$400(Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 33
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->refreshMemoryLabels(Lcom/android/quickstep/views/RecentsView;)V

    return-void
.end method

.method static synthetic access$500()I
    .locals 1

    .line 33
    sget v0, Lcom/android/quickstep/views/LsNativeStack;->entryStabilizerGeneration:I

    return v0
.end method

.method static synthetic access$600(Lcom/android/quickstep/views/RecentsView;)Z
    .locals 0

    .line 33
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTaskOrderActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 33
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->getPreferredEntryTask(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/TaskView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z
    .locals 0

    .line 33
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->captureEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$900(Lcom/android/quickstep/views/RecentsView;)I
    .locals 0

    .line 33
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->resolveEntryAnchorPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result p0

    return p0
.end method

.method public static adjustDismissOffset(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;Lcom/android/quickstep/views/TaskView;I)I
    .locals 3

    .line 1503
    if-eqz p3, :cond_8

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    if-eqz v0, :cond_8

    instance-of v0, p1, Lcom/android/quickstep/views/TaskView;

    if-eqz v0, :cond_8

    if-nez p2, :cond_0

    goto/16 :goto_2

    .line 1508
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 1509
    invoke-virtual {p0, p2}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result p2

    .line 1510
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v0

    .line 1511
    invoke-static {p0, p2}, Lcom/android/quickstep/views/LsNativeStack;->getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I

    move-result p2

    .line 1512
    nop

    .line 1513
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->getVisualFocusPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result v1

    .line 1512
    invoke-static {p0, v1}, Lcom/android/quickstep/views/LsNativeStack;->getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v1

    .line 1514
    if-gez v1, :cond_1

    .line 1515
    nop

    .line 1516
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v1

    invoke-interface {v1, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    move-result v1

    int-to-float v1, v1

    .line 1515
    invoke-static {p0, v1}, Lcom/android/quickstep/views/LsNativeStack;->findNearestTaskPage(Lcom/android/quickstep/views/RecentsView;F)I

    move-result v1

    .line 1517
    invoke-static {p0, v1}, Lcom/android/quickstep/views/LsNativeStack;->getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v1

    .line 1519
    :cond_1
    const/4 v2, 0x0

    if-ltz v0, :cond_7

    if-ltz p2, :cond_7

    .line 1520
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    if-lt p2, v1, :cond_7

    if-gt v0, p2, :cond_2

    goto :goto_1

    .line 1525
    :cond_2
    check-cast p1, Lcom/android/quickstep/views/TaskView;

    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->getRelativeDepth(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)F

    move-result p1

    .line 1526
    const/4 p2, 0x0

    cmpg-float v0, p1, p2

    if-lez v0, :cond_6

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->maxDepth:I

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    cmpl-float v0, p1, v0

    if-lez v0, :cond_3

    goto :goto_0

    .line 1529
    :cond_3
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->getCenterForDepth(Lcom/android/quickstep/views/RecentsView;F)F

    move-result v0

    .line 1530
    sub-float/2addr p1, v1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 1531
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->getCenterForDepth(Lcom/android/quickstep/views/RecentsView;F)F

    move-result p0

    .line 1532
    sub-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1533
    if-nez p0, :cond_4

    .line 1534
    return v2

    .line 1536
    :cond_4
    if-gez p3, :cond_5

    neg-int p0, p0

    :cond_5
    return p0

    .line 1527
    :cond_6
    :goto_0
    return v2

    .line 1522
    :cond_7
    :goto_1
    return v2

    .line 1537
    :catchall_0
    move-exception p0

    .line 1538
    return p3

    .line 1505
    :cond_8
    :goto_2
    return p3
.end method

.method private static applyStackClearAllGeometry(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 4

    .line 2307
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_7

    if-eqz p1, :cond_7

    if-eqz p2, :cond_7

    .line 2308
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_7

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_7

    .line 2309
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_7

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_7

    .line 2310
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_2

    .line 2315
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 2316
    invoke-static {p1, p2}, Lcom/android/quickstep/views/LsNativeStack;->resetClearAllGeometry(Landroid/view/View;Landroid/view/View;)V

    .line 2317
    return-void

    .line 2322
    :cond_1
    invoke-static {p1}, Lcom/android/quickstep/views/LsNativeStack;->getClearAllActionHost(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 2323
    const/4 v1, 0x1

    if-eqz v0, :cond_4

    .line 2324
    sget-object v2, Lcom/android/quickstep/views/LsNativeStack;->translatedClearAllHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 2325
    if-eq v2, v0, :cond_3

    .line 2326
    if-eqz v2, :cond_2

    .line 2327
    sget v3, Lcom/android/quickstep/views/LsNativeStack;->clearAllHostBaseTranslationY:F

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 2329
    :cond_2
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v2, Lcom/android/quickstep/views/LsNativeStack;->translatedClearAllHost:Ljava/lang/ref/WeakReference;

    .line 2330
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v2

    sput v2, Lcom/android/quickstep/views/LsNativeStack;->clearAllHostBaseTranslationY:F

    .line 2332
    :cond_3
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 2333
    invoke-static {p1, v1}, Lcom/android/quickstep/views/LsNativeStack;->setClearAllParentClipping(Landroid/view/View;Z)V

    .line 2334
    goto :goto_0

    .line 2335
    :cond_4
    const/4 v2, 0x0

    invoke-static {p1, v2}, Lcom/android/quickstep/views/LsNativeStack;->setClearAllParentClipping(Landroid/view/View;Z)V

    .line 2337
    :goto_0
    sget-object v2, Lcom/android/quickstep/views/LsNativeStack;->TEMP_VIEW_LOCATION:[I

    invoke-virtual {p1, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 2338
    sget-object v2, Lcom/android/quickstep/views/LsNativeStack;->TEMP_ROOT_LOCATION:[I

    invoke-virtual {p0, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 2342
    sget-object v2, Lcom/android/quickstep/views/LsNativeStack;->TEMP_VIEW_LOCATION:[I

    aget v2, v2, v1

    sget-object v3, Lcom/android/quickstep/views/LsNativeStack;->TEMP_ROOT_LOCATION:[I

    aget v1, v3, v1

    sub-int/2addr v2, v1

    int-to-float v1, v2

    .line 2343
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x3f000000    # 0.5f

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    .line 2344
    if-eqz v0, :cond_5

    .line 2345
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v2

    sub-float/2addr v1, v2

    .line 2347
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    int-to-float p0, p0

    const v2, 0x3f6cc28f

    mul-float/2addr p0, v2

    .line 2348
    if-eqz v0, :cond_6

    .line 2349
    sub-float/2addr p0, v1

    invoke-virtual {v0, p0}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_1

    .line 2351
    :cond_6
    sub-float/2addr p0, v1

    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 2357
    :goto_1
    const/high16 p0, 0x3f800000    # 1.0f

    invoke-virtual {p2, p0}, Landroid/view/View;->setScaleX(F)V

    .line 2358
    invoke-virtual {p2, p0}, Landroid/view/View;->setScaleY(F)V

    .line 2359
    return-void

    .line 2311
    :cond_7
    :goto_2
    return-void
.end method

.method private static armEntryReveal(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 1237
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 1238
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1239
    const/4 v0, 0x0

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealAnimator:Landroid/animation/ValueAnimator;

    .line 1241
    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealRecents:Ljava/lang/ref/WeakReference;

    .line 1242
    const/4 v0, 0x0

    sput v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealProgress:F

    .line 1243
    new-instance v0, Lcom/android/quickstep/views/LsNativeStack$EntryRevealStart;

    invoke-direct {v0, p0}, Lcom/android/quickstep/views/LsNativeStack$EntryRevealStart;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 1244
    return-void
.end method

.method public static beforeDispatchDraw(Lcom/android/quickstep/views/RecentsView;)V
    .locals 3

    .line 601
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    if-nez v0, :cond_0

    .line 602
    return-void

    .line 604
    :cond_0
    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->drawUpdatePending:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->drawUpdateRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    .line 605
    :goto_0
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTransitionActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v2

    .line 606
    if-nez v0, :cond_2

    if-nez v2, :cond_2

    .line 607
    return-void

    .line 609
    :cond_2
    if-eqz v0, :cond_3

    .line 610
    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->drawUpdatePending:Z

    .line 612
    :cond_3
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    .line 613
    return-void
.end method

.method private static cacheGestureLayer(Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 581
    return-void
.end method

.method private static captureEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z
    .locals 9

    .line 669
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v0

    .line 670
    const/4 v1, 0x0

    if-gtz v0, :cond_0

    .line 671
    return v1

    .line 673
    :cond_0
    if-eqz p1, :cond_6

    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result v2

    if-gez v2, :cond_1

    goto/16 :goto_2

    .line 677
    :cond_1
    new-array v2, v0, [Lcom/android/quickstep/views/TaskView;

    .line 678
    new-array v3, v0, [I

    .line 679
    nop

    .line 680
    aput-object p1, v2, v1

    .line 681
    invoke-static {p1}, Lcom/android/quickstep/views/LsNativeStack;->getPrimaryTaskId(Lcom/android/quickstep/views/TaskView;)I

    move-result v4

    aput v4, v3, v1

    .line 682
    const/4 v4, 0x1

    move v5, v1

    move v6, v4

    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v7

    if-ge v5, v7, :cond_4

    if-ge v6, v0, :cond_4

    .line 683
    invoke-virtual {p0, v5}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 684
    instance-of v8, v7, Lcom/android/quickstep/views/TaskView;

    if-eqz v8, :cond_3

    if-ne v7, p1, :cond_2

    .line 685
    goto :goto_1

    .line 687
    :cond_2
    check-cast v7, Lcom/android/quickstep/views/TaskView;

    .line 688
    aput-object v7, v2, v6

    .line 689
    add-int/lit8 v8, v6, 0x1

    invoke-static {v7}, Lcom/android/quickstep/views/LsNativeStack;->getPrimaryTaskId(Lcom/android/quickstep/views/TaskView;)I

    move-result v7

    aput v7, v3, v6

    move v6, v8

    .line 682
    :cond_3
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 691
    :cond_4
    if-gtz v6, :cond_5

    .line 692
    return v1

    .line 695
    :cond_5
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryOrderRecents:Ljava/lang/ref/WeakReference;

    .line 696
    sput-object v2, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderViews:[Lcom/android/quickstep/views/TaskView;

    .line 697
    sput-object v3, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderIds:[I

    .line 698
    sput v6, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderSize:I

    .line 699
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorTask:Ljava/lang/ref/WeakReference;

    .line 700
    aget p1, v3, v1

    sput p1, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorTaskId:I

    .line 701
    invoke-static {p0, v6}, Lcom/android/quickstep/views/LsNativeStack;->getInitialTaskOrdinal(Lcom/android/quickstep/views/RecentsView;I)I

    move-result p1

    aget-object p1, v2, p1

    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result p1

    sput p1, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    .line 702
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p1, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorRecents:Ljava/lang/ref/WeakReference;

    .line 703
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "entry identity taskId="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorTaskId:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " page="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " tasks="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " fromApp="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->entryFromApp:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " focusOrdinal="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 705
    invoke-static {p0, v6}, Lcom/android/quickstep/views/LsNativeStack;->getInitialTaskOrdinal(Lcom/android/quickstep/views/RecentsView;I)I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 703
    const-string p1, "LsNativeStack"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    return v4

    .line 674
    :cond_6
    :goto_2
    return v1
.end method

.method private static clamp(F)F
    .locals 1

    .line 2139
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    const/4 v0, 0x0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method

.method private static clearEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 710
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_0

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryOrderRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 711
    return-void

    .line 713
    :cond_0
    const/4 p0, -0x1

    sput p0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    .line 714
    sput p0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorTaskId:I

    .line 715
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorTask:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 716
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 717
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->entryOrderRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 718
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->EMPTY_ENTRY_TASK_VIEWS:[Lcom/android/quickstep/views/TaskView;

    sput-object p0, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderViews:[Lcom/android/quickstep/views/TaskView;

    .line 719
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->EMPTY_ENTRY_TASK_IDS:[I

    sput-object p0, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderIds:[I

    .line 720
    const/4 p0, 0x0

    sput p0, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderSize:I

    .line 721
    return-void
.end method

.method private static clearPendingDismissState(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 972
    if-eqz p0, :cond_0

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 973
    return-void

    .line 975
    :cond_0
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 976
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissTask:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 977
    const/4 p0, -0x1

    sput p0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissOrdinal:I

    .line 978
    const/high16 p0, 0x7fc00000    # Float.NaN

    sput p0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissPagePosition:F

    .line 979
    return-void
.end method

.method public static commitInitialPage(Lcom/android/quickstep/views/RecentsView;I)V
    .locals 2

    .line 1185
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1186
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->setCurrentPageIfChanged(Lcom/android/quickstep/views/RecentsView;I)V

    .line 1187
    return-void

    .line 1189
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackEntryPending()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1190
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->setCurrentPageIfChanged(Lcom/android/quickstep/views/RecentsView;I)V

    .line 1191
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->scheduleFrameUpdate(Lcom/android/quickstep/views/RecentsView;)V

    .line 1192
    return-void

    .line 1194
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isRecentsAnimationRunning()Z

    move-result v0

    .line 1195
    if-nez v0, :cond_3

    .line 1196
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-ne v0, p0, :cond_2

    .line 1197
    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    .line 1198
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 1200
    :cond_2
    sget v0, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryGeneration:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryGeneration:I

    .line 1201
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setNativeStackEntryPending(Z)V

    .line 1214
    :cond_3
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->getPreferredEntryTask(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/TaskView;

    move-result-object v0

    .line 1215
    if-eqz v0, :cond_4

    .line 1216
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->captureEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z

    .line 1218
    :cond_4
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->resolveEntryAnchorPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result v0

    .line 1219
    if-ltz v0, :cond_5

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 1220
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->setEntryPageAligned(Lcom/android/quickstep/views/RecentsView;I)V

    .line 1221
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    goto :goto_0

    .line 1223
    :cond_5
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->setCurrentPageIfChanged(Lcom/android/quickstep/views/RecentsView;I)V

    .line 1225
    :goto_0
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->startEntryRevealIfArmed(Lcom/android/quickstep/views/RecentsView;)V

    .line 1226
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->scheduleInitialFrameCommit(Lcom/android/quickstep/views/RecentsView;)V

    .line 1227
    return-void
.end method

.method private static ensureEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;)Z
    .locals 2

    .line 752
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->refreshEntryTaskBindings(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 753
    return v1

    .line 755
    :cond_0
    sget v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorTaskId:I

    if-ltz v0, :cond_1

    .line 756
    sget v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorTaskId:I

    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewByTaskId(I)Lcom/android/quickstep/views/TaskView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 757
    :goto_0
    if-nez v0, :cond_2

    .line 758
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->getPreferredEntryTask(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/TaskView;

    move-result-object v0

    .line 760
    :cond_2
    if-eqz v0, :cond_3

    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->captureEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z

    move-result p0

    if-eqz p0, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method private static findNearestTaskPage(Lcom/android/quickstep/views/RecentsView;F)I
    .locals 5

    .line 1043
    nop

    .line 1044
    nop

    .line 1045
    const/4 v0, -0x1

    const/high16 v1, 0x7f800000    # Float.POSITIVE_INFINITY

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 1046
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v3, v3, Lcom/android/quickstep/views/TaskView;

    if-nez v3, :cond_0

    .line 1047
    goto :goto_1

    .line 1049
    :cond_0
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->getScrollForPage(I)I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, p1

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 1050
    cmpg-float v4, v3, v1

    if-gez v4, :cond_1

    .line 1051
    nop

    .line 1052
    move v0, v2

    move v1, v3

    .line 1045
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1055
    :cond_2
    return v0
.end method

.method public static findTouchedTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/views/BaseDragLayer;Landroid/view/MotionEvent;)Lcom/android/quickstep/views/TaskView;
    .locals 9

    .line 1281
    const-string v0, "LsNativeStack"

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_a

    if-nez p1, :cond_0

    goto/16 :goto_4

    .line 1285
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->getVisualFocusPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result v1

    .line 1286
    if-ltz v1, :cond_1

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 1287
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v2

    .line 1288
    :goto_0
    instance-of v3, v1, Lcom/android/quickstep/views/TaskView;

    if-eqz v3, :cond_2

    .line 1289
    check-cast v1, Lcom/android/quickstep/views/TaskView;

    goto :goto_1

    :cond_2
    move-object v1, v2

    .line 1294
    :goto_1
    const/4 v3, 0x0

    invoke-static {p0, p1, v1, p2, v3}, Lcom/android/quickstep/views/LsNativeStack;->isTouchableTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/quickstep/views/TaskView;Landroid/view/MotionEvent;Z)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1295
    invoke-static {v1}, Lcom/android/quickstep/views/LsNativeStack;->cacheGestureLayer(Lcom/android/quickstep/views/TaskView;)V

    .line 1296
    const-string p0, "dismiss hit mapped to visual focus"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1297
    return-object v1

    .line 1299
    :cond_3
    nop

    .line 1300
    nop

    .line 1301
    const v4, -0x800001

    move-object v5, v2

    :goto_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v6

    if-ge v3, v6, :cond_8

    .line 1302
    invoke-virtual {p0, v3}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 1303
    instance-of v7, v6, Lcom/android/quickstep/views/TaskView;

    if-nez v7, :cond_4

    .line 1304
    goto :goto_3

    .line 1306
    :cond_4
    check-cast v6, Lcom/android/quickstep/views/TaskView;

    .line 1307
    if-eq v6, v1, :cond_7

    .line 1308
    const/4 v7, 0x1

    invoke-static {p0, p1, v6, p2, v7}, Lcom/android/quickstep/views/LsNativeStack;->isTouchableTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/quickstep/views/TaskView;Landroid/view/MotionEvent;Z)Z

    move-result v7

    if-nez v7, :cond_5

    .line 1309
    goto :goto_3

    .line 1311
    :cond_5
    invoke-virtual {v6}, Lcom/android/quickstep/views/TaskView;->getTranslationZ()F

    move-result v7

    .line 1312
    if-eqz v5, :cond_6

    cmpl-float v8, v7, v4

    if-lez v8, :cond_7

    .line 1313
    :cond_6
    nop

    .line 1314
    move-object v5, v6

    move v4, v7

    .line 1301
    :cond_7
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1317
    :cond_8
    if-eqz v5, :cond_9

    .line 1318
    invoke-static {v5}, Lcom/android/quickstep/views/LsNativeStack;->cacheGestureLayer(Lcom/android/quickstep/views/TaskView;)V

    .line 1319
    const-string p0, "dismiss hit mapped to visible top layer"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1321
    :cond_9
    return-object v5

    .line 1322
    :catchall_0
    move-exception p0

    .line 1323
    const-string p1, "deck hit-test failed"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1324
    return-object v2

    .line 1282
    :cond_a
    :goto_4
    return-object v2
.end method

.method private static finishCachedEntryStagingIfReady(Lcom/android/quickstep/views/RecentsView;I)V
    .locals 7

    .line 896
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isRecentsAnimationRunning()Z

    move-result v0

    if-nez v0, :cond_9

    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->overviewActive:Z

    if-eqz v0, :cond_9

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    .line 897
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_9

    .line 898
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTaskOrderActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 901
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackEntryPending()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    .line 902
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 903
    :goto_1
    if-nez v0, :cond_3

    .line 904
    return-void

    .line 906
    :cond_3
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->resolveEntryAnchorPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result v0

    .line 907
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryGeometryReady(Lcom/android/quickstep/views/RecentsView;I)Z

    move-result v2

    if-nez v2, :cond_4

    .line 908
    return-void

    .line 910
    :cond_4
    sget v2, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderSize:I

    invoke-static {p0, v2}, Lcom/android/quickstep/views/LsNativeStack;->getInitialTaskOrdinal(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v2

    invoke-static {p0, v2}, Lcom/android/quickstep/views/LsNativeStack;->getEntryTaskForOrdinal(Lcom/android/quickstep/views/RecentsView;I)Lcom/android/quickstep/views/TaskView;

    move-result-object v2

    .line 911
    if-eqz v2, :cond_8

    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result v3

    if-ne v3, v0, :cond_8

    .line 912
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getAlpha()F

    move-result v3

    const v4, 0x3c23d70a    # 0.01f

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_5

    goto/16 :goto_2

    .line 915
    :cond_5
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v3

    .line 916
    invoke-interface {v3, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getChildStart(Landroid/view/View;)I

    move-result v4

    int-to-float v4, v4

    .line 917
    invoke-interface {v3, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimarySize(Landroid/view/View;)I

    move-result v5

    int-to-float v5, v5

    const/high16 v6, 0x3f000000    # 0.5f

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    .line 918
    invoke-interface {v3, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v4, v5

    .line 920
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getTranslationX()F

    move-result v5

    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getTranslationY()F

    move-result v2

    .line 919
    invoke-interface {v3, v5, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(FF)F

    move-result v2

    add-float/2addr v4, v2

    .line 921
    int-to-float p1, p1

    const v2, -0x41c7c102

    invoke-static {p1, v2}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiCenter(FF)F

    move-result p1

    .line 922
    nop

    .line 923
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x3fc00000    # 1.5f

    mul-float/2addr v2, v3

    .line 922
    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 924
    sub-float p1, v4, p1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpl-float p1, p1, v2

    if-lez p1, :cond_6

    .line 925
    return-void

    .line 928
    :cond_6
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setNativeStackEntryPending(Z)V

    .line 929
    sget-object p1, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_7

    .line 930
    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    .line 931
    sget-object p1, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->clear()V

    .line 933
    :cond_7
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->postInvalidateOnAnimation()V

    .line 934
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "cached entry staging committed at center="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " page="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "LsNativeStack"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 936
    return-void

    .line 913
    :cond_8
    :goto_2
    return-void

    .line 899
    :cond_9
    :goto_3
    return-void
.end method

.method private static finishEntryForInteraction(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 815
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->finishEntryForInteraction(Lcom/android/quickstep/views/RecentsView;Z)V

    .line 816
    return-void
.end method

.method private static finishEntryForInteraction(Lcom/android/quickstep/views/RecentsView;Z)V
    .locals 2

    .line 820
    if-eqz p0, :cond_6

    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTransitionActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 823
    :cond_0
    nop

    .line 824
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTaskOrderActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 825
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->resolveEntryAnchorPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result v0

    goto :goto_0

    .line 826
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v0

    if-lez v0, :cond_2

    .line 827
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPage()I

    move-result v0

    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->resolveInitialPage(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v0

    goto :goto_0

    .line 826
    :cond_2
    const/4 v0, -0x1

    .line 829
    :goto_0
    if-ltz v0, :cond_3

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 830
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->setEntryPageAligned(Lcom/android/quickstep/views/RecentsView;I)V

    .line 832
    :cond_3
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setNativeStackEntryPending(Z)V

    .line 833
    sput-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    .line 834
    sget-object v1, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_4

    .line 835
    sput-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    .line 836
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 838
    :cond_4
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->clearEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;)V

    .line 839
    if-eqz p1, :cond_5

    .line 840
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    .line 842
    :cond_5
    return-void

    .line 821
    :cond_6
    :goto_1
    return-void
.end method

.method private static finishEntryReveal(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 1262
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 1263
    return-void

    .line 1265
    :cond_0
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealAnimator:Landroid/animation/ValueAnimator;

    .line 1266
    const/4 v0, 0x0

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealAnimator:Landroid/animation/ValueAnimator;

    .line 1267
    const/high16 v0, 0x3f800000    # 1.0f

    sput v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealProgress:F

    .line 1268
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 1269
    if-eqz p0, :cond_1

    .line 1270
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1272
    :cond_1
    return-void
.end method

.method private static getActionsVisibleFactor(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;FFFFI)F
    .locals 18

    .line 2145
    nop

    .line 2146
    nop

    .line 2147
    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/views/TaskView;->getMMiniWindowButton()Landroid/widget/ImageView;

    move-result-object v2

    .line 2148
    const/4 v8, 0x1

    const/high16 v9, 0x3f800000    # 1.0f

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 2149
    nop

    .line 2150
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    invoke-static/range {v0 .. v7}, Lcom/android/quickstep/views/LsNativeStack;->getFullyVisibleFactor(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Landroid/view/View;FFFFI)F

    move-result v0

    invoke-static {v9, v0}, Ljava/lang/Math;->min(FF)F

    move-result v9

    move v0, v8

    goto :goto_0

    .line 2154
    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/views/TaskView;->getMSplitScreenButton()Landroid/widget/ImageView;

    move-result-object v12

    .line 2155
    if-eqz v12, :cond_1

    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1

    .line 2156
    nop

    .line 2157
    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move/from16 v13, p2

    move/from16 v14, p3

    move/from16 v15, p4

    move/from16 v16, p5

    move/from16 v17, p6

    invoke-static/range {v10 .. v17}, Lcom/android/quickstep/views/LsNativeStack;->getFullyVisibleFactor(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Landroid/view/View;FFFFI)F

    move-result v0

    invoke-static {v9, v0}, Ljava/lang/Math;->min(FF)F

    move-result v9

    move v0, v8

    .line 2161
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/views/TaskView;->getMMenuButton()Landroid/widget/ImageView;

    move-result-object v12

    .line 2162
    if-eqz v12, :cond_2

    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2

    .line 2163
    nop

    .line 2164
    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move/from16 v13, p2

    move/from16 v14, p3

    move/from16 v15, p4

    move/from16 v16, p5

    move/from16 v17, p6

    invoke-static/range {v10 .. v17}, Lcom/android/quickstep/views/LsNativeStack;->getFullyVisibleFactor(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Landroid/view/View;FFFFI)F

    move-result v0

    invoke-static {v9, v0}, Ljava/lang/Math;->min(FF)F

    move-result v9

    goto :goto_1

    .line 2168
    :cond_2
    move v8, v0

    :goto_1
    if-eqz v8, :cond_3

    goto :goto_2

    :cond_3
    const/4 v9, 0x0

    :goto_2
    return v9
.end method

.method private static getCenterForDepth(Lcom/android/quickstep/views/RecentsView;F)F
    .locals 1

    .line 1701
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v0

    .line 1702
    invoke-interface {v0, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimarySize(Landroid/view/View;)I

    move-result p0

    int-to-float p0, p0

    .line 1703
    const/high16 v0, 0x3e000000    # 0.125f

    mul-float/2addr p1, v0

    const v0, -0x41c7c102

    sub-float/2addr v0, p1

    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiCenter(FF)F

    move-result p0

    return p0
.end method

.method private static getClearAllActionHost(Landroid/view/View;)Landroid/view/View;
    .locals 2

    .line 2379
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    .line 2380
    instance-of v0, p0, Landroid/view/View;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 2381
    :cond_0
    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    .line 2382
    instance-of v0, p0, Landroid/view/View;

    if-eqz v0, :cond_1

    move-object v1, p0

    check-cast v1, Landroid/view/View;

    :cond_1
    return-object v1
.end method

.method public static getDismissReflowScale(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)F
    .locals 2

    .line 1544
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz v0, :cond_3

    if-nez p1, :cond_0

    goto :goto_1

    .line 1548
    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->getRelativeDepth(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)F

    move-result p0

    .line 1549
    const/4 p1, 0x0

    cmpg-float v0, p0, p1

    if-gtz v0, :cond_1

    .line 1550
    return v1

    .line 1552
    :cond_1
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->getScaleForDepth(F)F

    move-result v0

    .line 1553
    sub-float/2addr p0, v1

    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->getScaleForDepth(F)F

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1554
    cmpl-float p1, v0, p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    div-float v1, p0, v0

    :goto_0
    return v1

    .line 1555
    :catchall_0
    move-exception p0

    .line 1556
    return v1

    .line 1545
    :cond_3
    :goto_1
    return v1
.end method

.method public static getDismissReflowTitleAlpha(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)F
    .locals 2

    .line 1563
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 1567
    :cond_0
    nop

    .line 1568
    :try_start_0
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->getRelativeDepth(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)F

    move-result p0

    sub-float/2addr p0, v1

    .line 1567
    const/4 p1, 0x0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    .line 1569
    const/high16 p1, 0x3e000000    # 0.125f

    mul-float/2addr p0, p1

    const p1, -0x41c7c102

    sub-float/2addr p1, p0

    invoke-static {p1}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiTitleAlpha(F)F

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 1571
    :catchall_0
    move-exception p0

    .line 1572
    return v1

    .line 1564
    :cond_1
    :goto_0
    return v1
.end method

.method private static getEntryPagePosition(Lcom/android/quickstep/views/RecentsView;I)F
    .locals 0

    .line 296
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->getInitialTaskOrdinal(Lcom/android/quickstep/views/RecentsView;I)I

    move-result p0

    .line 297
    sget-boolean p1, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    int-to-float p0, p0

    if-eqz p1, :cond_0

    sget p1, Lcom/android/quickstep/views/LsNativeStack;->liveEntryPageProgress:F

    mul-float/2addr p0, p1

    :cond_0
    return p0
.end method

.method private static getEntryTaskForOrdinal(Lcom/android/quickstep/views/RecentsView;I)Lcom/android/quickstep/views/TaskView;
    .locals 4

    .line 764
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTaskOrderActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    if-ltz p1, :cond_5

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderSize:I

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 768
    :cond_0
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderViews:[Lcom/android/quickstep/views/TaskView;

    aget-object v0, v0, p1

    .line 769
    sget-object v2, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderIds:[I

    aget v2, v2, p1

    .line 770
    if-eqz v0, :cond_2

    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result v3

    if-ltz v3, :cond_2

    if-ltz v2, :cond_1

    .line 771
    invoke-virtual {v0, v2}, Lcom/android/quickstep/views/TaskView;->containsTaskId(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 772
    :cond_1
    return-object v0

    .line 774
    :cond_2
    if-ltz v2, :cond_3

    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->getTaskViewByTaskId(I)Lcom/android/quickstep/views/TaskView;

    move-result-object v1

    .line 775
    :cond_3
    if-eqz v1, :cond_4

    .line 776
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderViews:[Lcom/android/quickstep/views/TaskView;

    aput-object v1, p0, p1

    .line 778
    :cond_4
    return-object v1

    .line 766
    :cond_5
    :goto_0
    return-object v1
.end method

.method private static getFullyVisibleFactor(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Landroid/view/View;FFFFI)F
    .locals 3

    .line 2180
    const/4 p4, 0x0

    if-eqz p2, :cond_7

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_7

    .line 2181
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_7

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_3

    .line 2184
    :cond_0
    instance-of v0, p2, Landroid/widget/TextView;

    if-eqz v0, :cond_4

    .line 2185
    move-object v0, p2

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v0

    .line 2186
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    .line 2189
    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 2190
    invoke-virtual {v0, v1}, Landroid/text/Layout;->getEllipsisCount(I)I

    move-result v2

    if-lez v2, :cond_2

    .line 2191
    return p4

    .line 2189
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2187
    :cond_3
    :goto_1
    return p4

    .line 2195
    :cond_4
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->TEMP_DESCENDANT_BOUNDS:Landroid/graphics/Rect;

    .line 2196
    invoke-virtual {p2, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 2197
    invoke-virtual {p1, p2, v0}, Lcom/android/quickstep/views/TaskView;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 2199
    iget p1, v0, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    mul-float/2addr p1, p5

    add-float/2addr p1, p3

    .line 2200
    iget p2, v0, Landroid/graphics/Rect;->right:I

    int-to-float p2, p2

    mul-float/2addr p2, p5

    add-float/2addr p3, p2

    .line 2201
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 2202
    const/high16 p2, 0x40800000    # 4.0f

    mul-float/2addr p2, p0

    .line 2203
    nop

    .line 2204
    int-to-float p5, p7

    sub-float/2addr p5, p2

    sub-float/2addr p6, p2

    invoke-static {p5, p6}, Ljava/lang/Math;->min(FF)F

    move-result p5

    .line 2206
    cmpg-float p6, p1, p2

    if-ltz p6, :cond_6

    cmpl-float p6, p3, p5

    if-lez p6, :cond_5

    goto :goto_2

    .line 2211
    :cond_5
    sub-float/2addr p1, p2

    sub-float/2addr p5, p3

    invoke-static {p1, p5}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 2212
    const/high16 p2, 0x40c00000    # 6.0f

    mul-float/2addr p0, p2

    .line 2213
    const/high16 p2, 0x3f800000    # 1.0f

    add-float/2addr p1, p2

    div-float/2addr p1, p0

    invoke-static {p1}, Lcom/android/quickstep/views/LsNativeStack;->clamp(F)F

    move-result p0

    return p0

    .line 2207
    :cond_6
    :goto_2
    return p4

    .line 2182
    :cond_7
    :goto_3
    return p4
.end method

.method private static getInitialTaskOrdinal(Lcom/android/quickstep/views/RecentsView;I)I
    .locals 1

    .line 1230
    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->entryFromApp:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    const/4 p0, 0x1

    if-le p1, p0, :cond_0

    .line 1231
    return p0

    .line 1233
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static getLiveCarouselScale(Landroid/content/Context;F)F
    .locals 0

    .line 252
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->usesNativeStackStyle(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/high16 p1, 0x3f800000    # 1.0f

    :cond_0
    return p1
.end method

.method public static getLiveRecentsScale(Landroid/content/Context;F)F
    .locals 1

    .line 237
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->usesNativeStackStyle(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 238
    return p1

    .line 240
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->loadConfig(Landroid/content/res/Resources;)V

    .line 241
    sget p0, Lcom/android/quickstep/views/LsNativeStack;->focusScale:F

    mul-float/2addr p1, p0

    return p1
.end method

.method private static getMiuiAlpha(F)F
    .locals 2

    .line 1755
    const v0, 0x3ecccccd    # 0.4f

    const/high16 v1, 0x40800000    # 4.0f

    invoke-static {p0, v0, v1}, Lcom/android/quickstep/views/LsNativeStack;->valueAlongDepth(FFF)F

    move-result p0

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p0

    .line 1757
    const p0, 0x3c23d70a    # 0.01f

    cmpg-float p0, v0, p0

    if-gez p0, :cond_0

    const/4 v0, 0x0

    :cond_0
    return v0
.end method

.method private static getMiuiCenter(FF)F
    .locals 3

    .line 1742
    invoke-static {p1}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiScaleTerm(F)F

    move-result v0

    .line 1743
    mul-float/2addr v0, p0

    const/high16 v1, 0x41000000    # 8.0f

    mul-float/2addr p1, v1

    float-to-double v1, p1

    .line 1745
    invoke-static {v1, v2}, Ljava/lang/Math;->exp(D)D

    move-result-wide v1

    double-to-float p1, v1

    const v1, -0x424db109

    add-float/2addr p1, v1

    const v1, 0x3e19999a    # 0.15f

    sub-float/2addr p1, v1

    mul-float/2addr v0, p1

    .line 1747
    const/high16 p1, 0x3f000000    # 0.5f

    mul-float/2addr p0, p1

    add-float/2addr p0, v0

    return p0
.end method

.method private static getMiuiDepth(FFI)F
    .locals 0

    .line 1727
    nop

    .line 1728
    invoke-static {p1, p2}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiInteriorCorrection(FI)F

    move-result p2

    add-float/2addr p1, p2

    .line 1729
    const/high16 p2, 0x3e000000    # 0.125f

    sub-float/2addr p0, p1

    mul-float/2addr p0, p2

    const p1, -0x41c7c102

    sub-float/2addr p1, p0

    return p1
.end method

.method private static getMiuiInteriorCorrection(FI)F
    .locals 1

    .line 1713
    const/4 v0, 0x1

    if-gt p1, v0, :cond_0

    .line 1714
    const/4 p0, 0x0

    return p0

    .line 1722
    :cond_0
    const p1, 0x3e19999a    # 0.15f

    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->clamp(F)F

    move-result p0

    mul-float/2addr p0, p1

    return p0
.end method

.method private static getMiuiScaleRatio(F)F
    .locals 1

    .line 1738
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiScaleTerm(F)F

    move-result p0

    const v0, -0x41c7c102

    invoke-static {v0}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiScaleTerm(F)F

    move-result v0

    div-float/2addr p0, v0

    return p0
.end method

.method private static getMiuiScaleTerm(F)F
    .locals 1

    .line 1734
    const v0, 0x3e4ccccd    # 0.2f

    mul-float/2addr p0, v0

    const/high16 v0, 0x3f800000    # 1.0f

    add-float/2addr p0, v0

    return p0
.end method

.method private static getMiuiTitleAlpha(F)F
    .locals 2

    .line 1761
    const v0, 0x3e4ccccd    # 0.2f

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {p0, v0, v1}, Lcom/android/quickstep/views/LsNativeStack;->valueAlongDepth(FFF)F

    move-result p0

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p0

    return v0
.end method

.method private static getPreferredEntryTask(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/TaskView;
    .locals 2

    .line 655
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 656
    return-object v0

    .line 658
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isRecentsAnimationRunning()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 659
    sget-object v1, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_1

    const/4 v1, 0x1

    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->entryFromApp:Z

    .line 660
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskIndex()I

    move-result v1

    .line 661
    if-ltz v1, :cond_2

    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewAt(I)Lcom/android/quickstep/views/TaskView;

    move-result-object v0

    :cond_2
    return-object v0

    .line 663
    :cond_3
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->getTaskForOrdinal(Lcom/android/quickstep/views/RecentsView;I)Lcom/android/quickstep/views/TaskView;

    move-result-object p0

    return-object p0
.end method

.method private static getPrimaryTaskId(Lcom/android/quickstep/views/TaskView;)I
    .locals 2

    .line 636
    const/4 v0, -0x1

    if-nez p0, :cond_0

    .line 637
    return v0

    .line 640
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    move-result-object p0

    .line 641
    if-eqz p0, :cond_1

    array-length v1, p0

    if-lez v1, :cond_1

    const/4 v1, 0x0

    aget v0, p0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    return v0

    .line 642
    :catchall_0
    move-exception p0

    .line 643
    return v0
.end method

.method private static getRelativeDepth(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)F
    .locals 2

    .line 1577
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0}, Lcom/android/quickstep/views/LsNativeStack;->loadConfig(Landroid/content/res/Resources;)V

    .line 1578
    nop

    .line 1579
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result p1

    .line 1578
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I

    move-result p1

    .line 1580
    const/4 v0, 0x0

    if-gez p1, :cond_0

    .line 1581
    return v0

    .line 1583
    :cond_0
    nop

    .line 1584
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->getVisualFocusPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result v1

    .line 1583
    invoke-static {p0, v1}, Lcom/android/quickstep/views/LsNativeStack;->getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v1

    .line 1585
    if-gez v1, :cond_1

    .line 1586
    nop

    .line 1587
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v1

    invoke-interface {v1, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    move-result v1

    int-to-float v1, v1

    .line 1586
    invoke-static {p0, v1}, Lcom/android/quickstep/views/LsNativeStack;->findNearestTaskPage(Lcom/android/quickstep/views/RecentsView;F)I

    move-result v1

    .line 1588
    invoke-static {p0, v1}, Lcom/android/quickstep/views/LsNativeStack;->getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v1

    .line 1590
    :cond_1
    const/4 p0, 0x0

    invoke-static {p0, v1}, Ljava/lang/Math;->max(II)I

    move-result p0

    sub-int/2addr p1, p0

    int-to-float p0, p1

    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method

.method private static getScaleForDepth(F)F
    .locals 1

    .line 1708
    const/high16 v0, 0x3e000000    # 0.125f

    mul-float/2addr p0, v0

    const v0, -0x41c7c102

    sub-float/2addr v0, p0

    .line 1709
    sget p0, Lcom/android/quickstep/views/LsNativeStack;->focusScale:F

    invoke-static {v0}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiScaleRatio(F)F

    move-result v0

    mul-float/2addr p0, v0

    return p0
.end method

.method private static getTaskForOrdinal(Lcom/android/quickstep/views/RecentsView;I)Lcom/android/quickstep/views/TaskView;
    .locals 5

    .line 1609
    const/4 v0, 0x0

    if-gez p1, :cond_0

    .line 1610
    return-object v0

    .line 1612
    :cond_0
    nop

    .line 1613
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_3

    .line 1614
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1615
    instance-of v4, v3, Lcom/android/quickstep/views/TaskView;

    if-nez v4, :cond_1

    .line 1616
    goto :goto_1

    .line 1618
    :cond_1
    if-ne v2, p1, :cond_2

    .line 1619
    check-cast v3, Lcom/android/quickstep/views/TaskView;

    return-object v3

    .line 1621
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 1613
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1623
    :cond_3
    return-object v0
.end method

.method private static getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I
    .locals 3

    .line 1595
    nop

    .line 1596
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 1597
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Lcom/android/quickstep/views/TaskView;

    if-nez v2, :cond_0

    .line 1598
    goto :goto_1

    .line 1600
    :cond_0
    if-ne v0, p1, :cond_1

    .line 1601
    return v1

    .line 1603
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 1596
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1605
    :cond_2
    const/4 p0, -0x1

    return p0
.end method

.method private static getTaskPagePositionForScroll(Lcom/android/quickstep/views/RecentsView;FI)F
    .locals 12

    .line 1659
    invoke-static {p0, p2}, Lcom/android/quickstep/views/LsNativeStack;->getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I

    move-result p2

    .line 1660
    nop

    .line 1661
    nop

    .line 1662
    nop

    .line 1663
    nop

    .line 1664
    const/4 v0, 0x0

    if-ltz p2, :cond_0

    int-to-float v1, p2

    goto :goto_0

    :cond_0
    move v1, v0

    .line 1665
    :goto_0
    nop

    .line 1667
    const/4 v2, 0x0

    const/high16 v3, 0x7f800000    # Float.POSITIVE_INFINITY

    move v7, v0

    move v4, v2

    move v5, v4

    move v6, v3

    move v3, v5

    :goto_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v8

    const/high16 v9, 0x3f800000    # 1.0f

    if-ge v2, v8, :cond_5

    .line 1668
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    instance-of v8, v8, Lcom/android/quickstep/views/TaskView;

    if-nez v8, :cond_1

    .line 1669
    goto :goto_3

    .line 1671
    :cond_1
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->getScrollForPage(I)I

    move-result v8

    int-to-float v8, v8

    .line 1672
    sub-float v10, p1, v8

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    .line 1673
    cmpg-float v11, v10, v6

    if-gez v11, :cond_2

    .line 1674
    nop

    .line 1675
    int-to-float v1, v4

    move v6, v10

    .line 1677
    :cond_2
    const/4 v10, 0x1

    if-eqz v5, :cond_4

    .line 1678
    sub-float v5, v8, v7

    .line 1679
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v11

    cmpl-float v11, v11, v9

    if-ltz v11, :cond_4

    .line 1680
    nop

    .line 1681
    sub-float v3, p1, v7

    div-float/2addr v3, v5

    invoke-static {v3}, Lcom/android/quickstep/views/LsNativeStack;->clamp(F)F

    move-result v3

    .line 1682
    mul-float/2addr v5, v3

    add-float/2addr v7, v5

    .line 1683
    sub-float v5, p1, v7

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    .line 1684
    cmpg-float v7, v5, v6

    if-gtz v7, :cond_3

    .line 1685
    nop

    .line 1686
    int-to-float v1, v4

    sub-float/2addr v1, v9

    add-float/2addr v1, v3

    move v6, v5

    move v3, v10

    goto :goto_2

    .line 1684
    :cond_3
    move v3, v10

    .line 1690
    :cond_4
    :goto_2
    nop

    .line 1691
    nop

    .line 1692
    add-int/lit8 v4, v4, 0x1

    move v7, v8

    move v5, v10

    .line 1667
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1694
    :cond_5
    if-nez v3, :cond_6

    if-ltz p2, :cond_6

    .line 1695
    int-to-float p0, p2

    return p0

    .line 1697
    :cond_6
    int-to-float p0, v4

    sub-float/2addr p0, v9

    invoke-static {p0, v1}, Ljava/lang/Math;->min(FF)F

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method

.method private static getVisualFocusPage(Lcom/android/quickstep/views/RecentsView;)I
    .locals 2

    .line 1627
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_1

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissOrdinal:I

    if-ltz v0, :cond_1

    .line 1628
    sget v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissOrdinal:I

    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->getTaskForOrdinal(Lcom/android/quickstep/views/RecentsView;I)Lcom/android/quickstep/views/TaskView;

    move-result-object v0

    .line 1629
    if-nez v0, :cond_0

    .line 1630
    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 1631
    :goto_0
    if-ltz v0, :cond_1

    .line 1632
    return v0

    .line 1635
    :cond_1
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_2

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    if-ltz v0, :cond_2

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    .line 1637
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    .line 1638
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Lcom/android/quickstep/views/TaskView;

    if-eqz v0, :cond_2

    .line 1639
    sget p0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    return p0

    .line 1641
    :cond_2
    nop

    .line 1642
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    move-result v0

    int-to-float v0, v0

    .line 1641
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->findNearestTaskPage(Lcom/android/quickstep/views/RecentsView;F)I

    move-result v0

    .line 1643
    if-ltz v0, :cond_3

    .line 1644
    return v0

    .line 1646
    :cond_3
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getNextPage()I

    move-result v0

    .line 1647
    if-ltz v0, :cond_4

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 1648
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Lcom/android/quickstep/views/TaskView;

    if-eqz v1, :cond_4

    .line 1649
    return v0

    .line 1651
    :cond_4
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPage()I

    move-result p0

    return p0
.end method

.method private static isDismissReflowActive(Lcom/android/quickstep/views/RecentsView;)Z
    .locals 5

    .line 952
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 953
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 954
    instance-of v3, v2, Lcom/android/quickstep/views/TaskView;

    if-nez v3, :cond_0

    .line 955
    goto :goto_1

    .line 957
    :cond_0
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 958
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getNativeDismissTranslationX()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v3, v3, v4

    if-gtz v3, :cond_2

    .line 959
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getNativeDismissTranslationY()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v2, v2, v4

    if-lez v2, :cond_1

    goto :goto_2

    .line 952
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 960
    :cond_2
    :goto_2
    const/4 p0, 0x1

    return p0

    .line 963
    :cond_3
    return v0
.end method

.method private static isDismissTransitionActive(Lcom/android/quickstep/views/RecentsView;)Z
    .locals 1

    .line 967
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_1

    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isDismissReflowActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static isEntryGeometryReady(Lcom/android/quickstep/views/RecentsView;I)Z
    .locals 6

    .line 858
    const/4 v0, 0x0

    if-ltz p1, :cond_8

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v1

    if-lt p1, v1, :cond_0

    goto :goto_3

    .line 861
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    .line 862
    instance-of v1, p1, Lcom/android/quickstep/views/TaskView;

    if-eqz v1, :cond_7

    .line 863
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    if-lez v1, :cond_7

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    if-gtz p1, :cond_1

    goto :goto_2

    .line 866
    :cond_1
    nop

    .line 867
    nop

    .line 868
    nop

    .line 869
    move p1, v0

    move v1, p1

    move v2, v1

    move v3, v2

    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v4

    const/4 v5, 0x1

    if-ge p1, v4, :cond_5

    .line 870
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v4, v4, Lcom/android/quickstep/views/TaskView;

    if-nez v4, :cond_2

    .line 871
    goto :goto_1

    .line 873
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 874
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->getScrollForPage(I)I

    move-result v4

    .line 875
    if-nez v2, :cond_3

    .line 876
    nop

    .line 877
    move v3, v4

    move v2, v5

    goto :goto_1

    .line 878
    :cond_3
    sub-int/2addr v4, v3

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-lt v4, v5, :cond_4

    .line 879
    return v5

    .line 869
    :cond_4
    :goto_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 882
    :cond_5
    if-ne v1, v5, :cond_6

    move v0, v5

    :cond_6
    return v0

    .line 864
    :cond_7
    :goto_2
    return v0

    .line 859
    :cond_8
    :goto_3
    return v0
.end method

.method private static isEntryTaskOrderActive(Lcom/android/quickstep/views/RecentsView;)Z
    .locals 1

    .line 724
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryOrderRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    sget p0, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderSize:I

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isEntryTransitionActive(Lcom/android/quickstep/views/RecentsView;)Z
    .locals 1

    .line 802
    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_2

    :cond_0
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorRecents:Ljava/lang/ref/WeakReference;

    .line 803
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_2

    .line 804
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTaskOrderActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 805
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackEntryPending()Z

    move-result v0

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    .line 806
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 802
    :goto_1
    return p0
.end method

.method private static isMemoryInfoEnabled(Landroid/content/Context;)Z
    .locals 6

    .line 211
    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 212
    return v0

    .line 215
    :cond_0
    :try_start_0
    const-string v1, "com.android.launcher3.J3"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 216
    const-string v2, "m"

    new-array v3, v0, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 218
    new-array v2, v0, [Ljava/lang/Object;

    aput-object p0, v2, v5

    const/4 p0, 0x0

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 219
    instance-of v1, p0, Landroid/content/SharedPreferences;

    if-nez v1, :cond_1

    .line 220
    return v0

    .line 222
    :cond_1
    check-cast p0, Landroid/content/SharedPreferences;

    const-string v1, "ls_recents_stack_show_memory"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 223
    :catchall_0
    move-exception p0

    .line 224
    return v0
.end method

.method private static isPendingDismissReflowTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z
    .locals 2

    .line 990
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-ne v0, p0, :cond_2

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissOrdinal:I

    if-ltz v0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    .line 994
    :cond_0
    nop

    .line 995
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result p1

    .line 994
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I

    move-result p0

    .line 996
    sget p1, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissOrdinal:I

    if-le p0, p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    .line 992
    :cond_2
    :goto_0
    return v1
.end method

.method private static isPendingDismissTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z
    .locals 1

    .line 983
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissTask:Ljava/lang/ref/WeakReference;

    .line 984
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 983
    :goto_0
    return p0
.end method

.method private static isTouchableTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/quickstep/views/TaskView;Landroid/view/MotionEvent;Z)Z
    .locals 2

    .line 1331
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->getAlpha()F

    move-result v0

    const v1, 0x3c23d70a    # 0.01f

    cmpg-float v0, v0, v1

    if-lez v0, :cond_3

    .line 1332
    invoke-virtual {p0, p2}, Lcom/android/quickstep/views/RecentsView;->isTaskViewVisible(Lcom/android/quickstep/views/TaskView;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_1

    .line 1335
    :cond_0
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->TEMP_HIT_BOUNDS:Landroid/graphics/Rect;

    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    move-result p0

    .line 1336
    if-eqz p4, :cond_1

    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->getClipBounds()Landroid/graphics/Rect;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 1337
    :goto_0
    if-eqz p1, :cond_2

    .line 1338
    sget-object p2, Lcom/android/quickstep/views/LsNativeStack;->TEMP_HIT_BOUNDS:Landroid/graphics/Rect;

    iget p2, p2, Landroid/graphics/Rect;->left:I

    iget p4, p1, Landroid/graphics/Rect;->left:I

    int-to-float p4, p4

    mul-float/2addr p4, p0

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p4

    add-int/2addr p2, p4

    .line 1339
    sget-object p4, Lcom/android/quickstep/views/LsNativeStack;->TEMP_HIT_BOUNDS:Landroid/graphics/Rect;

    iget p4, p4, Landroid/graphics/Rect;->top:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    mul-float/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/2addr p4, v0

    .line 1340
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->TEMP_HIT_BOUNDS:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    mul-float/2addr v1, p0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    add-int/2addr v0, v1

    .line 1341
    sget-object v1, Lcom/android/quickstep/views/LsNativeStack;->TEMP_HIT_BOUNDS:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float p1, p1

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    add-int/2addr v1, p0

    .line 1342
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->TEMP_HIT_BOUNDS:Landroid/graphics/Rect;

    invoke-virtual {p0, p2, p4, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 1345
    :cond_2
    sget-object p0, Lcom/android/quickstep/views/LsNativeStack;->TEMP_HIT_BOUNDS:Landroid/graphics/Rect;

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result p0

    return p0

    .line 1333
    :cond_3
    :goto_1
    const/4 p0, 0x0

    return p0
.end method

.method private static loadConfig(Landroid/content/res/Resources;)V
    .locals 4

    .line 2119
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 2120
    sget v1, Lcom/android/quickstep/views/LsNativeStack;->cachedDensityDpi:I

    if-ne v1, v0, :cond_0

    .line 2121
    return-void

    .line 2123
    :cond_0
    const v1, 0x7f0c0109

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float/2addr v1, v2

    sput v1, Lcom/android/quickstep/views/LsNativeStack;->focusCenterFraction:F

    .line 2124
    const v1, 0x7f0c010a

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    sput v1, Lcom/android/quickstep/views/LsNativeStack;->firstBackCenterFraction:F

    .line 2125
    const v1, 0x7f0c010b

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    sput v1, Lcom/android/quickstep/views/LsNativeStack;->tailGapFraction:F

    .line 2126
    const v1, 0x7f0c010c

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    sput v1, Lcom/android/quickstep/views/LsNativeStack;->tailDecay:F

    .line 2127
    const v1, 0x7f0c0104

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    sput v1, Lcom/android/quickstep/views/LsNativeStack;->focusScale:F

    .line 2128
    const v1, 0x7f0c0105

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    sput v1, Lcom/android/quickstep/views/LsNativeStack;->scaleStep:F

    .line 2129
    const v1, 0x7f0c0106

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    const/4 v3, 0x1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    sput v1, Lcom/android/quickstep/views/LsNativeStack;->maxDepth:I

    .line 2130
    const v1, 0x7f0c010d

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    sput v1, Lcom/android/quickstep/views/LsNativeStack;->incomingDistanceFraction:F

    .line 2131
    const v1, 0x7f0c010e

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    sput v1, Lcom/android/quickstep/views/LsNativeStack;->incomingScaleGain:F

    .line 2132
    const v1, 0x7f0c010f

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    sput v1, Lcom/android/quickstep/views/LsNativeStack;->minBackScale:F

    .line 2133
    const v1, 0x7f0c0110

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p0

    int-to-float p0, p0

    div-float/2addr p0, v2

    sput p0, Lcom/android/quickstep/views/LsNativeStack;->nativeCenterCorrectionFraction:F

    .line 2135
    sput v0, Lcom/android/quickstep/views/LsNativeStack;->cachedDensityDpi:I

    .line 2136
    return-void
.end method

.method private static markDrawUpdate(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 593
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->drawUpdateRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 594
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->drawUpdateRecents:Ljava/lang/ref/WeakReference;

    .line 596
    :cond_0
    const/4 p0, 0x1

    sput-boolean p0, Lcom/android/quickstep/views/LsNativeStack;->drawUpdatePending:Z

    .line 597
    return-void
.end method

.method public static normalizeLiveAppliedScale(Landroid/content/Context;F)F
    .locals 2

    .line 309
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 310
    sget-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    if-nez v1, :cond_1

    sget-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    .line 311
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 312
    :goto_1
    if-eqz v0, :cond_4

    if-eqz p0, :cond_4

    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    if-nez v0, :cond_2

    .line 313
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->usesNativeStackStyle(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_2

    .line 317
    :cond_2
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->loadConfig(Landroid/content/res/Resources;)V

    .line 318
    sget p0, Lcom/android/quickstep/views/LsNativeStack;->focusScale:F

    .line 319
    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->liveEntryStartScale:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_3

    .line 320
    sget p0, Lcom/android/quickstep/views/LsNativeStack;->focusScale:F

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->liveEntryStartScale:F

    invoke-static {p0, v0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    .line 321
    sget v0, Lcom/android/quickstep/views/LsNativeStack;->focusScale:F

    sub-float/2addr v0, p0

    sget v1, Lcom/android/quickstep/views/LsNativeStack;->liveEntryPageProgress:F

    mul-float/2addr v0, v1

    add-float/2addr p0, v0

    .line 323
    :cond_3
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0

    .line 314
    :cond_4
    :goto_2
    sput p1, Lcom/android/quickstep/views/LsNativeStack;->lastLiveAppliedScale:F

    .line 315
    return p1
.end method

.method public static normalizeLiveEntryMatrix(Landroid/content/Context;Landroid/graphics/Matrix;Landroid/graphics/Rect;)V
    .locals 4

    .line 359
    if-eqz p0, :cond_8

    if-eqz p1, :cond_8

    if-eqz p2, :cond_8

    invoke-virtual {p2}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 362
    :cond_0
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 363
    sget-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    const/4 v2, 0x1

    if-nez v1, :cond_2

    sget-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    if-eqz v1, :cond_1

    sget-object v1, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    .line 364
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_1

    if-eqz v0, :cond_1

    .line 365
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 366
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isRecentsAnimationRunning()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    move v1, v2

    .line 367
    :goto_1
    if-nez v1, :cond_3

    .line 368
    return-void

    .line 370
    :cond_3
    sget-object v1, Lcom/android/quickstep/views/LsNativeStack;->TEMP_LIVE_SURFACE_BOUNDS:Landroid/graphics/RectF;

    invoke-virtual {v1, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 371
    sget-object p2, Lcom/android/quickstep/views/LsNativeStack;->TEMP_LIVE_SURFACE_BOUNDS:Landroid/graphics/RectF;

    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    move-result p2

    if-eqz p2, :cond_7

    sget-object p2, Lcom/android/quickstep/views/LsNativeStack;->TEMP_LIVE_SURFACE_BOUNDS:Landroid/graphics/RectF;

    .line 372
    invoke-virtual {p2}, Landroid/graphics/RectF;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_4

    goto :goto_2

    .line 375
    :cond_4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p2, p2

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr p2, v1

    .line 376
    sget-object v1, Lcom/android/quickstep/views/LsNativeStack;->TEMP_LIVE_SURFACE_BOUNDS:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    sub-float/2addr p2, v1

    .line 377
    const/4 v1, 0x0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v3

    invoke-static {v0, v3}, Lcom/android/quickstep/views/LsNativeStack;->getInitialTaskOrdinal(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v3

    if-ne v3, v2, :cond_5

    .line 378
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v2

    invoke-static {v0, v2}, Lcom/android/quickstep/views/LsNativeStack;->getEntryPagePosition(Lcom/android/quickstep/views/RecentsView;I)F

    move-result v2

    .line 379
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v0

    invoke-static {v1, v2, v0}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiDepth(FFI)F

    move-result v0

    .line 380
    invoke-static {v0}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiScaleRatio(F)F

    move-result v1

    .line 381
    sget-object v2, Lcom/android/quickstep/views/LsNativeStack;->TEMP_LIVE_SURFACE_BOUNDS:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    .line 382
    sget-object v3, Lcom/android/quickstep/views/LsNativeStack;->TEMP_LIVE_SURFACE_BOUNDS:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    .line 383
    invoke-virtual {p1, v1, v1, v2, v3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 384
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p0, p0

    .line 385
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiCenter(FF)F

    move-result p0

    sub-float/2addr p0, v2

    invoke-virtual {p1, p0, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 386
    return-void

    .line 388
    :cond_5
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p0

    const v0, 0x3c23d70a    # 0.01f

    cmpl-float p0, p0, v0

    if-lez p0, :cond_6

    .line 389
    invoke-virtual {p1, v1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 391
    :cond_6
    return-void

    .line 373
    :cond_7
    :goto_2
    return-void

    .line 360
    :cond_8
    :goto_3
    return-void
.end method

.method public static normalizeLiveEntryScroll(F)F
    .locals 3

    .line 335
    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 336
    return v1

    .line 338
    :cond_0
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 339
    sget-boolean v2, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    if-eqz v2, :cond_2

    sget-object v2, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v0, :cond_2

    if-eqz v0, :cond_2

    .line 340
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 341
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isRecentsAnimationRunning()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 344
    :cond_1
    return v1

    .line 342
    :cond_2
    :goto_0
    return p0
.end method

.method public static normalizeLiveGridTask(Landroid/content/Context;Z)Z
    .locals 0

    .line 266
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->usesNativeStackStyle(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p1, 0x0

    :cond_0
    return p1
.end method

.method public static normalizeLiveOverviewDuration(Lcom/android/quickstep/views/RecentsView;J)J
    .locals 2

    .line 289
    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    if-eqz v0, :cond_2

    if-nez p0, :cond_0

    goto :goto_0

    .line 290
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->entryFromApp:Z

    .line 291
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    .line 292
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result p0

    if-le p0, v0, :cond_1

    const-wide/16 v0, 0xdc

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    :cond_1
    return-wide p1

    .line 289
    :cond_2
    :goto_0
    return-wide p1
.end method

.method public static obtainPagerEvent(Lcom/android/quickstep/views/RecentsView;Landroid/view/MotionEvent;)Landroid/view/MotionEvent;
    .locals 3

    .line 1005
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_1

    .line 1009
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->clearPendingDismissState(Lcom/android/quickstep/views/RecentsView;)V

    .line 1010
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->finishEntryReveal(Lcom/android/quickstep/views/RecentsView;)V

    .line 1011
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->finishEntryForInteraction(Lcom/android/quickstep/views/RecentsView;)V

    .line 1019
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPage()I

    move-result v0

    .line 1020
    if-ltz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1021
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1022
    :goto_0
    instance-of v0, v0, Lcom/android/quickstep/views/TaskView;

    if-nez v0, :cond_1

    .line 1023
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v0

    .line 1024
    nop

    .line 1025
    invoke-interface {v0, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    move-result v0

    int-to-float v0, v0

    .line 1024
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->findNearestTaskPage(Lcom/android/quickstep/views/RecentsView;F)I

    move-result v0

    .line 1026
    if-ltz v0, :cond_1

    .line 1027
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->setCurrentPageIfChanged(Lcom/android/quickstep/views/RecentsView;I)V

    .line 1028
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "touch anchor normalized to task page="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LsNativeStack"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1029
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    .line 1033
    :cond_1
    return-object p1
.end method

.method public static onDismissAnimationEnd(Lcom/android/quickstep/views/RecentsView;Z)V
    .locals 9

    .line 1427
    const-string v0, "LsNativeStack"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 1428
    sget-object v3, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    const/4 v4, -0x1

    if-ne v3, p0, :cond_0

    .line 1429
    sget v3, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissOrdinal:I

    goto :goto_0

    :cond_0
    move v3, v4

    .line 1431
    :goto_0
    sget-object v5, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    .line 1430
    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    if-ne v5, p0, :cond_1

    sget v5, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissPagePosition:F

    .line 1431
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1432
    sget v5, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissPagePosition:F

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    goto :goto_1

    :cond_1
    move v5, v4

    .line 1433
    :goto_1
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->clearPendingDismissState(Lcom/android/quickstep/views/RecentsView;)V

    .line 1434
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v6

    if-nez v6, :cond_2

    .line 1435
    return-void

    .line 1438
    :cond_2
    :try_start_0
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->finishEntryForInteraction(Lcom/android/quickstep/views/RecentsView;)V

    .line 1446
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v6

    .line 1447
    nop

    .line 1448
    if-lez v6, :cond_4

    if-ltz v5, :cond_4

    .line 1452
    add-int/lit8 v7, v6, -0x1

    invoke-static {v5, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 1453
    invoke-static {p0, v7}, Lcom/android/quickstep/views/LsNativeStack;->getTaskForOrdinal(Lcom/android/quickstep/views/RecentsView;I)Lcom/android/quickstep/views/TaskView;

    move-result-object v7

    .line 1454
    if-nez v7, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {p0, v7}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result v4

    .line 1455
    :goto_2
    if-ltz v4, :cond_4

    .line 1458
    invoke-virtual {p0, v4}, Lcom/android/quickstep/views/RecentsView;->setCurrentPage(I)V

    .line 1464
    :cond_4
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    .line 1465
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "dismiss commit success="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v7, " oldOrdinal="

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, " viewportOrdinal="

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, " tasks="

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, " targetPage="

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, " currentPage="

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 1470
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPage()I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " costMs="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 1471
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-virtual {p0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1465
    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1474
    goto :goto_3

    .line 1472
    :catchall_0
    move-exception p0

    .line 1473
    const-string p1, "post-dismiss stack commit failed"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1475
    :goto_3
    return-void
.end method

.method public static onLiveOverviewFrame(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 282
    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    if-eqz v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 283
    :cond_0
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p0

    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->clamp(F)F

    move-result p0

    sput p0, Lcom/android/quickstep/views/LsNativeStack;->liveEntryPageProgress:F

    .line 284
    return-void

    .line 282
    :cond_1
    :goto_0
    return-void
.end method

.method public static onOverviewStateChanged(Lcom/android/quickstep/views/RecentsView;Z)V
    .locals 3

    .line 1063
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->clearPendingDismissState(Lcom/android/quickstep/views/RecentsView;)V

    .line 1064
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_4

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1065
    sget-boolean p1, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isRecentsAnimationRunning()Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    move v1, v0

    :cond_1
    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->entryFromApp:Z

    .line 1066
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p1, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    .line 1067
    sput-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->overviewActive:Z

    .line 1068
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p1, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    .line 1069
    sput-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    .line 1070
    sget p1, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryGeneration:I

    add-int/2addr p1, v0

    sput p1, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryGeneration:I

    .line 1076
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->finishEntryReveal(Lcom/android/quickstep/views/RecentsView;)V

    .line 1077
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->getPreferredEntryTask(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/TaskView;

    move-result-object p1

    .line 1078
    if-eqz p1, :cond_3

    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->captureEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1079
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->resolveEntryAnchorPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result p1

    .line 1080
    if-ltz p1, :cond_2

    .line 1081
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->setEntryPageAligned(Lcom/android/quickstep/views/RecentsView;I)V

    .line 1083
    :cond_2
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    .line 1085
    :cond_3
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->scheduleInitialFrameCommit(Lcom/android/quickstep/views/RecentsView;)V

    .line 1086
    return-void

    .line 1088
    :cond_4
    if-nez p1, :cond_8

    .line 1089
    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->entryFromApp:Z

    .line 1090
    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    .line 1091
    sget-object p1, Lcom/android/quickstep/views/LsNativeStack;->drawUpdateRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_5

    .line 1092
    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->drawUpdatePending:Z

    .line 1093
    sget-object p1, Lcom/android/quickstep/views/LsNativeStack;->drawUpdateRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->clear()V

    .line 1095
    :cond_5
    sget-object p1, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_6

    .line 1096
    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->overviewActive:Z

    .line 1097
    sget-object p1, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->clear()V

    .line 1099
    :cond_6
    sget p1, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryGeneration:I

    add-int/2addr p1, v0

    sput p1, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryGeneration:I

    .line 1100
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->finishEntryReveal(Lcom/android/quickstep/views/RecentsView;)V

    .line 1101
    sget-object p1, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_7

    .line 1102
    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    .line 1103
    sget-object p1, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->clear()V

    .line 1105
    :cond_7
    sget p1, Lcom/android/quickstep/views/LsNativeStack;->entryStabilizerGeneration:I

    add-int/2addr p1, v0

    sput p1, Lcom/android/quickstep/views/LsNativeStack;->entryStabilizerGeneration:I

    .line 1106
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->clearEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;)V

    .line 1107
    const/4 p1, -0x1

    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->updateDecorations(Lcom/android/quickstep/views/RecentsView;I)V

    .line 1109
    :cond_8
    return-void
.end method

.method public static onRecentsAnimationComplete(Lcom/android/quickstep/views/RecentsView;)V
    .locals 3

    .line 1121
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    if-eqz v0, :cond_8

    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->overviewActive:Z

    if-eqz v0, :cond_8

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    .line 1122
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_0

    goto :goto_3

    .line 1125
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackEntryPending()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    .line 1126
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 1127
    :goto_1
    if-nez v0, :cond_3

    .line 1128
    return-void

    .line 1130
    :cond_3
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTaskOrderActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v0

    if-lez v0, :cond_5

    .line 1131
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->getPreferredEntryTask(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/TaskView;

    move-result-object v0

    .line 1132
    if-eqz v0, :cond_4

    .line 1133
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->captureEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z

    .line 1135
    :cond_4
    goto :goto_2

    .line 1136
    :cond_5
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->ensureEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;)Z

    .line 1138
    :goto_2
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->resolveEntryAnchorPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result v0

    .line 1139
    if-ltz v0, :cond_6

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_6

    .line 1140
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->setEntryPageAligned(Lcom/android/quickstep/views/RecentsView;I)V

    .line 1142
    :cond_6
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setNativeStackEntryPending(Z)V

    .line 1143
    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    .line 1144
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_7

    .line 1145
    sput-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    .line 1146
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 1148
    :cond_7
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    .line 1149
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->scheduleInitialFrameCommit(Lcom/android/quickstep/views/RecentsView;)V

    .line 1150
    return-void

    .line 1123
    :cond_8
    :goto_3
    return-void
.end method

.method public static onScrollChanged(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 850
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 851
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->markDrawUpdate(Lcom/android/quickstep/views/RecentsView;)V

    .line 852
    return-void

    .line 854
    :cond_0
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    .line 855
    return-void
.end method

.method public static onTaskVisualsReset(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 1484
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    .line 1485
    return-void

    .line 1487
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTransitionActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1488
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->markDrawUpdate(Lcom/android/quickstep/views/RecentsView;)V

    .line 1489
    return-void

    .line 1491
    :cond_1
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    .line 1492
    return-void
.end method

.method public static prepareDismissedTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)V
    .locals 1

    .line 1350
    if-nez p1, :cond_0

    .line 1351
    return-void

    .line 1353
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1354
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LsNativeStack;->recordDismissedTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)V

    .line 1355
    invoke-static {p1}, Lcom/android/quickstep/views/LsNativeStack;->cacheGestureLayer(Lcom/android/quickstep/views/TaskView;)V

    .line 1360
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/android/quickstep/views/TaskView;->setNativeStackClipRight(I)V

    .line 1364
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V

    goto :goto_0

    .line 1366
    :cond_1
    const p0, 0x3dcccccd    # 0.1f

    invoke-virtual {p1, p0}, Lcom/android/quickstep/views/TaskView;->setTranslationZ(F)V

    .line 1368
    :goto_0
    return-void
.end method

.method public static recordDismissedTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)V
    .locals 3

    .line 1372
    if-eqz p0, :cond_6

    if-eqz p1, :cond_6

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 1379
    :cond_0
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_1

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissTask:Ljava/lang/ref/WeakReference;

    .line 1380
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_1

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissOrdinal:I

    if-ltz v0, :cond_1

    sget v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissPagePosition:F

    .line 1382
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1383
    return-void

    .line 1388
    :cond_1
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->finishEntryReveal(Lcom/android/quickstep/views/RecentsView;)V

    .line 1391
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->finishEntryForInteraction(Lcom/android/quickstep/views/RecentsView;Z)V

    .line 1392
    nop

    .line 1393
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 1392
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v0

    .line 1394
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v1

    .line 1395
    nop

    .line 1396
    invoke-interface {v1, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    move-result v1

    int-to-float v1, v1

    .line 1395
    invoke-static {p0, v1}, Lcom/android/quickstep/views/LsNativeStack;->findNearestTaskPage(Lcom/android/quickstep/views/RecentsView;F)I

    move-result v1

    .line 1397
    if-gez v1, :cond_3

    .line 1398
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getNextPage()I

    move-result v1

    .line 1400
    if-ltz v1, :cond_2

    .line 1399
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 1400
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Lcom/android/quickstep/views/TaskView;

    if-eqz v2, :cond_2

    .line 1401
    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPage()I

    move-result v1

    .line 1403
    :cond_3
    :goto_0
    invoke-static {p0, v1}, Lcom/android/quickstep/views/LsNativeStack;->getTaskOrdinalForChildIndex(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v1

    .line 1404
    if-gez v1, :cond_4

    .line 1405
    move v1, v0

    .line 1407
    :cond_4
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v2, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    .line 1408
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v2, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissTask:Ljava/lang/ref/WeakReference;

    .line 1409
    sput v0, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissOrdinal:I

    .line 1412
    if-ltz v1, :cond_5

    .line 1413
    int-to-float p1, v1

    goto :goto_1

    :cond_5
    const/high16 p1, 0x7fc00000    # Float.NaN

    :goto_1
    sput p1, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissPagePosition:F

    .line 1414
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dismiss capture cardOrdinal="

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " viewportOrdinal="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " currentPage="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 1416
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPage()I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1414
    const-string p1, "LsNativeStack"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1417
    return-void

    .line 1373
    :cond_6
    :goto_2
    return-void
.end method

.method public static recyclePagerEvent(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V
    .locals 0

    .line 1037
    if-eq p1, p0, :cond_0

    .line 1038
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    .line 1040
    :cond_0
    return-void
.end method

.method private static refreshEntryTaskBindings(Lcom/android/quickstep/views/RecentsView;)Z
    .locals 6

    .line 729
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTaskOrderActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 730
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v0

    sget v2, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderSize:I

    if-eq v0, v2, :cond_0

    goto :goto_3

    .line 733
    :cond_0
    move v0, v1

    :goto_0
    sget v2, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderSize:I

    const/4 v3, 0x1

    if-ge v0, v2, :cond_6

    .line 734
    sget-object v2, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderViews:[Lcom/android/quickstep/views/TaskView;

    aget-object v2, v2, v0

    .line 735
    sget-object v4, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderIds:[I

    aget v4, v4, v0

    .line 736
    if-eqz v2, :cond_2

    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result v5

    if-ltz v5, :cond_2

    if-ltz v4, :cond_1

    .line 737
    invoke-virtual {v2, v4}, Lcom/android/quickstep/views/TaskView;->containsTaskId(I)Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_1
    goto :goto_1

    :cond_2
    move v3, v1

    .line 738
    :goto_1
    if-nez v3, :cond_3

    if-ltz v4, :cond_3

    .line 739
    invoke-virtual {p0, v4}, Lcom/android/quickstep/views/RecentsView;->getTaskViewByTaskId(I)Lcom/android/quickstep/views/TaskView;

    move-result-object v2

    .line 741
    :cond_3
    if-eqz v2, :cond_5

    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result v3

    if-gez v3, :cond_4

    goto :goto_2

    .line 744
    :cond_4
    sget-object v3, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderViews:[Lcom/android/quickstep/views/TaskView;

    aput-object v2, v3, v0

    .line 733
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 742
    :cond_5
    :goto_2
    return v1

    .line 746
    :cond_6
    new-instance v0, Ljava/lang/ref/WeakReference;

    sget-object v2, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderViews:[Lcom/android/quickstep/views/TaskView;

    aget-object v2, v2, v1

    invoke-direct {v0, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorTask:Ljava/lang/ref/WeakReference;

    .line 747
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderViews:[Lcom/android/quickstep/views/TaskView;

    sget v2, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderSize:I

    invoke-static {p0, v2}, Lcom/android/quickstep/views/LsNativeStack;->getInitialTaskOrdinal(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v2

    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result p0

    sput p0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    .line 748
    sget p0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    if-ltz p0, :cond_7

    move v1, v3

    :cond_7
    return v1

    .line 731
    :cond_8
    :goto_3
    return v1
.end method

.method private static refreshMemoryLabels(Lcom/android/quickstep/views/RecentsView;)V
    .locals 9

    .line 2280
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getRootView()Landroid/view/View;

    move-result-object v0

    .line 2281
    const v1, 0x7f0b06c6

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 2282
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/android/quickstep/views/LsNativeStack;->isMemoryInfoEnabled(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2283
    const/16 p0, 0x8

    invoke-static {v1, p0}, Lcom/android/quickstep/views/LsNativeStack;->setVisibilityIfChanged(Landroid/view/View;I)V

    .line 2284
    return-void

    .line 2287
    :cond_0
    const v1, 0x7f0b06c7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 2288
    const v2, 0x7f0b06c9

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 2289
    if-eqz v1, :cond_3

    if-nez v0, :cond_1

    goto :goto_0

    .line 2291
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 2292
    const-string v3, "activity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager;

    .line 2293
    if-nez v2, :cond_2

    return-void

    .line 2294
    :cond_2
    new-instance v3, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v3}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 2295
    invoke-virtual {v2, v3}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 2296
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    sput-wide v4, Lcom/android/quickstep/views/LsNativeStack;->lastMemoryUpdateMs:J

    .line 2297
    nop

    .line 2298
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 2299
    iget-wide v4, v3, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    long-to-double v4, v4

    const-wide/high16 v6, 0x41d0000000000000L    # 1.073741824E9

    div-double/2addr v4, v6

    .line 2300
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v2, v5, v8

    .line 2299
    const v2, 0x7f1404b8

    invoke-virtual {p0, v2, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2301
    iget-wide v1, v3, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    long-to-double v1, v1

    div-double/2addr v1, v6

    .line 2302
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    new-array v2, v4, [Ljava/lang/Object;

    aput-object v1, v2, v8

    .line 2301
    const v1, 0x7f1404b9

    invoke-virtual {p0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2303
    return-void

    .line 2289
    :cond_3
    :goto_0
    return-void
.end method

.method private static resetClearAllGeometry(Landroid/view/View;Landroid/view/View;)V
    .locals 2

    .line 2362
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->translatedClearAllHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 2363
    if-eqz v0, :cond_0

    .line 2364
    sget v1, Lcom/android/quickstep/views/LsNativeStack;->clearAllHostBaseTranslationY:F

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 2366
    :cond_0
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->translatedClearAllHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 2367
    const/4 v0, 0x0

    sput v0, Lcom/android/quickstep/views/LsNativeStack;->clearAllHostBaseTranslationY:F

    .line 2368
    if-eqz p0, :cond_1

    .line 2369
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 2370
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->setClearAllParentClipping(Landroid/view/View;Z)V

    .line 2372
    :cond_1
    if-eqz p1, :cond_2

    .line 2373
    const/high16 p0, 0x3f800000    # 1.0f

    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleX(F)V

    .line 2374
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleY(F)V

    .line 2376
    :cond_2
    return-void
.end method

.method private static resetIfNeeded(Lcom/android/quickstep/views/RecentsView;)V
    .locals 11

    .line 2099
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackApplied()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2100
    return-void

    .line 2102
    :cond_0
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v2

    const/4 v3, -0x1

    if-ge v1, v2, :cond_2

    .line 2103
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2104
    instance-of v4, v2, Lcom/android/quickstep/views/TaskView;

    if-eqz v4, :cond_1

    .line 2105
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 2106
    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    move-object v5, v2

    invoke-virtual/range {v5 .. v10}, Lcom/android/quickstep/views/TaskView;->setNativeStackTransform(FFFFF)V

    .line 2108
    invoke-virtual {v2, v3}, Lcom/android/quickstep/views/TaskView;->setNativeStackClipRight(I)V

    .line 2109
    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3, v3}, Lcom/android/quickstep/views/TaskView;->setNativeStackChromeAlpha(FF)V

    .line 2102
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2112
    :cond_2
    invoke-static {p0, v3}, Lcom/android/quickstep/views/LsNativeStack;->updateDecorations(Lcom/android/quickstep/views/RecentsView;I)V

    .line 2113
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->clearEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;)V

    .line 2114
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setNativeStackApplied(Z)V

    .line 2115
    const-string p0, "LsNativeStack"

    const-string v0, "disabled: native standard/grid transforms restored"

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2116
    return-void
.end method

.method private static resolveEntryAnchorPage(Lcom/android/quickstep/views/RecentsView;)I
    .locals 2

    .line 782
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTaskOrderActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 783
    return v1

    .line 785
    :cond_0
    sget v0, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderSize:I

    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->getInitialTaskOrdinal(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v0

    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->getEntryTaskForOrdinal(Lcom/android/quickstep/views/RecentsView;I)Lcom/android/quickstep/views/TaskView;

    move-result-object v0

    .line 786
    if-nez v0, :cond_1

    .line 787
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorTask:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 789
    :cond_1
    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 790
    :goto_0
    if-ltz v1, :cond_3

    .line 791
    sput v1, Lcom/android/quickstep/views/LsNativeStack;->entryAnchorPage:I

    .line 793
    :cond_3
    return v1
.end method

.method public static resolveInitialPage(Lcom/android/quickstep/views/RecentsView;I)I
    .locals 1

    .line 1160
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1161
    return p1

    .line 1163
    :cond_0
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->resolveEntryAnchorPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result v0

    .line 1164
    if-ltz v0, :cond_1

    .line 1165
    return v0

    .line 1167
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v0

    .line 1168
    if-lez v0, :cond_3

    .line 1169
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->getInitialTaskOrdinal(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v0

    .line 1170
    invoke-static {p0, v0}, Lcom/android/quickstep/views/LsNativeStack;->getTaskForOrdinal(Lcom/android/quickstep/views/RecentsView;I)Lcom/android/quickstep/views/TaskView;

    move-result-object v0

    .line 1171
    if-nez v0, :cond_2

    const/4 p0, -0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result p0

    .line 1172
    :goto_0
    if-ltz p0, :cond_3

    .line 1173
    return p0

    .line 1176
    :cond_3
    return p1
.end method

.method private static scheduleFrameUpdate(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 584
    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->frameUpdateScheduled:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->frameUpdateRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    .line 585
    return-void

    .line 587
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->frameUpdateScheduled:Z

    .line 588
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->frameUpdateRecents:Ljava/lang/ref/WeakReference;

    .line 589
    new-instance v0, Lcom/android/quickstep/views/LsNativeStack$FrameUpdate;

    invoke-direct {v0, p0}, Lcom/android/quickstep/views/LsNativeStack$FrameUpdate;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 590
    return-void
.end method

.method private static scheduleInitialFrameCommit(Lcom/android/quickstep/views/RecentsView;)V
    .locals 2

    .line 797
    sget v0, Lcom/android/quickstep/views/LsNativeStack;->entryStabilizerGeneration:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/android/quickstep/views/LsNativeStack;->entryStabilizerGeneration:I

    .line 798
    new-instance v1, Lcom/android/quickstep/views/LsNativeStack$InitialFrameCommit;

    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/views/LsNativeStack$InitialFrameCommit;-><init>(Lcom/android/quickstep/views/RecentsView;I)V

    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 799
    return-void
.end method

.method private static scheduleMemoryRefresh(Lcom/android/quickstep/views/RecentsView;)V
    .locals 3

    .line 2271
    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->memoryRefreshScheduled:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->memoryRefreshRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    .line 2272
    return-void

    .line 2274
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->memoryRefreshScheduled:Z

    .line 2275
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->memoryRefreshRecents:Ljava/lang/ref/WeakReference;

    .line 2276
    new-instance v0, Lcom/android/quickstep/views/LsNativeStack$MemoryRefresh;

    invoke-direct {v0, p0}, Lcom/android/quickstep/views/LsNativeStack$MemoryRefresh;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    const-wide/16 v1, 0x168

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/quickstep/views/RecentsView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2277
    return-void
.end method

.method private static setClearAllParentClipping(Landroid/view/View;Z)V
    .locals 2

    .line 2386
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    .line 2387
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    .line 2388
    check-cast p0, Landroid/view/ViewGroup;

    .line 2389
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 2390
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 2391
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    .line 2387
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2393
    :cond_0
    return-void
.end method

.method private static setCurrentPageIfChanged(Lcom/android/quickstep/views/RecentsView;I)V
    .locals 1

    .line 616
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 617
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPage()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 618
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setCurrentPage(I)V

    .line 620
    :cond_0
    return-void
.end method

.method private static setEntryPageAligned(Lcom/android/quickstep/views/RecentsView;I)V
    .locals 1

    .line 630
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 631
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setNativeStackOverviewPage(I)V

    .line 633
    :cond_0
    return-void
.end method

.method public static setLiveOverviewTarget(Landroid/content/Context;Z)V
    .locals 0

    .line 275
    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->usesNativeStackStyle(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    sput-boolean p0, Lcom/android/quickstep/views/LsNativeStack;->liveSimulatorOverviewTarget:Z

    .line 276
    const/4 p0, 0x0

    sput p0, Lcom/android/quickstep/views/LsNativeStack;->liveEntryPageProgress:F

    .line 277
    sget p0, Lcom/android/quickstep/views/LsNativeStack;->lastLiveAppliedScale:F

    sput p0, Lcom/android/quickstep/views/LsNativeStack;->liveEntryStartScale:F

    .line 278
    return-void
.end method

.method private static setVisibilityIfChanged(Landroid/view/View;I)V
    .locals 1

    .line 2396
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 2397
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 2399
    :cond_0
    return-void
.end method

.method private static settleEntryPresentation(Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 948
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->clearAnimation()V

    .line 949
    return-void
.end method

.method private static startEntryRevealIfArmed(Lcom/android/quickstep/views/RecentsView;)V
    .locals 5

    .line 1247
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_1

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealAnimator:Landroid/animation/ValueAnimator;

    if-nez v0, :cond_1

    .line 1248
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getWidth()I

    move-result v0

    if-lez v0, :cond_1

    .line 1249
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 1252
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 1253
    const-wide/16 v1, 0x118

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1254
    new-instance v1, Landroid/view/animation/PathInterpolator;

    const v2, 0x3e4ccccd    # 0.2f

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v3, v2, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1255
    new-instance v1, Lcom/android/quickstep/views/LsNativeStack$EntryRevealUpdate;

    invoke-direct {v1, p0}, Lcom/android/quickstep/views/LsNativeStack$EntryRevealUpdate;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 1256
    new-instance v1, Lcom/android/quickstep/views/LsNativeStack$EntryRevealEnd;

    invoke-direct {v1, p0}, Lcom/android/quickstep/views/LsNativeStack$EntryRevealEnd;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1257
    sput-object v0, Lcom/android/quickstep/views/LsNativeStack;->entryRevealAnimator:Landroid/animation/ValueAnimator;

    .line 1258
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 1259
    return-void

    .line 1250
    :cond_1
    :goto_0
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static update(Lcom/android/quickstep/views/RecentsView;)V
    .locals 45

    .line 1767
    move-object/from16 v0, p0

    const-string v9, "LsNativeStack"

    :try_start_0
    sget-object v1, Lcom/android/quickstep/views/LsNativeStack;->drawUpdateRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    const/4 v10, 0x0

    if-ne v1, v0, :cond_0

    .line 1768
    sput-boolean v10, Lcom/android/quickstep/views/LsNativeStack;->drawUpdatePending:Z

    .line 1770
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1771
    invoke-static/range {p0 .. p0}, Lcom/android/quickstep/views/LsNativeStack;->resetIfNeeded(Lcom/android/quickstep/views/RecentsView;)V

    .line 1772
    return-void

    .line 1775
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v11

    .line 1776
    invoke-interface {v11, v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimarySize(Landroid/view/View;)I

    move-result v12

    .line 1777
    if-gtz v12, :cond_2

    .line 1778
    return-void

    .line 1781
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/quickstep/views/LsNativeStack;->loadConfig(Landroid/content/res/Resources;)V

    .line 1783
    nop

    .line 1784
    nop

    .line 1785
    nop

    .line 1786
    nop

    .line 1787
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v13

    .line 1788
    move v1, v10

    move v2, v1

    move v5, v2

    const/4 v3, -0x1

    const/4 v4, 0x0

    :goto_0
    const/high16 v8, 0x3f800000    # 1.0f

    if-ge v1, v13, :cond_6

    .line 1789
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 1790
    instance-of v6, v6, Lcom/android/quickstep/views/TaskView;

    if-nez v6, :cond_3

    .line 1791
    goto :goto_1

    .line 1793
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 1794
    if-gez v3, :cond_4

    .line 1795
    nop

    .line 1796
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->getScrollForPage(I)I

    move-result v5

    move v3, v1

    goto :goto_1

    .line 1797
    :cond_4
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v8

    if-gez v6, :cond_5

    .line 1798
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->getScrollForPage(I)I

    move-result v4

    sub-int/2addr v4, v5

    int-to-float v4, v4

    .line 1788
    :cond_5
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1802
    :cond_6
    if-nez v2, :cond_7

    .line 1803
    invoke-static {v0, v10}, Lcom/android/quickstep/views/LsNativeStack;->updateDecorations(Lcom/android/quickstep/views/RecentsView;I)V

    .line 1804
    invoke-static/range {p0 .. p0}, Lcom/android/quickstep/views/LsNativeStack;->resetIfNeeded(Lcom/android/quickstep/views/RecentsView;)V

    .line 1805
    return-void

    .line 1808
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackEntryPending()Z

    move-result v1

    const/4 v7, 0x1

    if-nez v1, :cond_9

    sget-boolean v1, Lcom/android/quickstep/views/LsNativeStack;->overviewEntryPending:Z

    if-eqz v1, :cond_8

    sget-object v1, Lcom/android/quickstep/views/LsNativeStack;->overviewPendingRecents:Ljava/lang/ref/WeakReference;

    .line 1809
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_8

    goto :goto_2

    :cond_8
    move/from16 v16, v10

    goto :goto_3

    :cond_9
    :goto_2
    move/from16 v16, v7

    .line 1810
    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->isRecentsAnimationRunning()Z

    move-result v1

    .line 1811
    invoke-static/range {p0 .. p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTransitionActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 1812
    invoke-static/range {p0 .. p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTaskOrderActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v6

    if-nez v6, :cond_b

    .line 1813
    invoke-static/range {p0 .. p0}, Lcom/android/quickstep/views/LsNativeStack;->getPreferredEntryTask(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/views/TaskView;

    move-result-object v6

    .line 1814
    if-eqz v6, :cond_a

    .line 1815
    invoke-static {v0, v6}, Lcom/android/quickstep/views/LsNativeStack;->captureEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z

    .line 1817
    :cond_a
    goto :goto_4

    .line 1818
    :cond_b
    invoke-static/range {p0 .. p0}, Lcom/android/quickstep/views/LsNativeStack;->ensureEntryTaskOrder(Lcom/android/quickstep/views/RecentsView;)Z

    .line 1821
    :cond_c
    :goto_4
    invoke-static/range {p0 .. p0}, Lcom/android/quickstep/views/LsNativeStack;->isEntryTaskOrderActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v17

    .line 1822
    if-eqz v16, :cond_d

    if-eqz v1, :cond_d

    if-nez v17, :cond_d

    move/from16 v18, v7

    goto :goto_5

    :cond_d
    move/from16 v18, v10

    .line 1824
    :goto_5
    if-eqz v17, :cond_e

    .line 1825
    invoke-static/range {p0 .. p0}, Lcom/android/quickstep/views/LsNativeStack;->resolveEntryAnchorPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result v1

    goto :goto_6

    :cond_e
    const/4 v1, -0x1

    .line 1826
    :goto_6
    if-eqz v16, :cond_10

    if-eqz v17, :cond_f

    if-nez v18, :cond_f

    .line 1828
    invoke-static {v0, v1}, Lcom/android/quickstep/views/LsNativeStack;->isEntryGeometryReady(Lcom/android/quickstep/views/RecentsView;I)Z

    move-result v1

    if-eqz v1, :cond_f

    goto :goto_7

    :cond_f
    move/from16 v19, v10

    goto :goto_8

    :cond_10
    :goto_7
    move/from16 v19, v7

    .line 1829
    :goto_8
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v1, v8

    if-gez v1, :cond_11

    .line 1830
    int-to-float v1, v12

    const v4, 0x3f3851ec    # 0.72f

    mul-float/2addr v4, v1

    .line 1833
    :cond_11
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackApplied()Z

    move-result v1

    .line 1834
    xor-int/2addr v1, v7

    if-eqz v1, :cond_12

    .line 1835
    invoke-virtual {v0, v7}, Lcom/android/quickstep/views/RecentsView;->setNativeStackApplied(Z)V

    .line 1836
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "enabled: horizontal paging + upward dismiss; tasks="

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v9, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1839
    :cond_12
    invoke-static {v0, v2}, Lcom/android/quickstep/views/LsNativeStack;->updateDecorations(Lcom/android/quickstep/views/RecentsView;I)V

    .line 1848
    invoke-interface {v11, v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    move-result v6

    int-to-float v15, v6

    .line 1849
    nop

    .line 1850
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getScroller()Landroid/widget/OverScroller;

    move-result-object v6

    .line 1851
    if-eqz v6, :cond_13

    invoke-virtual {v6}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v6

    if-nez v6, :cond_13

    move v6, v7

    goto :goto_9

    :cond_13
    move v6, v10

    .line 1852
    :goto_9
    if-eqz v17, :cond_15

    .line 1853
    invoke-static/range {p0 .. p0}, Lcom/android/quickstep/views/LsNativeStack;->resolveEntryAnchorPage(Lcom/android/quickstep/views/RecentsView;)I

    move-result v10

    .line 1854
    if-ltz v10, :cond_14

    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v14

    if-ge v10, v14, :cond_14

    .line 1855
    invoke-virtual {v0, v10}, Lcom/android/quickstep/views/RecentsView;->getScrollForPage(I)I

    move-result v10

    int-to-float v10, v10

    goto :goto_a

    .line 1857
    :cond_14
    move v10, v15

    :goto_a
    goto :goto_c

    :cond_15
    if-eqz v16, :cond_17

    if-lt v2, v7, :cond_17

    .line 1858
    invoke-static {v0, v2}, Lcom/android/quickstep/views/LsNativeStack;->getInitialTaskOrdinal(Lcom/android/quickstep/views/RecentsView;I)I

    move-result v10

    .line 1859
    invoke-static {v0, v10}, Lcom/android/quickstep/views/LsNativeStack;->getTaskForOrdinal(Lcom/android/quickstep/views/RecentsView;I)Lcom/android/quickstep/views/TaskView;

    move-result-object v10

    .line 1860
    if-nez v10, :cond_16

    .line 1861
    const/4 v10, -0x1

    goto :goto_b

    :cond_16
    invoke-virtual {v0, v10}, Lcom/android/quickstep/views/RecentsView;->indexOfChild(Landroid/view/View;)I

    move-result v10

    .line 1862
    :goto_b
    if-ltz v10, :cond_17

    .line 1863
    invoke-virtual {v0, v10}, Lcom/android/quickstep/views/RecentsView;->getScrollForPage(I)I

    move-result v10

    int-to-float v10, v10

    goto :goto_c

    .line 1873
    :cond_17
    move v10, v15

    :goto_c
    sget-object v14, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v14}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v14

    if-ne v14, v0, :cond_18

    sget v14, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissPagePosition:F

    .line 1874
    invoke-static {v14}, Ljava/lang/Float;->isNaN(F)Z

    move-result v14

    if-nez v14, :cond_18

    .line 1875
    int-to-float v14, v2

    sub-float/2addr v14, v8

    sget v7, Lcom/android/quickstep/views/LsNativeStack;->pendingDismissPagePosition:F

    invoke-static {v14, v7}, Ljava/lang/Math;->min(FF)F

    move-result v7

    const/4 v14, 0x0

    invoke-static {v14, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    move v14, v7

    goto :goto_e

    .line 1878
    :cond_18
    if-eqz v17, :cond_19

    sget v7, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderSize:I

    invoke-static {v0, v7}, Lcom/android/quickstep/views/LsNativeStack;->getEntryPagePosition(Lcom/android/quickstep/views/RecentsView;I)F

    move-result v7

    goto :goto_d

    .line 1879
    :cond_19
    nop

    .line 1880
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPage()I

    move-result v7

    .line 1879
    invoke-static {v0, v10, v7}, Lcom/android/quickstep/views/LsNativeStack;->getTaskPagePositionForScroll(Lcom/android/quickstep/views/RecentsView;FI)F

    move-result v7

    :goto_d
    move v14, v7

    .line 1882
    :goto_e
    if-eqz v17, :cond_1a

    sget v2, Lcom/android/quickstep/views/LsNativeStack;->entryTaskOrderSize:I

    :cond_1a
    move v7, v2

    .line 1884
    if-eqz v1, :cond_1b

    .line 1885
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "geometry nativeScroll="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " sampleScroll="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " firstTaskScroll="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " stride="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pagePosition="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " currentPage="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1890
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPage()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1885
    invoke-static {v9, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1893
    :cond_1b
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->isHandlingTouch()Z

    move-result v1

    if-nez v1, :cond_1e

    if-nez v6, :cond_1e

    .line 1894
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPage()I

    move-result v1

    .line 1895
    sget-object v2, Lcom/android/quickstep/views/LsNativeStack;->pagerAuditRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v0, :cond_1c

    sget v2, Lcom/android/quickstep/views/LsNativeStack;->lastAuditedPage:I

    if-eq v2, v1, :cond_1e

    .line 1896
    :cond_1c
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v2, Lcom/android/quickstep/views/LsNativeStack;->pagerAuditRecents:Ljava/lang/ref/WeakReference;

    .line 1897
    sput v1, Lcom/android/quickstep/views/LsNativeStack;->lastAuditedPage:I

    .line 1898
    if-ltz v1, :cond_1d

    .line 1899
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1d

    .line 1900
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Lcom/android/quickstep/views/TaskView;

    if-eqz v2, :cond_1d

    const/4 v2, 0x1

    goto :goto_f

    :cond_1d
    const/4 v2, 0x0

    .line 1901
    :goto_f
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "settled pager page="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " taskPage="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " taskPosition="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " firstTaskPage="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1908
    :cond_1e
    nop

    .line 1909
    const/4 v1, 0x0

    invoke-interface {v11, v8, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(FF)F

    move-result v2

    .line 1908
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v10, 0x3f000000    # 0.5f

    cmpl-float v1, v1, v10

    if-lez v1, :cond_1f

    const/16 v23, 0x1

    goto :goto_10

    :cond_1f
    const/16 v23, 0x0

    .line 1910
    :goto_10
    if-eqz v23, :cond_20

    .line 1911
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    goto :goto_11

    :cond_20
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    :goto_11
    move/from16 v24, v1

    .line 1912
    sget-object v1, Lcom/android/quickstep/views/LsNativeStack;->entryRevealRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_21

    .line 1913
    sget v1, Lcom/android/quickstep/views/LsNativeStack;->entryRevealProgress:F

    invoke-static {v1}, Lcom/android/quickstep/views/LsNativeStack;->clamp(F)F

    move-result v1

    move/from16 v25, v1

    goto :goto_12

    :cond_21
    move/from16 v25, v8

    .line 1914
    :goto_12
    const v1, 0x3d75c28f    # 0.06f

    mul-float v1, v1, v25

    const v2, 0x3f70a3d7    # 0.94f

    add-float v26, v1, v2

    .line 1915
    int-to-float v6, v12

    const v1, -0x40f0a3d7    # -0.56f

    mul-float/2addr v1, v6

    sub-float v2, v8, v25

    mul-float v27, v1, v2

    .line 1917
    const v1, 0x3ca3d70a    # 0.02f

    mul-float v1, v1, v24

    mul-float v28, v1, v2

    .line 1919
    invoke-static/range {p0 .. p0}, Lcom/android/quickstep/views/LsNativeStack;->isDismissTransitionActive(Lcom/android/quickstep/views/RecentsView;)Z

    move-result v29

    .line 1925
    nop

    .line 1926
    nop

    .line 1928
    const/high16 v30, 0x7f800000    # Float.POSITIVE_INFINITY

    move/from16 v4, v30

    const/4 v1, 0x0

    const/4 v5, 0x0

    :goto_13
    if-ge v5, v7, :cond_39

    .line 1929
    nop

    .line 1930
    if-eqz v17, :cond_22

    .line 1931
    invoke-static {v0, v5}, Lcom/android/quickstep/views/LsNativeStack;->getEntryTaskForOrdinal(Lcom/android/quickstep/views/RecentsView;I)Lcom/android/quickstep/views/TaskView;

    move-result-object v2

    move/from16 v32, v1

    move-object v8, v2

    goto :goto_15

    .line 1930
    :cond_22
    const/4 v2, 0x0

    .line 1933
    :goto_14
    if-ge v1, v13, :cond_24

    if-nez v2, :cond_24

    .line 1934
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1935
    instance-of v8, v1, Lcom/android/quickstep/views/TaskView;

    if-eqz v8, :cond_23

    .line 1936
    move-object v2, v1

    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 1938
    :cond_23
    move v1, v3

    const/high16 v8, 0x3f800000    # 1.0f

    goto :goto_14

    .line 1940
    :cond_24
    move/from16 v32, v1

    move-object v8, v2

    :goto_15
    if-nez v8, :cond_25

    .line 1941
    move v2, v4

    move/from16 v35, v5

    move/from16 v36, v6

    move/from16 v22, v7

    move/from16 v39, v10

    move/from16 v42, v13

    move/from16 v43, v14

    const/4 v3, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    const/16 v21, -0x1

    const/16 v34, 0x0

    const/16 v40, 0x1

    goto/16 :goto_1d

    .line 1943
    :cond_25
    int-to-float v1, v5

    .line 1944
    invoke-static {v1, v14, v7}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiDepth(FFI)F

    move-result v2

    .line 1954
    invoke-static {v6, v2}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiCenter(FF)F

    move-result v3

    .line 1955
    add-float v33, v3, v27

    .line 1956
    sget v34, Lcom/android/quickstep/views/LsNativeStack;->focusScale:F

    invoke-static {v2}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiScaleRatio(F)F

    move-result v35

    mul-float v34, v34, v35

    .line 1957
    nop

    .line 1958
    invoke-static {v2}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiAlpha(F)F

    move-result v35

    .line 1959
    const/high16 v36, 0x42c80000    # 100.0f

    sub-float v38, v36, v1

    .line 1961
    nop

    .line 1962
    invoke-interface {v11, v8}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimarySize(Landroid/view/View;)I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, v34

    mul-float/2addr v1, v10

    sub-float v1, v33, v1

    .line 1963
    const v36, 0x3f8a3d71    # 1.08f

    mul-float v36, v36, v6

    cmpl-float v1, v1, v36

    if-lez v1, :cond_26

    .line 1964
    const/16 v35, 0x0

    .line 1967
    :cond_26
    nop

    .line 1968
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getTranslationX()F

    move-result v1

    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getTranslationY()F

    move-result v10

    .line 1967
    invoke-interface {v11, v1, v10}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(FF)F

    move-result v1

    .line 1969
    nop

    .line 1970
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getNativeStackTranslationX()F

    move-result v10

    .line 1971
    move/from16 v40, v6

    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getNativeStackTranslationY()F

    move-result v6

    .line 1969
    invoke-interface {v11, v10, v6}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(FF)F

    move-result v6

    .line 1972
    nop

    .line 1973
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getNativeDismissTranslationX()F

    move-result v10

    .line 1974
    move/from16 v41, v7

    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getNativeDismissTranslationY()F

    move-result v7

    .line 1972
    invoke-interface {v11, v10, v7}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(FF)F

    move-result v7

    .line 1975
    invoke-interface {v11, v8}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getChildStart(Landroid/view/View;)I

    move-result v10

    int-to-float v10, v10

    .line 1976
    move/from16 v42, v13

    invoke-interface {v11, v8}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimarySize(Landroid/view/View;)I

    move-result v13

    int-to-float v13, v13

    const/high16 v36, 0x3f000000    # 0.5f

    mul-float v13, v13, v36

    add-float/2addr v10, v13

    sub-float/2addr v10, v15

    add-float/2addr v10, v1

    sub-float/2addr v10, v6

    sub-float/2addr v10, v7

    .line 1981
    sub-float v1, v33, v10

    .line 1987
    nop

    .line 1988
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getTranslationX()F

    move-result v6

    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getTranslationY()F

    move-result v7

    .line 1987
    invoke-interface {v11, v6, v7}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryValue(FF)F

    move-result v6

    .line 1989
    nop

    .line 1990
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getNativeStackTranslationX()F

    move-result v7

    .line 1991
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getNativeStackTranslationY()F

    move-result v10

    .line 1989
    invoke-interface {v11, v7, v10}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryValue(FF)F

    move-result v7

    .line 1992
    nop

    .line 1993
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getNativeDismissTranslationX()F

    move-result v10

    .line 1994
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getNativeDismissTranslationY()F

    move-result v13

    .line 1992
    invoke-interface {v11, v10, v13}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryValue(FF)F

    move-result v10

    .line 1995
    nop

    .line 1996
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getLeft()I

    move-result v13

    int-to-float v13, v13

    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getPivotX()F

    move-result v33

    add-float v13, v13, v33

    .line 1997
    move/from16 v43, v14

    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getTop()I

    move-result v14

    int-to-float v14, v14

    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getPivotY()F

    move-result v33

    add-float v14, v14, v33

    .line 1995
    invoke-interface {v11, v13, v14}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryValue(FF)F

    move-result v13

    .line 1998
    add-float/2addr v13, v6

    sub-float/2addr v13, v7

    sub-float/2addr v13, v10

    .line 2002
    const/high16 v6, 0x3f000000    # 0.5f

    mul-float v10, v24, v6

    sub-float/2addr v10, v13

    add-float v10, v10, v28

    .line 2005
    mul-float v13, v34, v26

    .line 2006
    mul-float v14, v35, v25

    .line 2007
    if-nez v18, :cond_27

    if-eqz v16, :cond_28

    if-nez v19, :cond_28

    if-lez v5, :cond_28

    .line 2013
    :cond_27
    const/4 v14, 0x0

    .line 2018
    :cond_28
    nop

    .line 2019
    invoke-interface {v11, v8}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimarySize(Landroid/view/View;)I

    move-result v6

    int-to-float v6, v6

    mul-float v6, v6, v34

    const/high16 v39, 0x3f000000    # 0.5f

    mul-float v6, v6, v39

    sub-float v7, v3, v6

    .line 2020
    nop

    .line 2021
    invoke-interface {v11, v8}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimarySize(Landroid/view/View;)I

    move-result v6

    int-to-float v6, v6

    mul-float v6, v6, v34

    mul-float v6, v6, v39

    add-float v44, v3, v6

    .line 2022
    invoke-interface {v11, v1, v10}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(FF)F

    move-result v34

    .line 2023
    invoke-interface {v11, v1, v10}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryValue(FF)F

    move-result v35

    .line 2024
    invoke-static {v0, v8}, Lcom/android/quickstep/views/LsNativeStack;->isPendingDismissTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z

    move-result v1

    if-nez v1, :cond_2b

    sget-object v1, Lcom/android/quickstep/views/LsNativeStack;->gestureLayerTask:Ljava/lang/ref/WeakReference;

    .line 2025
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v8, :cond_29

    .line 2026
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getNativeDismissTranslationX()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v10, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v10

    if-gtz v1, :cond_2c

    .line 2027
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getNativeDismissTranslationY()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v1, v1, v10

    if-lez v1, :cond_2a

    goto :goto_16

    .line 2025
    :cond_29
    const/high16 v10, 0x3f800000    # 1.0f

    .line 2027
    :cond_2a
    const/16 v31, 0x0

    goto :goto_17

    .line 2024
    :cond_2b
    const/high16 v10, 0x3f800000    # 1.0f

    .line 2027
    :cond_2c
    :goto_16
    const/16 v31, 0x1

    .line 2028
    :goto_17
    invoke-static {v0, v8}, Lcom/android/quickstep/views/LsNativeStack;->isPendingDismissReflowTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)Z

    move-result v1

    .line 2029
    move-object/from16 v33, v8

    move/from16 v36, v13

    move/from16 v37, v14

    invoke-virtual/range {v33 .. v38}, Lcom/android/quickstep/views/TaskView;->setNativeStackTransform(FFFFF)V

    .line 2032
    if-eqz v17, :cond_2d

    .line 2033
    invoke-static {v8}, Lcom/android/quickstep/views/LsNativeStack;->settleEntryPresentation(Lcom/android/quickstep/views/TaskView;)V

    .line 2043
    :cond_2d
    const v6, 0x3c23d70a    # 0.01f

    if-eqz v16, :cond_2f

    if-nez v19, :cond_2f

    .line 2044
    if-nez v5, :cond_2e

    const/4 v1, -0x1

    goto :goto_18

    :cond_2e
    const/4 v1, 0x0

    :goto_18
    invoke-virtual {v8, v1}, Lcom/android/quickstep/views/TaskView;->setNativeStackClipRight(I)V

    const/4 v3, -0x1

    goto :goto_1a

    .line 2045
    :cond_2f
    if-eqz v23, :cond_34

    if-nez v31, :cond_34

    if-eqz v1, :cond_30

    const/4 v3, -0x1

    goto :goto_19

    .line 2047
    :cond_30
    cmpg-float v1, v14, v6

    if-gtz v1, :cond_31

    .line 2048
    const/4 v1, 0x0

    invoke-virtual {v8, v1}, Lcom/android/quickstep/views/TaskView;->setNativeStackClipRight(I)V

    const/4 v3, -0x1

    goto :goto_1a

    .line 2049
    :cond_31
    cmpl-float v1, v4, v30

    if-eqz v1, :cond_33

    .line 2050
    nop

    .line 2051
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/views/RecentsView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x40400000    # 3.0f

    mul-float/2addr v1, v3

    .line 2052
    sub-float v3, v4, v7

    add-float/2addr v3, v1

    .line 2053
    invoke-static {v6, v13}, Ljava/lang/Math;->max(FF)F

    move-result v1

    div-float/2addr v3, v1

    .line 2052
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 2054
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getWidth()I

    move-result v3

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v3, 0x0

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 2055
    nop

    .line 2056
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getWidth()I

    move-result v3

    if-lt v1, v3, :cond_32

    const/4 v1, -0x1

    .line 2055
    :cond_32
    invoke-virtual {v8, v1}, Lcom/android/quickstep/views/TaskView;->setNativeStackClipRight(I)V

    .line 2057
    const/4 v3, -0x1

    goto :goto_1a

    .line 2058
    :cond_33
    const/4 v3, -0x1

    invoke-virtual {v8, v3}, Lcom/android/quickstep/views/TaskView;->setNativeStackClipRight(I)V

    goto :goto_1a

    .line 2045
    :cond_34
    const/4 v3, -0x1

    .line 2046
    :goto_19
    invoke-virtual {v8, v3}, Lcom/android/quickstep/views/TaskView;->setNativeStackClipRight(I)V

    .line 2061
    :goto_1a
    invoke-static {v2}, Lcom/android/quickstep/views/LsNativeStack;->getMiuiTitleAlpha(F)F

    move-result v20

    .line 2062
    nop

    .line 2063
    nop

    .line 2064
    if-eqz v23, :cond_35

    const v1, 0x3a83126f    # 0.001f

    cmpl-float v1, v20, v1

    if-lez v1, :cond_35

    .line 2065
    invoke-virtual {v8}, Lcom/android/quickstep/views/TaskView;->getNativeStackTitleView()Landroid/widget/TextView;

    move-result-object v33

    .line 2066
    move-object/from16 v1, p0

    move-object v2, v8

    move/from16 v21, v3

    const/16 v34, 0x0

    move-object/from16 v3, v33

    move/from16 v33, v4

    move v4, v7

    move/from16 v35, v5

    move/from16 v5, v44

    move/from16 v37, v6

    move/from16 v36, v40

    move v6, v13

    move/from16 v38, v7

    move/from16 v22, v41

    const/16 v40, 0x1

    move/from16 v7, v33

    move-object/from16 v41, v8

    move v8, v12

    invoke-static/range {v1 .. v8}, Lcom/android/quickstep/views/LsNativeStack;->getFullyVisibleFactor(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Landroid/view/View;FFFFI)F

    move-result v8

    .line 2070
    move-object/from16 v1, p0

    move-object/from16 v2, v41

    move/from16 v3, v38

    move/from16 v4, v44

    move v5, v13

    move/from16 v6, v33

    move v7, v12

    invoke-static/range {v1 .. v7}, Lcom/android/quickstep/views/LsNativeStack;->getActionsVisibleFactor(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;FFFFI)F

    move-result v1

    goto :goto_1b

    .line 2064
    :cond_35
    move/from16 v21, v3

    move/from16 v33, v4

    move/from16 v35, v5

    move/from16 v37, v6

    move/from16 v38, v7

    move/from16 v36, v40

    move/from16 v22, v41

    const/16 v34, 0x0

    const/16 v40, 0x1

    move-object/from16 v41, v8

    .line 2074
    move v1, v10

    move v8, v1

    :goto_1b
    if-eqz v16, :cond_36

    if-nez v19, :cond_36

    .line 2075
    move-object/from16 v2, v41

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v3}, Lcom/android/quickstep/views/TaskView;->setNativeStackChromeAlpha(FF)V

    goto :goto_1c

    .line 2074
    :cond_36
    move-object/from16 v2, v41

    const/4 v3, 0x0

    .line 2076
    if-nez v29, :cond_37

    .line 2077
    mul-float v8, v8, v20

    mul-float v1, v1, v20

    invoke-virtual {v2, v8, v1}, Lcom/android/quickstep/views/TaskView;->setNativeStackChromeAlpha(FF)V

    .line 2082
    :cond_37
    :goto_1c
    cmpl-float v1, v14, v37

    if-lez v1, :cond_38

    if-nez v31, :cond_38

    .line 2083
    move/from16 v2, v33

    move/from16 v1, v38

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v4

    goto :goto_1e

    .line 2082
    :cond_38
    move/from16 v2, v33

    .line 1928
    :goto_1d
    move v4, v2

    :goto_1e
    add-int/lit8 v5, v35, 0x1

    move v8, v10

    move/from16 v7, v22

    move/from16 v1, v32

    move/from16 v6, v36

    move/from16 v10, v39

    move/from16 v13, v42

    move/from16 v14, v43

    goto/16 :goto_13

    .line 2086
    :cond_39
    if-eqz v16, :cond_3a

    .line 2087
    invoke-static {v0, v12}, Lcom/android/quickstep/views/LsNativeStack;->finishCachedEntryStagingIfReady(Lcom/android/quickstep/views/RecentsView;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2095
    :cond_3a
    goto :goto_1f

    .line 2089
    :catchall_0
    move-exception v0

    .line 2090
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 2091
    sget-wide v3, Lcom/android/quickstep/views/LsNativeStack;->lastErrorLogMs:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0xbb8

    cmp-long v3, v3, v5

    if-lez v3, :cond_3b

    .line 2092
    sput-wide v1, Lcom/android/quickstep/views/LsNativeStack;->lastErrorLogMs:J

    .line 2093
    const-string v1, "stack transform failed; preserving native Recents"

    invoke-static {v9, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2096
    :cond_3b
    :goto_1f
    return-void
.end method

.method private static updateDecorations(Lcom/android/quickstep/views/RecentsView;I)V
    .locals 13

    .line 2222
    if-ltz p1, :cond_1

    sget-boolean v0, Lcom/android/quickstep/views/LsNativeStack;->overviewActive:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    .line 2223
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_1

    .line 2224
    :cond_0
    const/4 p1, -0x1

    .line 2226
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 2227
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getRootView()Landroid/view/View;

    move-result-object v2

    .line 2228
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    .line 2229
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v4

    .line 2230
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/android/quickstep/views/LsNativeStack;->isMemoryInfoEnabled(Landroid/content/Context;)Z

    move-result v5

    .line 2231
    sget-object v6, Lcom/android/quickstep/views/LsNativeStack;->decorationRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    const/4 v7, 0x0

    if-ne v6, p0, :cond_2

    sget v6, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationTaskCount:I

    if-ne v6, p1, :cond_2

    sget v6, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationWidth:I

    if-ne v6, v3, :cond_2

    sget v6, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationHeight:I

    if-ne v6, v4, :cond_2

    sget-boolean v6, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationShowMemory:Z

    if-ne v6, v5, :cond_2

    const/4 v6, 0x1

    goto :goto_0

    :cond_2
    move v6, v7

    .line 2236
    :goto_0
    const-wide/16 v8, 0x7d0

    if-eqz v6, :cond_4

    if-ltz p1, :cond_3

    sget-wide v10, Lcom/android/quickstep/views/LsNativeStack;->lastMemoryUpdateMs:J

    sub-long v10, v0, v10

    cmp-long v6, v10, v8

    if-gez v6, :cond_4

    .line 2237
    :cond_3
    return-void

    .line 2239
    :cond_4
    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v6, Lcom/android/quickstep/views/LsNativeStack;->decorationRecents:Ljava/lang/ref/WeakReference;

    .line 2240
    sput p1, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationTaskCount:I

    .line 2241
    sput v3, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationWidth:I

    .line 2242
    sput v4, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationHeight:I

    .line 2243
    sput-boolean v5, Lcom/android/quickstep/views/LsNativeStack;->lastDecorationShowMemory:Z

    .line 2245
    const v3, 0x7f0b06c6

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 2246
    const v4, 0x7f0b06ca

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 2247
    const v6, 0x7f0b04d7

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 2248
    const v10, 0x7f0b04d6

    invoke-virtual {v2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    .line 2250
    const/16 v11, 0x8

    if-gez p1, :cond_5

    .line 2251
    invoke-static {v6, v10}, Lcom/android/quickstep/views/LsNativeStack;->resetClearAllGeometry(Landroid/view/View;Landroid/view/View;)V

    .line 2252
    invoke-static {v3, v11}, Lcom/android/quickstep/views/LsNativeStack;->setVisibilityIfChanged(Landroid/view/View;I)V

    .line 2253
    invoke-static {v4, v11}, Lcom/android/quickstep/views/LsNativeStack;->setVisibilityIfChanged(Landroid/view/View;I)V

    .line 2254
    invoke-static {v6, v7}, Lcom/android/quickstep/views/LsNativeStack;->setVisibilityIfChanged(Landroid/view/View;I)V

    .line 2255
    return-void

    .line 2258
    :cond_5
    nop

    .line 2259
    if-eqz v5, :cond_6

    move v12, v7

    goto :goto_1

    :cond_6
    move v12, v11

    .line 2258
    :goto_1
    invoke-static {v3, v12}, Lcom/android/quickstep/views/LsNativeStack;->setVisibilityIfChanged(Landroid/view/View;I)V

    .line 2260
    nop

    .line 2261
    if-nez p1, :cond_7

    move v3, v7

    goto :goto_2

    :cond_7
    move v3, v11

    .line 2260
    :goto_2
    invoke-static {v4, v3}, Lcom/android/quickstep/views/LsNativeStack;->setVisibilityIfChanged(Landroid/view/View;I)V

    .line 2262
    nop

    .line 2263
    if-nez p1, :cond_8

    move v7, v11

    .line 2262
    :cond_8
    invoke-static {v6, v7}, Lcom/android/quickstep/views/LsNativeStack;->setVisibilityIfChanged(Landroid/view/View;I)V

    .line 2264
    invoke-static {v2, v6, v10}, Lcom/android/quickstep/views/LsNativeStack;->applyStackClearAllGeometry(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 2266
    if-eqz v5, :cond_a

    sget-wide v2, Lcom/android/quickstep/views/LsNativeStack;->lastMemoryUpdateMs:J

    sub-long/2addr v0, v2

    cmp-long p1, v0, v8

    if-gez p1, :cond_9

    goto :goto_3

    .line 2267
    :cond_9
    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->scheduleMemoryRefresh(Lcom/android/quickstep/views/RecentsView;)V

    .line 2268
    return-void

    .line 2266
    :cond_a
    :goto_3
    return-void
.end method

.method private static usesNativeStackStyle(Landroid/content/Context;)Z
    .locals 6

    .line 187
    sget-object v0, Lcom/android/quickstep/views/LsNativeStack;->activeOverviewRecents:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 188
    if-eqz v0, :cond_0

    .line 189
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result p0

    return p0

    .line 191
    :cond_0
    const/4 v0, 0x0

    if-nez p0, :cond_1

    .line 192
    return v0

    .line 195
    :cond_1
    :try_start_0
    const-string v1, "com.android.launcher3.J3"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 196
    const-string v2, "m"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    aput-object v5, v4, v0

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 198
    new-array v2, v3, [Ljava/lang/Object;

    aput-object p0, v2, v0

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 199
    instance-of v2, v1, Landroid/content/SharedPreferences;

    if-nez v2, :cond_2

    .line 200
    return v0

    .line 202
    :cond_2
    const v2, 0x7f1403b7

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 203
    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1, p0, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x3

    if-ne p0, v1, :cond_3

    move v0, v3

    :cond_3
    return v0

    .line 204
    :catchall_0
    move-exception p0

    .line 205
    return v0
.end method

.method private static valueAlongDepth(FFF)F
    .locals 0

    .line 1751
    neg-float p0, p0

    sub-float/2addr p0, p1

    mul-float/2addr p0, p2

    invoke-static {p0}, Lcom/android/quickstep/views/LsNativeStack;->clamp(F)F

    move-result p0

    return p0
.end method
