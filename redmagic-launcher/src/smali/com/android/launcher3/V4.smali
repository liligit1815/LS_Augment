.class public abstract Lcom/android/launcher3/V4;
.super Landroid/view/ViewGroup;
.source "PagedView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/V4$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ":",
        "Lcom/android/launcher3/pageindicators/d;",
        ">",
        "Landroid/view/ViewGroup;"
    }
.end annotation


# static fields
.field public static final ACTION_MOVE_ALLOW_EASY_FLING:I = 0xfe

.field private static final DEBUG:Z = false

.field public static final DEBUG_FAILED_QUICKSWITCH:Z = false

.field private static final DEFAULT_MODE:I = -0x1

.field private static final DEFAULT_OVER_SCROLL_FACTOR:F = 8.0f

.field private static final FLING_MODE:I = 0x1

.field public static final INVALID_PAGE:I = -0x2

.field protected static final INVALID_POINTER:I = -0x1

.field private static final MAX_SCROLL_PROGRESS:F = 1.0f

.field protected static final RETURN_TO_ORIGINAL_PAGE_THRESHOLD:F = 0.33f

.field private static final SCROLL_MODE:I = 0x0

.field protected static SIGNIFICANT_MOVE_THRESHOLD:F = 0.0f

.field protected static final SIMPLE_SCROLL_LOGIC:Lcom/android/launcher3/V4$c;

.field private static final TAG:Ljava/lang/String; = "PagedView"


# instance fields
.field protected EASY_FLING_THRESHOLD_VELOCITY_LOCAL:I

.field protected FLING_THRESHOLD_VELOCITY_LOCAL:I

.field protected FREE_SCROLL_MAX_VELOCITY:I

.field protected FREE_SCROLL_MIN_VELOCITY:I

.field SCROLL_NEBULAOS2:Landroid/view/animation/Interpolator;

.field protected SIGNIFICANT_MOVE_THRESHOLD_LOCAL:F

.field protected isFirstFrameWhenUp:Z

.field protected mActivePointerId:I

.field private mAllowEasyFling:Z

.field protected mAllowOverScroll:Z

.field protected mCurrentPage:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field protected mCurrentPageScrollDiff:I

.field protected mCurrentScrollOverPage:I

.field protected mDownMotionPrimary:F

.field protected mDownMotionSecondary:F

.field private mDownMotionX:F

.field private mDownMotionY:F

.field protected mDownWithBeingDragged:Z

.field protected mDragView:Landroid/view/View;

.field protected mEasyFlingThresholdVelocity:I

.field protected mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

.field protected mEdgeGlowRight:Lcom/android/launcher3/util/i0;

.field private mFinalPage:I

.field public mFirstLayout:Z

.field protected mFlingThresholdVelocity:I

.field protected mFreeScroll:Z

.field private mFreeScrollMFV:Z

.field protected final mInsets:Landroid/graphics/Rect;

.field protected mIsBeingDragged:Z

.field protected mIsCircle:Z

.field protected mIsInterruptScrollAnimation:Z

.field protected mIsLayoutValid:Z

.field protected mIsPageInTransition:Z

.field public mIsRtl:Z

.field public mIsSnapToHome:Z

.field private mLandRect:Landroid/graphics/Rect;

.field protected mLastMotion:F

.field private mLastScreenCenter:I

.field protected mMaxScroll:I

.field protected mMaximumVelocity:I

.field protected mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

.field protected mMfvPageIndicatorLayout:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

.field protected mMfvPageIndicatorMiboard:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

.field protected mMinFlingVelocity:I

.field protected mMinScroll:I

.field protected mMinSnapVelocity:I

.field protected mNextPage:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private final mOnPageScrollsInitializedCallbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field protected mOnPageTransitionEndCallback:Ljava/lang/Runnable;

.field protected mOrientationHandler:Lcom/android/launcher3/touch/G;

.field private mOriginValuePoint:Landroid/graphics/Point;

.field protected mOriginalFlingThresholdVelocity:I

.field protected mPageIndicator:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public mPageIndicatorViewId:I

.field protected mPageScrolls:[I

.field protected mPageSlop:I

.field protected mPageSnapAnimationDuration:I

.field protected mPageSpacing:I

.field private mPageWidth:I

.field protected mScrollMode:I

.field protected mScroller:Landroid/widget/OverScroller;

.field protected mSnapToHomeStartPage:I

.field private mTmpIntPair:[I

.field protected mTotalMotion:F

.field protected mTouchSlop:I

.field private mTouchSlopScale:F

.field protected mUnboundedScroll:I

.field protected mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/O4;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/O4;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/V4;->SIMPLE_SCROLL_LOGIC:Lcom/android/launcher3/V4$c;

    .line 7
    .line 8
    const v0, 0x3ecccccd    # 0.4f

    .line 9
    .line 10
    .line 11
    sput v0, Lcom/android/launcher3/V4;->SIGNIFICANT_MOVE_THRESHOLD:F

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/V4;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/V4;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    const/4 v1, 0x1

    .line 5
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mFirstLayout:Z

    const/4 v2, -0x2

    .line 6
    iput v2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 7
    iput v0, p0, Lcom/android/launcher3/V4;->mPageSpacing:I

    .line 8
    sget-object v2, Lcom/android/launcher3/touch/G;->a:Lcom/android/launcher3/touch/G;

    iput-object v2, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 9
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/launcher3/V4;->mOnPageScrollsInitializedCallbacks:Ljava/util/ArrayList;

    const/4 v2, 0x0

    .line 10
    iput-object v2, p0, Lcom/android/launcher3/V4;->mPageScrolls:[I

    .line 11
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mAllowOverScroll:Z

    const/4 v3, -0x1

    .line 12
    iput v3, p0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 13
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsPageInTransition:Z

    .line 14
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, p0, Lcom/android/launcher3/V4;->mInsets:Landroid/graphics/Rect;

    const/4 v4, 0x2

    .line 15
    new-array v4, v4, [I

    iput-object v4, p0, Lcom/android/launcher3/V4;->mTmpIntPair:[I

    .line 16
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 17
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsSnapToHome:Z

    .line 18
    iput v3, p0, Lcom/android/launcher3/V4;->mSnapToHomeStartPage:I

    .line 19
    iput v0, p0, Lcom/android/launcher3/V4;->mPageWidth:I

    .line 20
    iput v3, p0, Lcom/android/launcher3/V4;->mLastScreenCenter:I

    .line 21
    iput-object v2, p0, Lcom/android/launcher3/V4;->mLandRect:Landroid/graphics/Rect;

    const/high16 v2, 0x3f800000    # 1.0f

    .line 22
    iput v2, p0, Lcom/android/launcher3/V4;->mTouchSlopScale:F

    .line 23
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mFreeScrollMFV:Z

    .line 24
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    iput-object v2, p0, Lcom/android/launcher3/V4;->mOriginValuePoint:Landroid/graphics/Point;

    .line 25
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsInterruptScrollAnimation:Z

    .line 26
    new-instance v2, Lcom/android/launcher3/V4$b;

    invoke-direct {v2, p0}, Lcom/android/launcher3/V4$b;-><init>(Lcom/android/launcher3/V4;)V

    iput-object v2, p0, Lcom/android/launcher3/V4;->SCROLL_NEBULAOS2:Landroid/view/animation/Interpolator;

    .line 27
    sget-object v2, Lcom/android/launcher3/x5;->d2:[I

    invoke-virtual {p1, p2, v2, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 28
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/launcher3/resource/B;->w()Z

    move-result p3

    if-eqz p3, :cond_0

    .line 29
    invoke-virtual {p2, v0, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p2, v1, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    :goto_0
    iput p3, p0, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 31
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 32
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setHapticFeedbackEnabled(Z)V

    .line 33
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p2}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 34
    invoke-static {}, Lx1/O;->O1()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 35
    new-instance p2, Landroid/widget/OverScroller;

    iget-object p3, p0, Lcom/android/launcher3/V4;->SCROLL_NEBULAOS2:Landroid/view/animation/Interpolator;

    invoke-direct {p2, p1, p3}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    goto :goto_1

    .line 36
    :cond_1
    new-instance p2, Landroid/widget/OverScroller;

    sget-object p3, LJ0/h;->Z:Landroid/view/animation/Interpolator;

    invoke-direct {p2, p1, p3}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 37
    :goto_1
    iput v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 38
    iput v0, p0, Lcom/android/launcher3/V4;->mCurrentScrollOverPage:I

    .line 39
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    .line 40
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/V4;->mTouchSlop:I

    .line 41
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 42
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/V4;->mMaximumVelocity:I

    .line 43
    invoke-direct {p0}, Lcom/android/launcher3/V4;->updateVelocityValues()V

    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->initEdgeEffect()V

    .line 45
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDefaultFocusHighlightEnabled(Z)V

    .line 46
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    return-void
.end method

.method public static synthetic B(Lcom/android/launcher3/V4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/V4;->lambda$onViewRemoved$2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static synthetic E(Lcom/android/launcher3/V4;Ljava/util/function/Consumer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/V4;->lambda$forEachVisiblePage$1(Ljava/util/function/Consumer;Ljava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/V4;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/V4;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private cancelHotseatLongPress()V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/Workspace;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->cancelLongPress()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private clipScreenIfNecessary(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isClipCanvasWidth()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/V4;->mLandRect:Landroid/graphics/Rect;

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget v2, v1, Landroid/graphics/Rect;->right:I

    .line 39
    .line 40
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    sub-int/2addr v2, v1

    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    sub-int/2addr v2, v1

    .line 48
    new-instance v1, Landroid/graphics/Rect;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    sub-int/2addr v3, v2

    .line 55
    iget v4, v0, Lcom/android/launcher3/X3;->V:I

    .line 56
    .line 57
    add-int/2addr v3, v4

    .line 58
    iget-object v4, p0, Lcom/android/launcher3/V4;->mLandRect:Landroid/graphics/Rect;

    .line 59
    .line 60
    iget v4, v4, Landroid/graphics/Rect;->top:I

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    sub-int/2addr v5, v2

    .line 67
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    add-int/2addr v5, v2

    .line 72
    iget v2, p0, Lcom/android/launcher3/V4;->mPageSpacing:I

    .line 73
    .line 74
    add-int/2addr v5, v2

    .line 75
    iget v0, v0, Lcom/android/launcher3/X3;->V:I

    .line 76
    .line 77
    add-int/2addr v5, v0

    .line 78
    iget-object p0, p0, Lcom/android/launcher3/V4;->mLandRect:Landroid/graphics/Rect;

    .line 79
    .line 80
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 81
    .line 82
    invoke-direct {v1, v3, v4, v5, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 86
    .line 87
    .line 88
    :cond_1
    :goto_0
    return-void
.end method

.method private dispatchDrawMFV(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-le v0, v1, :cond_6

    .line 7
    .line 8
    instance-of v2, p0, Lcom/android/quickstep/views/RecentsView;

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    div-int/lit8 v1, v1, 0x2

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    iget v1, p0, Lcom/android/launcher3/V4;->mLastScreenCenter:I

    .line 25
    .line 26
    if-eq v0, v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isInWorkSpace()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    move-object v1, p0

    .line 35
    check-cast v1, Lcom/android/launcher3/Workspace;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/android/launcher3/Workspace;->getCurEffect()Lcom/android/launcher3/M5;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2, v0}, Lcom/android/launcher3/M5;->e(I)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    iget-object v1, v1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 51
    .line 52
    invoke-static {v1}, Lcom/android/launcher3/blur/f;->o(Lcom/android/launcher3/C2;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iput v0, p0, Lcom/android/launcher3/V4;->mLastScreenCenter:I

    .line 56
    .line 57
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/launcher3/V4;->clipScreenIfNecessary(Landroid/graphics/Canvas;)V

    .line 58
    .line 59
    .line 60
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 61
    .line 62
    if-nez v0, :cond_4

    .line 63
    .line 64
    iget v0, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 65
    .line 66
    const/4 v1, -0x2

    .line 67
    if-ne v0, v1, :cond_4

    .line 68
    .line 69
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDrawingTime()J

    .line 78
    .line 79
    .line 80
    move-result-wide v1

    .line 81
    invoke-virtual {p0, p1, v0, v1, v2}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 82
    .line 83
    .line 84
    :cond_3
    return-void

    .line 85
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    int-to-float v0, v0

    .line 90
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    int-to-float v1, v1

    .line 95
    div-float/2addr v0, v1

    .line 96
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsSnapToHome:Z

    .line 97
    .line 98
    if-nez v1, :cond_5

    .line 99
    .line 100
    invoke-direct {p0, v0}, Lcom/android/launcher3/V4;->verifyPageIndex(F)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput v0, p0, Lcom/android/launcher3/V4;->mFinalPage:I

    .line 105
    .line 106
    :cond_5
    iget v0, p0, Lcom/android/launcher3/V4;->mFinalPage:I

    .line 107
    .line 108
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/V4;->dispatchDrawHelper(ILandroid/graphics/Canvas;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_6
    :goto_0
    if-ne v0, v1, :cond_7

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isInWorkSpace()Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_7

    .line 119
    .line 120
    move-object v0, p0

    .line 121
    check-cast v0, Lcom/android/launcher3/Workspace;

    .line 122
    .line 123
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 126
    .line 127
    .line 128
    invoke-static {}, Lx1/Z;->o()Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-nez v1, :cond_7

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    div-int/lit8 v2, v2, 0x2

    .line 143
    .line 144
    add-int/2addr v1, v2

    .line 145
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getCurEffect()Lcom/android/launcher3/M5;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0, v1}, Lcom/android/launcher3/M5;->e(I)V

    .line 150
    .line 151
    .line 152
    :cond_7
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method private dispatchPageCountChanged()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Lcom/android/launcher3/pageindicators/d;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    div-int/2addr v1, v2

    .line 16
    invoke-interface {v0, v1}, Lcom/android/launcher3/pageindicators/d;->setMarkersCount(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private ensureWithinScrollBounds(I)I
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, -0x1

    .line 8
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    :goto_1
    iget v2, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 13
    .line 14
    const-string v3, "PagedView"

    .line 15
    .line 16
    if-ge v1, v2, :cond_3

    .line 17
    .line 18
    add-int/2addr p1, v0

    .line 19
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-gt v2, v1, :cond_2

    .line 24
    .line 25
    const-string v1, "validateNewPage: failed to find a page > mMinScrollX"

    .line 26
    .line 27
    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    :cond_1
    move v1, v2

    .line 31
    goto :goto_2

    .line 32
    :cond_2
    move v1, v2

    .line 33
    goto :goto_1

    .line 34
    :cond_3
    :goto_2
    iget v2, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 35
    .line 36
    if-le v1, v2, :cond_4

    .line 37
    .line 38
    sub-int/2addr p1, v0

    .line 39
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-lt v2, v1, :cond_1

    .line 44
    .line 45
    const-string p0, "validateNewPage: failed to find a page < mMaxScrollX"

    .line 46
    .line 47
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    :cond_4
    return p1
.end method

.method private getDisplacementFromScreenCenter(II)I
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getChildVisibleSize(I)I

    move-result v0

    .line 2
    div-int/lit8 v0, v0, 0x2

    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getChildOffset(I)I

    move-result p0

    add-int/2addr p0, v0

    sub-int/2addr p0, p2

    return p0
.end method

.method private getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/dragndrop/DragLayer;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/dragndrop/DragLayer;

    .line 14
    .line 15
    const v0, 0x7f0b0303

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method private getNeighbourPageIndices(I)Lcom/android/launcher3/util/z0;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/16 v2, 0x11

    .line 10
    .line 11
    if-ne p1, v2, :cond_0

    .line 12
    .line 13
    sub-int p1, v1, v0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/16 v2, 0x42

    .line 17
    .line 18
    if-ne p1, v2, :cond_2

    .line 19
    .line 20
    add-int p1, v1, v0

    .line 21
    .line 22
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-ne p1, v1, :cond_1

    .line 27
    .line 28
    new-instance p0, Lcom/android/launcher3/util/z0;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/V4;->getPageIndices(I)Lcom/android/launcher3/util/z0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_2
    new-instance p0, Lcom/android/launcher3/util/z0;

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 42
    .line 43
    .line 44
    return-object p0
.end method

.method private getOriginScroll()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/V4;->mOriginValuePoint:Landroid/graphics/Point;

    .line 4
    .line 5
    iget v1, p0, Landroid/graphics/Point;->x:I

    .line 6
    .line 7
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 8
    .line 9
    invoke-interface {v0, v1, p0}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private getPageIndices(I)Lcom/android/launcher3/util/z0;
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getLeftmostVisiblePageForIndex(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    new-instance v0, Lcom/android/launcher3/util/z0;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    move v2, p1

    .line 19
    :goto_0
    add-int v3, p1, v1

    .line 20
    .line 21
    if-ge v2, v3, :cond_0

    .line 22
    .line 23
    if-ge v2, p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-object v0
.end method

.method private getPageNearestToCenterOfScreen(I)I
    .locals 5

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getScreenCenter(I)I

    move-result p1

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const v1, 0x7fffffff

    const/4 v2, -0x1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_1

    .line 4
    invoke-direct {p0, v3, p1}, Lcom/android/launcher3/V4;->getDisplacementFromScreenCenter(II)I

    move-result v4

    .line 5
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-ge v4, v1, :cond_0

    move v2, v3

    move v1, v4

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method private getPageWidthSize(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mInsets:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 4
    .line 5
    sub-int/2addr p1, v1

    .line 6
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 7
    .line 8
    sub-int/2addr p1, v0

    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sub-int/2addr p1, v0

    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    sub-int/2addr p1, v0

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    div-int/2addr p1, v0

    .line 24
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/2addr p1, v0

    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    add-int/2addr p1, p0

    .line 34
    return p1
.end method

.method private isAllowOverScroll()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mAllowOverScroll:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private isMenuOverView()Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/Workspace;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

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

.method private isScreenInRange(FII)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p2, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    sub-int/2addr v2, v1

    .line 10
    if-ne p3, v2, :cond_1

    .line 11
    .line 12
    const/high16 p0, -0x40800000    # -1.0f

    .line 13
    .line 14
    cmpg-float p0, p0, p1

    .line 15
    .line 16
    if-gtz p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    cmpg-float p0, p1, p0

    .line 20
    .line 21
    if-gtz p0, :cond_0

    .line 22
    .line 23
    return v1

    .line 24
    :cond_0
    return v0

    .line 25
    :cond_1
    if-nez p3, :cond_3

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    sub-int/2addr v2, v1

    .line 32
    if-ne p2, v2, :cond_3

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    sub-int/2addr p2, v1

    .line 39
    int-to-float p2, p2

    .line 40
    cmpg-float p2, p2, p1

    .line 41
    .line 42
    if-gtz p2, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    int-to-float p0, p0

    .line 49
    cmpg-float p0, p1, p0

    .line 50
    .line 51
    if-gtz p0, :cond_2

    .line 52
    .line 53
    return v1

    .line 54
    :cond_2
    return v0

    .line 55
    :cond_3
    if-le p2, p3, :cond_5

    .line 56
    .line 57
    int-to-float p0, p3

    .line 58
    cmpg-float p0, p0, p1

    .line 59
    .line 60
    if-gez p0, :cond_4

    .line 61
    .line 62
    int-to-float p0, p2

    .line 63
    cmpg-float p0, p1, p0

    .line 64
    .line 65
    if-gez p0, :cond_4

    .line 66
    .line 67
    return v1

    .line 68
    :cond_4
    return v0

    .line 69
    :cond_5
    int-to-float p0, p2

    .line 70
    cmpg-float p0, p0, p1

    .line 71
    .line 72
    if-gez p0, :cond_6

    .line 73
    .line 74
    int-to-float p0, p3

    .line 75
    cmpg-float p0, p1, p0

    .line 76
    .line 77
    if-gez p0, :cond_6

    .line 78
    .line 79
    return v1

    .line 80
    :cond_6
    return v0
.end method

.method private isVisible(I)Z
    .locals 0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getLeftmostVisiblePageForIndex(I)I

    move-result p1

    iget p0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private isWorkspaceCanScrollRightToMiBoardRtl()Z
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->s:Z

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    const-string p0, "com.zte.mifavor.globalzboard"

    .line 39
    .line 40
    sget-object v0, Lcom/android/launcher3/r4;->A0:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_0

    .line 47
    .line 48
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->J0()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_1

    .line 57
    .line 58
    :cond_0
    const/4 p0, 0x1

    .line 59
    return p0

    .line 60
    :cond_1
    const/4 p0, 0x0

    .line 61
    return p0
.end method

.method private isWorkspaceCircleScroll()Z
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->t:Z

    .line 35
    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method private synthetic lambda$addFocusables$3(Ljava/util/ArrayList;IILjava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance p0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string p1, "addFocusables pageIndex: "

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "PagedView"

    .line 29
    .line 30
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    invoke-virtual {p0, p4}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private synthetic lambda$forEachVisiblePage$1(Ljava/util/function/Consumer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p0, p2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic lambda$onTouchEvent$4(II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/V4;->snapToPageWithVelocity(II)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onTouchEvent$5(II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/V4;->snapToPageWithVelocity(II)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onViewRemoved$2()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 8
    .line 9
    iput v0, p0, Lcom/android/launcher3/V4;->mCurrentScrollOverPage:I

    .line 10
    .line 11
    return-void
.end method

.method private needCrossDraw(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget p0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    return v0
.end method

.method private onSecondaryPointerUp(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 10
    .line 11
    if-ne v1, v2, :cond_2

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 19
    .line 20
    invoke-interface {v1, p1, v0}, Lcom/android/launcher3/touch/G;->getPrimaryDirection(Landroid/view/MotionEvent;I)F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, p0, Lcom/android/launcher3/V4;->mDownMotionPrimary:F

    .line 25
    .line 26
    float-to-int v1, v1

    .line 27
    int-to-float v1, v1

    .line 28
    iput v1, p0, Lcom/android/launcher3/V4;->mLastMotion:F

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iput v1, p0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/launcher3/V4;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->clear()V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 44
    .line 45
    invoke-interface {v1, p1, v0}, Lcom/android/launcher3/touch/G;->getSecondaryDirection(Landroid/view/MotionEvent;I)F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iput p1, p0, Lcom/android/launcher3/V4;->mDownMotionSecondary:F

    .line 50
    .line 51
    :cond_2
    return-void
.end method

.method private releaseVelocityTracker()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/V4;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/V4;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private scrollEdgeGlowOnMovedStart(FLandroid/view/MotionEvent;I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->ifScrollDisabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 10
    .line 11
    if-eqz v0, :cond_7

    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    if-eq p3, v0, :cond_7

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-lez v0, :cond_7

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-gtz v0, :cond_1

    .line 27
    .line 28
    goto/16 :goto_1

    .line 29
    .line 30
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mAllowOverScroll:Z

    .line 31
    .line 32
    if-eqz v0, :cond_7

    .line 33
    .line 34
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mFreeScrollMFV:Z

    .line 35
    .line 36
    if-nez v0, :cond_7

    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 39
    .line 40
    invoke-interface {v0, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    int-to-float v0, v0

    .line 45
    add-float/2addr v0, p1

    .line 46
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-interface {v1, v2, v3}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iget-object v2, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 61
    .line 62
    invoke-virtual {p2, p3}, Landroid/view/MotionEvent;->getX(I)F

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-virtual {p2, p3}, Landroid/view/MotionEvent;->getY(I)F

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    invoke-interface {v2, v3, p2}, Lcom/android/launcher3/touch/G;->getSecondaryValue(FF)F

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    iget-object p3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    invoke-interface {p3, v2, v3}, Lcom/android/launcher3/touch/G;->getSecondaryValue(II)I

    .line 85
    .line 86
    .line 87
    move-result p3

    .line 88
    int-to-float p3, p3

    .line 89
    div-float/2addr p2, p3

    .line 90
    iget p3, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 91
    .line 92
    int-to-float p3, p3

    .line 93
    cmpg-float p3, v0, p3

    .line 94
    .line 95
    if-gez p3, :cond_3

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    if-eqz p3, :cond_2

    .line 102
    .line 103
    iget-boolean p3, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 104
    .line 105
    if-nez p3, :cond_2

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isWorkspaceCanScrollToMiBoard()Z

    .line 108
    .line 109
    .line 110
    move-result p3

    .line 111
    if-eqz p3, :cond_3

    .line 112
    .line 113
    :cond_2
    iget-object p3, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 114
    .line 115
    neg-float p1, p1

    .line 116
    int-to-float v0, v1

    .line 117
    div-float/2addr p1, v0

    .line 118
    const/high16 v0, 0x3f800000    # 1.0f

    .line 119
    .line 120
    sub-float/2addr v0, p2

    .line 121
    invoke-virtual {p3, p1, v0}, Landroid/widget/EdgeEffect;->onPullDistance(FF)F

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 125
    .line 126
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-nez p1, :cond_5

    .line 131
    .line 132
    iget-object p1, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 133
    .line 134
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_3
    iget p3, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 139
    .line 140
    int-to-float p3, p3

    .line 141
    cmpl-float p3, v0, p3

    .line 142
    .line 143
    if-lez p3, :cond_5

    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 146
    .line 147
    .line 148
    move-result p3

    .line 149
    if-eqz p3, :cond_4

    .line 150
    .line 151
    iget-boolean p3, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 152
    .line 153
    if-nez p3, :cond_4

    .line 154
    .line 155
    invoke-direct {p0}, Lcom/android/launcher3/V4;->isWorkspaceCircleScroll()Z

    .line 156
    .line 157
    .line 158
    move-result p3

    .line 159
    if-nez p3, :cond_4

    .line 160
    .line 161
    invoke-direct {p0}, Lcom/android/launcher3/V4;->isWorkspaceCanScrollRightToMiBoardRtl()Z

    .line 162
    .line 163
    .line 164
    move-result p3

    .line 165
    if-eqz p3, :cond_5

    .line 166
    .line 167
    :cond_4
    iget-object p3, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 168
    .line 169
    int-to-float v0, v1

    .line 170
    div-float/2addr p1, v0

    .line 171
    invoke-virtual {p3, p1, p2}, Landroid/widget/EdgeEffect;->onPullDistance(FF)F

    .line 172
    .line 173
    .line 174
    iget-object p1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 175
    .line 176
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-nez p1, :cond_5

    .line 181
    .line 182
    iget-object p1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 183
    .line 184
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 185
    .line 186
    .line 187
    :cond_5
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 188
    .line 189
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-eqz p1, :cond_6

    .line 194
    .line 195
    iget-object p1, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 196
    .line 197
    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    if-nez p1, :cond_7

    .line 202
    .line 203
    :cond_6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->postInvalidateOnAnimation()V

    .line 204
    .line 205
    .line 206
    :cond_7
    :goto_1
    return-void
.end method

.method private setOriginValue(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mOriginValuePoint:Landroid/graphics/Point;

    .line 2
    .line 3
    iput p1, p0, Landroid/graphics/Point;->x:I

    .line 4
    .line 5
    iput p2, p0, Landroid/graphics/Point;->y:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic t(Lcom/android/launcher3/V4;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/V4;->lambda$onTouchEvent$5(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Lcom/android/launcher3/V4;Ljava/util/ArrayList;IILjava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/V4;->lambda$addFocusables$3(Ljava/util/ArrayList;IILjava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private updateHomeScreenEditor()V
    .locals 3

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/V4;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-boolean v2, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->transformPageNum(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    :cond_0
    invoke-virtual {v0, v1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->o(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method private updateVelocityValues()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->useMFVScrollParameter()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const v1, 0x7f070321

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, p0, Lcom/android/launcher3/V4;->mFlingThresholdVelocity:I

    .line 16
    .line 17
    const v1, 0x7f070320

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, p0, Lcom/android/launcher3/V4;->mOriginalFlingThresholdVelocity:I

    .line 25
    .line 26
    const v1, 0x7f0702f1

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput v1, p0, Lcom/android/launcher3/V4;->mEasyFlingThresholdVelocity:I

    .line 34
    .line 35
    const v1, 0x7f070826

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iput v1, p0, Lcom/android/launcher3/V4;->mMinFlingVelocity:I

    .line 43
    .line 44
    const v1, 0x7f07082a

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iput v1, p0, Lcom/android/launcher3/V4;->mMinSnapVelocity:I

    .line 52
    .line 53
    const v1, 0x7f0c0053

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iput v1, p0, Lcom/android/launcher3/V4;->mPageSnapAnimationDuration:I

    .line 61
    .line 62
    invoke-static {}, Lx1/O;->O1()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_0

    .line 67
    .line 68
    const v1, 0x7f070322

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    iput v1, p0, Lcom/android/launcher3/V4;->mFlingThresholdVelocity:I

    .line 76
    .line 77
    const v1, 0x7f070827

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    iput v1, p0, Lcom/android/launcher3/V4;->mMinFlingVelocity:I

    .line 85
    .line 86
    const v1, 0x7f0c0054

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    iput v1, p0, Lcom/android/launcher3/V4;->mPageSnapAnimationDuration:I

    .line 94
    .line 95
    :cond_0
    invoke-static {}, Lx1/O;->j3()Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_1

    .line 100
    .line 101
    const v1, 0x7f070323

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    iput v1, p0, Lcom/android/launcher3/V4;->mFlingThresholdVelocity:I

    .line 109
    .line 110
    const v1, 0x7f0c0055

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    iput v0, p0, Lcom/android/launcher3/V4;->mPageSnapAnimationDuration:I

    .line 118
    .line 119
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->onVelocityValuesUpdated()V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method private verifyPageAlpha()V
    .locals 3

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/app/Activity;->isInMultiWindowMode()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getAlpha()F

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/high16 v2, 0x3f800000    # 1.0f

    .line 43
    .line 44
    cmpg-float v1, v1, v2

    .line 45
    .line 46
    if-gez v1, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getAlpha()F

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    cmpg-float p0, p0, v2

    .line 57
    .line 58
    if-gez p0, :cond_1

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method private verifyPageIndex(F)I
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz p0, :cond_3

    .line 13
    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    int-to-float p0, v0

    .line 17
    sub-float/2addr p0, p1

    .line 18
    int-to-float v3, v1

    .line 19
    sub-float v3, p0, v3

    .line 20
    .line 21
    cmpg-float v4, v3, v2

    .line 22
    .line 23
    if-gez v4, :cond_1

    .line 24
    .line 25
    add-int/lit8 v1, v1, -0x1

    .line 26
    .line 27
    cmpg-float p0, p0, v2

    .line 28
    .line 29
    if-gez p0, :cond_0

    .line 30
    .line 31
    return v0

    .line 32
    :cond_0
    return v1

    .line 33
    :cond_1
    cmpl-float p0, v3, v2

    .line 34
    .line 35
    if-lez p0, :cond_5

    .line 36
    .line 37
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    cmpg-float p0, p1, v2

    .line 40
    .line 41
    if-gez p0, :cond_2

    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return p0

    .line 45
    :cond_2
    return v1

    .line 46
    :cond_3
    int-to-float p0, v1

    .line 47
    sub-float p0, p1, p0

    .line 48
    .line 49
    cmpl-float v3, p0, v2

    .line 50
    .line 51
    if-lez v3, :cond_4

    .line 52
    .line 53
    add-int/lit8 v1, v1, 0x1

    .line 54
    .line 55
    rem-int/2addr v1, v0

    .line 56
    return v1

    .line 57
    :cond_4
    cmpg-float p0, p0, v2

    .line 58
    .line 59
    if-gez p0, :cond_5

    .line 60
    .line 61
    add-int/lit8 v1, v1, -0x1

    .line 62
    .line 63
    cmpg-float p0, p1, v2

    .line 64
    .line 65
    if-gez p0, :cond_5

    .line 66
    .line 67
    add-int/lit8 v0, v0, -0x1

    .line 68
    .line 69
    return v0

    .line 70
    :cond_5
    return v1
.end method

.method private verifyScrollToParameters(IIZZI)Landroid/graphics/Point;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p3, :cond_2

    .line 4
    .line 5
    iget-boolean p3, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 6
    .line 7
    if-eqz p3, :cond_1

    .line 8
    .line 9
    iget p3, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 10
    .line 11
    sub-int p3, p5, p3

    .line 12
    .line 13
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 18
    .line 19
    .line 20
    move-result p4

    .line 21
    if-le p3, p4, :cond_0

    .line 22
    .line 23
    iget p1, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 24
    .line 25
    sub-int/2addr p5, p1

    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    :goto_0
    sub-int p1, p5, p1

    .line 31
    .line 32
    :cond_0
    :goto_1
    move p3, p1

    .line 33
    goto/16 :goto_6

    .line 34
    .line 35
    :cond_1
    iget p3, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 36
    .line 37
    sub-int p3, p5, p3

    .line 38
    .line 39
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    if-le p3, p4, :cond_0

    .line 48
    .line 49
    iget p1, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    :goto_2
    add-int/2addr p5, p3

    .line 56
    add-int/2addr p1, p5

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    if-eqz p4, :cond_4

    .line 59
    .line 60
    iget-boolean p3, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 61
    .line 62
    if-eqz p3, :cond_3

    .line 63
    .line 64
    iget p3, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 65
    .line 66
    sub-int p3, p5, p3

    .line 67
    .line 68
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 73
    .line 74
    .line 75
    move-result p4

    .line 76
    if-le p3, p4, :cond_0

    .line 77
    .line 78
    iget p1, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    goto :goto_2

    .line 85
    :cond_3
    iget p3, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 86
    .line 87
    sub-int p3, p5, p3

    .line 88
    .line 89
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 94
    .line 95
    .line 96
    move-result p4

    .line 97
    if-le p3, p4, :cond_0

    .line 98
    .line 99
    iget p1, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 100
    .line 101
    sub-int/2addr p5, p1

    .line 102
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    goto :goto_0

    .line 107
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 108
    .line 109
    .line 110
    move-result p3

    .line 111
    sub-int p3, p1, p3

    .line 112
    .line 113
    if-gez p3, :cond_5

    .line 114
    .line 115
    move p3, v1

    .line 116
    goto :goto_3

    .line 117
    :cond_5
    move p3, v0

    .line 118
    :goto_3
    iget-boolean p4, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 119
    .line 120
    if-eqz p4, :cond_9

    .line 121
    .line 122
    if-nez p3, :cond_6

    .line 123
    .line 124
    iget p4, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 125
    .line 126
    if-nez p4, :cond_6

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 129
    .line 130
    .line 131
    move-result p4

    .line 132
    add-int/2addr p4, p1

    .line 133
    goto :goto_4

    .line 134
    :cond_6
    move p4, p1

    .line 135
    :goto_4
    if-eqz p3, :cond_8

    .line 136
    .line 137
    iget-boolean p3, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 138
    .line 139
    if-nez p3, :cond_7

    .line 140
    .line 141
    iget p3, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 144
    .line 145
    .line 146
    move-result p5

    .line 147
    sub-int/2addr p5, v1

    .line 148
    if-eq p3, p5, :cond_8

    .line 149
    .line 150
    :cond_7
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 151
    .line 152
    .line 153
    move-result p3

    .line 154
    :goto_5
    add-int/2addr p3, p1

    .line 155
    move v3, p3

    .line 156
    move p3, p1

    .line 157
    move p1, v3

    .line 158
    goto :goto_6

    .line 159
    :cond_8
    move p3, p1

    .line 160
    move p1, p4

    .line 161
    goto :goto_6

    .line 162
    :cond_9
    if-eqz p3, :cond_0

    .line 163
    .line 164
    iget-boolean p3, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 165
    .line 166
    if-nez p3, :cond_a

    .line 167
    .line 168
    iget p3, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 169
    .line 170
    if-eqz p3, :cond_0

    .line 171
    .line 172
    :cond_a
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 173
    .line 174
    .line 175
    move-result p3

    .line 176
    goto :goto_5

    .line 177
    :goto_6
    iget-object p4, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 178
    .line 179
    instance-of p4, p4, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;

    .line 180
    .line 181
    if-eqz p4, :cond_c

    .line 182
    .line 183
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 184
    .line 185
    .line 186
    move-result p4

    .line 187
    div-int p4, p1, p4

    .line 188
    .line 189
    new-instance p5, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .line 193
    .line 194
    const-string v2, "interruptScroll: verifyScrollToParameters x="

    .line 195
    .line 196
    invoke-virtual {p5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string v2, ", scrollX="

    .line 203
    .line 204
    invoke-virtual {p5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string p1, ", mCurrentPage="

    .line 211
    .line 212
    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    iget p1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 216
    .line 217
    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    const-string p1, ", scrollPos="

    .line 221
    .line 222
    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p5, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    const-string p5, "PagedView"

    .line 233
    .line 234
    invoke-static {p5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    .line 236
    .line 237
    iget-boolean p1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 238
    .line 239
    if-eqz p1, :cond_b

    .line 240
    .line 241
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    sub-int/2addr p1, p4

    .line 246
    sub-int/2addr p1, v1

    .line 247
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 248
    .line 249
    .line 250
    move-result p4

    .line 251
    sub-int/2addr p4, v1

    .line 252
    invoke-static {p1, v0, p4}, Lcom/android/launcher3/N5;->c(III)I

    .line 253
    .line 254
    .line 255
    move-result p1

    .line 256
    iput p1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 257
    .line 258
    goto :goto_7

    .line 259
    :cond_b
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 260
    .line 261
    .line 262
    move-result p1

    .line 263
    sub-int/2addr p1, v1

    .line 264
    invoke-static {p4, v0, p1}, Lcom/android/launcher3/N5;->c(III)I

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    iput p1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 269
    .line 270
    :goto_7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 271
    .line 272
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 273
    .line 274
    .line 275
    const-string p4, "interruptScroll: verifyScrollToParameters mCurrentPage="

    .line 276
    .line 277
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    iget p0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 281
    .line 282
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    invoke-static {p5, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    .line 291
    .line 292
    :cond_c
    new-instance p0, Landroid/graphics/Point;

    .line 293
    .line 294
    invoke-direct {p0, p3, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 295
    .line 296
    .line 297
    return-object p0
.end method

.method public static synthetic w(Lcom/android/launcher3/V4;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/V4;->lambda$onTouchEvent$4(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abortScrollerAnimation()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->finish()V

    .line 2
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->finish()V

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->abortScrollerAnimation(Z)V

    return-void
.end method

.method public abortScrollerAnimation(Z)V
    .locals 1

    .line 4
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->doAfterAbortScrollerAnimation(Z)V

    return-void
.end method

.method public addFocusables(Ljava/util/ArrayList;II)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;II)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDescendantFocusability()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x60000

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-direct {p0, v0}, Lcom/android/launcher3/V4;->getPageIndices(I)Lcom/android/launcher3/util/z0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-direct {p0, p2}, Lcom/android/launcher3/V4;->getNeighbourPageIndices(I)Lcom/android/launcher3/util/z0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/z0;->addAll(Lcom/android/launcher3/util/z0;)Lcom/android/launcher3/util/z0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Lcom/android/launcher3/N4;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/launcher3/N4;-><init>(Lcom/android/launcher3/V4;Ljava/util/ArrayList;II)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method protected announcePageForAccessibility()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->isAccessibilityEnabled(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPageDescription()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method protected canAnnouncePageDescription()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected canScroll(FF)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method protected cancelCurrentPageLongPress()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/Q4;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/Q4;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->forEachVisiblePage(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/V4;->cancelHotseatLongPress()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method protected computeMaxScroll()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_1

    .line 7
    .line 8
    iget-boolean v2, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    add-int/lit8 v1, v0, -0x1

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_1
    return v1
.end method

.method protected computeMinScroll()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public computeScroll()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->computeScrollHelper()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected computeScrollHelper()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_6

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 11
    .line 12
    invoke-interface {v0, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/widget/OverScroller;->getCurrX()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eq v0, v2, :cond_0

    .line 23
    .line 24
    iget-object v3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 25
    .line 26
    sget-object v4, Lcom/android/launcher3/touch/G;->c:Lcom/android/launcher3/touch/G$c;

    .line 27
    .line 28
    iget-object v5, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 29
    .line 30
    invoke-virtual {v5}, Landroid/widget/OverScroller;->getCurrX()I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    invoke-interface {v3, p0, v4, v5}, Lcom/android/launcher3/touch/G;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-boolean v3, p0, Lcom/android/launcher3/V4;->mAllowOverScroll:Z

    .line 38
    .line 39
    if-eqz v3, :cond_3

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isInWorkSpace()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isCircle()Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-nez v3, :cond_3

    .line 52
    .line 53
    :cond_1
    iget v3, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 54
    .line 55
    if-ge v2, v3, :cond_2

    .line 56
    .line 57
    if-lt v0, v3, :cond_2

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 60
    .line 61
    iget-object v3, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 62
    .line 63
    invoke-virtual {v3}, Landroid/widget/OverScroller;->getCurrVelocity()F

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    float-to-int v3, v3

    .line 68
    invoke-virtual {v0, v3}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->abortScrollerAnimation(Z)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->onEdgeAbsorbingScroll()V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget v3, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 79
    .line 80
    if-le v2, v3, :cond_3

    .line 81
    .line 82
    if-gt v0, v3, :cond_3

    .line 83
    .line 84
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 85
    .line 86
    iget-object v3, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 87
    .line 88
    invoke-virtual {v3}, Landroid/widget/OverScroller;->getCurrVelocity()F

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    float-to-int v3, v3

    .line 93
    invoke-virtual {v0, v3}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->abortScrollerAnimation(Z)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->onEdgeAbsorbingScroll()V

    .line 100
    .line 101
    .line 102
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getFinalX()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-ne v2, v0, :cond_4

    .line 109
    .line 110
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_4

    .line 117
    .line 118
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 119
    .line 120
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_4

    .line 125
    .line 126
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->abortScrollerAnimation(Z)V

    .line 127
    .line 128
    .line 129
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 130
    .line 131
    if-eqz v0, :cond_5

    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->s()V

    .line 134
    .line 135
    .line 136
    :cond_5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 137
    .line 138
    .line 139
    const/4 p0, 0x1

    .line 140
    return p0

    .line 141
    :cond_6
    iget v0, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 142
    .line 143
    const/4 v2, -0x2

    .line 144
    if-eq v0, v2, :cond_a

    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->sendScrollAccessibilityEvent()V

    .line 147
    .line 148
    .line 149
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 150
    .line 151
    iget-boolean v3, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 152
    .line 153
    if-eqz v3, :cond_7

    .line 154
    .line 155
    iget v3, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 156
    .line 157
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->transformPageNum(I)I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    iput v3, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_7
    iget v3, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 165
    .line 166
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    iput v3, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 171
    .line 172
    :goto_1
    iget v3, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 173
    .line 174
    iput v3, p0, Lcom/android/launcher3/V4;->mCurrentScrollOverPage:I

    .line 175
    .line 176
    instance-of v4, p0, Lcom/android/quickstep/views/RecentsView;

    .line 177
    .line 178
    if-nez v4, :cond_8

    .line 179
    .line 180
    iget-object v4, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 181
    .line 182
    sget-object v5, Lcom/android/launcher3/touch/G;->c:Lcom/android/launcher3/touch/G$c;

    .line 183
    .line 184
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    invoke-interface {v4, p0, v5, v3}, Lcom/android/launcher3/touch/G;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V

    .line 189
    .line 190
    .line 191
    :cond_8
    iput v2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 192
    .line 193
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->notifyPageSwitchListener(I)V

    .line 194
    .line 195
    .line 196
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 197
    .line 198
    if-nez v0, :cond_9

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageEndTransition()V

    .line 201
    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_9
    const-string v0, "PagedView"

    .line 205
    .line 206
    const-string v2, "computeScrollHelper: mIsBeingDragged is true."

    .line 207
    .line 208
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    .line 210
    .line 211
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->canAnnouncePageDescription()Z

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-eqz v0, :cond_a

    .line 216
    .line 217
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->announcePageForAccessibility()V

    .line 218
    .line 219
    .line 220
    :cond_a
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mIsSnapToHome:Z

    .line 221
    .line 222
    const/4 v0, -0x1

    .line 223
    iput v0, p0, Lcom/android/launcher3/V4;->mSnapToHomeStartPage:I

    .line 224
    .line 225
    return v1
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mTouchSlopScale:F

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/V4;->determineScrollingStart(Landroid/view/MotionEvent;F)V

    return-void
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;F)V
    .locals 8

    .line 2
    iget v0, p0, Lcom/android/launcher3/V4;->mActivePointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    goto/16 :goto_5

    .line 3
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    invoke-interface {v1, p1, v0}, Lcom/android/launcher3/touch/G;->getPrimaryDirection(Landroid/view/MotionEvent;I)F

    move-result v1

    .line 4
    iget v2, p0, Lcom/android/launcher3/V4;->mLastMotion:F

    sub-float v3, v2, v1

    float-to-int v3, v3

    sub-float v2, v1, v2

    .line 5
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    mul-int/2addr v2, v4

    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    iget v5, p0, Lcom/android/launcher3/V4;->mDownMotionX:F

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    .line 7
    iget v5, p0, Lcom/android/launcher3/V4;->mTouchSlop:I

    int-to-float v6, v5

    cmpg-float v4, v4, v6

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-gtz v4, :cond_1

    instance-of v4, p0, Lcom/android/launcher3/Workspace;

    if-eqz v4, :cond_1

    move v4, v7

    goto :goto_0

    :cond_1
    move v4, v6

    :goto_0
    int-to-float v5, v5

    mul-float/2addr p2, v5

    .line 8
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    if-gt v2, p2, :cond_2

    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    const/16 v2, 0xfe

    if-ne p2, v2, :cond_6

    :cond_2
    if-nez v4, :cond_6

    .line 10
    iput-boolean v7, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    const-wide/16 v4, 0x5dc

    .line 11
    invoke-static {v4, v5}, Lx1/O;->p4(J)Z

    .line 12
    instance-of p2, p0, Lcom/android/quickstep/views/RecentsView;

    const-string v2, "PagedView"

    if-eqz p2, :cond_3

    move-object p2, p0

    check-cast p2, Lcom/android/quickstep/views/RecentsView;

    .line 13
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "determineScrollingStart: mIsBeingDragged is true , state = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    move-result-object p2

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v2, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 14
    :cond_3
    const-string p2, "determineScrollingStart: mIsBeingDragged is true"

    invoke-static {v2, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    :goto_1
    iget p2, p0, Lcom/android/launcher3/V4;->mTotalMotion:F

    iget v2, p0, Lcom/android/launcher3/V4;->mLastMotion:F

    sub-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    add-float/2addr p2, v2

    iput p2, p0, Lcom/android/launcher3/V4;->mTotalMotion:F

    float-to-int p2, v1

    int-to-float p2, p2

    .line 16
    iput p2, p0, Lcom/android/launcher3/V4;->mLastMotion:F

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageBeginTransition()V

    .line 18
    invoke-virtual {p0, v7}, Lcom/android/launcher3/V4;->requestDisallowInterceptTouchEvent(Z)V

    .line 19
    instance-of p2, p0, Lcom/android/launcher3/Workspace;

    if-eqz p2, :cond_6

    .line 20
    iget p2, p0, Lcom/android/launcher3/V4;->mTouchSlop:I

    if-lez v3, :cond_4

    sub-int p2, v3, p2

    goto :goto_2

    :cond_4
    add-int/2addr p2, v3

    :goto_2
    invoke-virtual {p0, p2, v6}, Lcom/android/launcher3/V4;->scrollBy(II)V

    .line 21
    iget p2, p0, Lcom/android/launcher3/V4;->mTouchSlop:I

    if-lez v3, :cond_5

    sub-int/2addr v3, p2

    :goto_3
    int-to-float p2, v3

    goto :goto_4

    :cond_5
    add-int/2addr v3, p2

    goto :goto_3

    :goto_4
    invoke-direct {p0, p2, p1, v0}, Lcom/android/launcher3/V4;->scrollEdgeGlowOnMovedStart(FLandroid/view/MotionEvent;I)V

    :cond_6
    :goto_5
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/V4;->dispatchDrawMFV(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected dispatchDrawHelper(ILandroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDrawingTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    int-to-float v2, v2

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    int-to-float v3, v3

    .line 15
    div-float/2addr v2, v3

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    iget-boolean v4, p0, Lcom/android/launcher3/V4;->mIsSnapToHome:Z

    .line 21
    .line 22
    if-eqz v4, :cond_0

    .line 23
    .line 24
    iget v4, p0, Lcom/android/launcher3/V4;->mSnapToHomeStartPage:I

    .line 25
    .line 26
    const/4 v5, -0x1

    .line 27
    if-eq v4, v5, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v4, v3

    .line 31
    :goto_0
    iget-boolean v5, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 32
    .line 33
    const/4 v6, 0x1

    .line 34
    if-eqz v5, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    sub-int/2addr v5, p1

    .line 41
    add-int/lit8 p1, v5, -0x1

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    sub-int/2addr v5, v3

    .line 48
    add-int/lit8 v3, v5, -0x1

    .line 49
    .line 50
    :cond_1
    int-to-float v5, v3

    .line 51
    sub-float v5, v2, v5

    .line 52
    .line 53
    const/4 v7, 0x0

    .line 54
    cmpg-float v8, v5, v7

    .line 55
    .line 56
    const/4 v9, 0x0

    .line 57
    if-gez v8, :cond_7

    .line 58
    .line 59
    iget v5, p0, Lcom/android/launcher3/V4;->mFinalPage:I

    .line 60
    .line 61
    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    iget-boolean v8, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 66
    .line 67
    if-nez v8, :cond_3

    .line 68
    .line 69
    if-nez v8, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    sub-int/2addr v8, v6

    .line 76
    if-eq p1, v8, :cond_2

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    move v6, v9

    .line 80
    :cond_3
    :goto_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->isScreenValid(I)Z

    .line 81
    .line 82
    .line 83
    move-result v8

    .line 84
    if-eqz v8, :cond_6

    .line 85
    .line 86
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    if-nez v8, :cond_6

    .line 91
    .line 92
    if-eqz v6, :cond_6

    .line 93
    .line 94
    sub-int v6, v3, p1

    .line 95
    .line 96
    add-int/lit8 v8, v6, -0x1

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 99
    .line 100
    .line 101
    move-result v9

    .line 102
    mul-int/2addr v8, v9

    .line 103
    if-le p1, v3, :cond_4

    .line 104
    .line 105
    invoke-direct {p0, v2, v3, p1}, Lcom/android/launcher3/V4;->isScreenInRange(FII)Z

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    if-nez v3, :cond_4

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    mul-int v8, v6, v3

    .line 116
    .line 117
    :cond_4
    iget-object v3, p0, Lcom/android/launcher3/V4;->mDragView:Landroid/view/View;

    .line 118
    .line 119
    if-eq v3, v5, :cond_6

    .line 120
    .line 121
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    if-lt v3, v6, :cond_5

    .line 130
    .line 131
    int-to-float v3, v8

    .line 132
    invoke-virtual {p2, v3, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, p2, v5, v0, v1}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 136
    .line 137
    .line 138
    neg-int v3, v8

    .line 139
    int-to-float v3, v3

    .line 140
    invoke-virtual {p2, v3, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_5
    invoke-virtual {p0, p2, v5, v0, v1}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 145
    .line 146
    .line 147
    :cond_6
    :goto_2
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {p0, v4}, Lcom/android/launcher3/V4;->isScreenValid(I)Z

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    if-eqz v4, :cond_e

    .line 156
    .line 157
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    if-nez v4, :cond_e

    .line 162
    .line 163
    int-to-float p1, p1

    .line 164
    sub-float/2addr v2, p1

    .line 165
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    const v2, 0x3c23d70a    # 0.01f

    .line 170
    .line 171
    .line 172
    cmpl-float p1, p1, v2

    .line 173
    .line 174
    if-lez p1, :cond_e

    .line 175
    .line 176
    iget-object p1, p0, Lcom/android/launcher3/V4;->mDragView:Landroid/view/View;

    .line 177
    .line 178
    if-eq p1, v5, :cond_e

    .line 179
    .line 180
    invoke-virtual {p0, p2, v3, v0, v1}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_7
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object v8

    .line 188
    invoke-virtual {p0, v4}, Lcom/android/launcher3/V4;->isScreenValid(I)Z

    .line 189
    .line 190
    .line 191
    move-result v10

    .line 192
    if-eqz v10, :cond_8

    .line 193
    .line 194
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    .line 195
    .line 196
    .line 197
    move-result v10

    .line 198
    if-nez v10, :cond_8

    .line 199
    .line 200
    iget-object v10, p0, Lcom/android/launcher3/V4;->mDragView:Landroid/view/View;

    .line 201
    .line 202
    if-eq v10, v8, :cond_8

    .line 203
    .line 204
    invoke-virtual {p0, p2, v8, v0, v1}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 205
    .line 206
    .line 207
    :cond_8
    iget v8, p0, Lcom/android/launcher3/V4;->mFinalPage:I

    .line 208
    .line 209
    invoke-virtual {p0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v8

    .line 213
    iget-boolean v10, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 214
    .line 215
    if-nez v10, :cond_9

    .line 216
    .line 217
    if-nez v10, :cond_a

    .line 218
    .line 219
    if-eqz p1, :cond_a

    .line 220
    .line 221
    :cond_9
    iget v10, p0, Lcom/android/launcher3/V4;->mFinalPage:I

    .line 222
    .line 223
    if-eq v10, v4, :cond_a

    .line 224
    .line 225
    goto :goto_3

    .line 226
    :cond_a
    move v6, v9

    .line 227
    :goto_3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->isScreenValid(I)Z

    .line 228
    .line 229
    .line 230
    move-result v4

    .line 231
    if-eqz v4, :cond_e

    .line 232
    .line 233
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    .line 234
    .line 235
    .line 236
    move-result v4

    .line 237
    if-nez v4, :cond_e

    .line 238
    .line 239
    if-eqz v6, :cond_e

    .line 240
    .line 241
    sub-int v4, p1, v3

    .line 242
    .line 243
    add-int/lit8 v6, v4, -0x1

    .line 244
    .line 245
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 246
    .line 247
    .line 248
    move-result v9

    .line 249
    mul-int/2addr v6, v9

    .line 250
    invoke-direct {p0, v2, v3, p1}, Lcom/android/launcher3/V4;->isScreenInRange(FII)Z

    .line 251
    .line 252
    .line 253
    move-result v2

    .line 254
    if-nez v2, :cond_c

    .line 255
    .line 256
    if-lt p1, v3, :cond_b

    .line 257
    .line 258
    cmpl-float v2, v5, v7

    .line 259
    .line 260
    if-nez v2, :cond_c

    .line 261
    .line 262
    if-le p1, v3, :cond_c

    .line 263
    .line 264
    :cond_b
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    mul-int v6, v4, p1

    .line 269
    .line 270
    :cond_c
    iget-object p1, p0, Lcom/android/launcher3/V4;->mDragView:Landroid/view/View;

    .line 271
    .line 272
    if-eq p1, v8, :cond_e

    .line 273
    .line 274
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 279
    .line 280
    .line 281
    move-result v2

    .line 282
    if-lt p1, v2, :cond_d

    .line 283
    .line 284
    neg-int p1, v6

    .line 285
    int-to-float p1, p1

    .line 286
    invoke-virtual {p2, p1, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {p0, p2, v8, v0, v1}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 290
    .line 291
    .line 292
    int-to-float p0, v6

    .line 293
    invoke-virtual {p2, p0, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_d
    invoke-virtual {p0, p2, v8, v0, v1}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 298
    .line 299
    .line 300
    :cond_e
    return-void
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 7

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->dispatchUnhandledMove(Landroid/view/View;I)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 10
    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    const/16 p1, 0x42

    .line 14
    .line 15
    const/16 v1, 0x11

    .line 16
    .line 17
    if-ne p2, v1, :cond_1

    .line 18
    .line 19
    move p2, p1

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    if-ne p2, p1, :cond_2

    .line 22
    .line 23
    move p2, v1

    .line 24
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-direct {p0, p2}, Lcom/android/launcher3/V4;->getNeighbourPageIndices(I)Lcom/android/launcher3/util/z0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Lcom/android/launcher3/util/z0;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/4 v2, -0x1

    .line 37
    const v3, 0x7fffffff

    .line 38
    .line 39
    .line 40
    move v4, v2

    .line 41
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    if-eqz v5, :cond_4

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    check-cast v5, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    sub-int v6, v5, p1

    .line 58
    .line 59
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    if-le v3, v6, :cond_3

    .line 64
    .line 65
    move v4, v5

    .line 66
    move v3, v6

    .line 67
    goto :goto_1

    .line 68
    :cond_4
    if-eq v4, v2, :cond_5

    .line 69
    .line 70
    invoke-virtual {p0, v4}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, v4}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Landroid/view/View;->requestFocus(I)Z

    .line 78
    .line 79
    .line 80
    return v0

    .line 81
    :cond_5
    const/4 p0, 0x0

    .line 82
    return p0
.end method

.method protected distanceInfluenceForSnapDuration(F)F
    .locals 2

    .line 1
    const/high16 p0, 0x3f000000    # 0.5f

    .line 2
    .line 3
    sub-float/2addr p1, p0

    .line 4
    float-to-double p0, p1

    .line 5
    const-wide v0, 0x3fde28c7460698c7L    # 0.4712389167638204

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    mul-double/2addr p0, v0

    .line 11
    double-to-float p0, p0

    .line 12
    float-to-double p0, p0

    .line 13
    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    double-to-float p0, p0

    .line 18
    return p0
.end method

.method protected doAfterAbortScrollerAnimation(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->onScrollerAnimationAborted()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->finish()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->finish()V

    .line 12
    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    const/4 p1, -0x2

    .line 17
    iput p1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageEndTransition()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->drawEdgeEffect(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageEndTransition()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected drawEdgeEffect(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mAllowOverScroll:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_4

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object v2, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 30
    .line 31
    invoke-virtual {v2}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-nez v2, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/high16 v3, -0x3d4c0000    # -90.0f

    .line 42
    .line 43
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->rotate(F)V

    .line 44
    .line 45
    .line 46
    neg-int v3, v1

    .line 47
    int-to-float v3, v3

    .line 48
    iget v4, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    int-to-float v4, v4

    .line 59
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 63
    .line 64
    invoke-virtual {v3, v1, v0}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 68
    .line 69
    invoke-virtual {v3, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/ViewGroup;->postInvalidateOnAnimation()V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 79
    .line 80
    .line 81
    :cond_2
    iget-object v2, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 82
    .line 83
    invoke-virtual {v2}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-nez v2, :cond_4

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    int-to-float v3, v0

    .line 94
    const/4 v4, 0x0

    .line 95
    const/high16 v5, 0x42b40000    # 90.0f

    .line 96
    .line 97
    invoke-virtual {p1, v5, v3, v4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 98
    .line 99
    .line 100
    iget v4, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    neg-int v4, v4

    .line 111
    int-to-float v4, v4

    .line 112
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 113
    .line 114
    .line 115
    iget-object v3, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 116
    .line 117
    invoke-virtual {v3, v1, v0}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 121
    .line 122
    invoke-virtual {v0, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_3

    .line 127
    .line 128
    invoke-virtual {p0}, Landroid/view/ViewGroup;->postInvalidateOnAnimation()V

    .line 129
    .line 130
    .line 131
    :cond_3
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 132
    .line 133
    .line 134
    :cond_4
    return-void
.end method

.method public focusableViewAvailable(Landroid/view/View;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v1, p1

    .line 8
    :goto_0
    if-ne v1, v0, :cond_0

    .line 9
    .line 10
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->focusableViewAvailable(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    if-ne v1, p0, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    instance-of v2, v2, Landroid/view/View;

    .line 22
    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Landroid/view/View;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    :goto_1
    return-void
.end method

.method public forEachVisiblePage(Ljava/util/function/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getVisiblePageIndices()Lcom/android/launcher3/util/z0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/M4;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/M4;-><init>(Lcom/android/launcher3/V4;Ljava/util/function/Consumer;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public forceFinishScroller(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/OverScroller;->forceFinished(Z)V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, -0x2

    .line 10
    iput p1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageEndTransition()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public forceLayout()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsLayoutValid:Z

    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/ViewGroup;->forceLayout()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected freeScrollFling(IIIIIIIIII)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 2
    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move/from16 v5, p5

    .line 8
    .line 9
    move/from16 v6, p6

    .line 10
    .line 11
    move/from16 v7, p7

    .line 12
    .line 13
    move/from16 v8, p8

    .line 14
    .line 15
    move/from16 v9, p9

    .line 16
    .line 17
    move/from16 v10, p10

    .line 18
    .line 19
    invoke-virtual/range {v0 .. v10}, Landroid/widget/OverScroller;->fling(IIIIIIIIII)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/widget/OverScroller;->getFinalX()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getDestinationPage(I)I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput p2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 33
    .line 34
    iget-boolean p3, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 35
    .line 36
    if-eqz p3, :cond_0

    .line 37
    .line 38
    iget p3, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 39
    .line 40
    if-ne p1, p3, :cond_1

    .line 41
    .line 42
    if-lez p2, :cond_1

    .line 43
    .line 44
    add-int/lit8 p2, p2, -0x1

    .line 45
    .line 46
    iput p2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iget p3, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 50
    .line 51
    if-ne p1, p3, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    add-int/lit8 p1, p1, -0x1

    .line 58
    .line 59
    if-ge p2, p1, :cond_1

    .line 60
    .line 61
    iget p1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 62
    .line 63
    add-int/lit8 p1, p1, 0x1

    .line 64
    .line 65
    iput p1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public getAccessibilityClassName()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    const-class p0, Landroid/widget/ScrollView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected getAdjPageForHomePage(II)I
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int v0, p1, v0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    div-int/lit8 v1, v1, 0x2

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    add-int/2addr v2, v1

    .line 18
    sub-int v2, p1, v2

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    iget-boolean v4, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 25
    .line 26
    if-eqz v4, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    sub-int/2addr v4, v1

    .line 33
    if-le p1, v4, :cond_0

    .line 34
    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    sub-int v2, p1, v2

    .line 42
    .line 43
    sub-int/2addr v2, v1

    .line 44
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    sub-int/2addr v4, v1

    .line 49
    if-ge p1, v4, :cond_1

    .line 50
    .line 51
    add-int/lit8 v3, v3, -0x1

    .line 52
    .line 53
    if-ne v0, v3, :cond_1

    .line 54
    .line 55
    add-int v2, p1, v1

    .line 56
    .line 57
    :cond_1
    add-int/lit8 p1, v0, 0x1

    .line 58
    .line 59
    if-gez v2, :cond_2

    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 62
    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    :cond_2
    if-lez v2, :cond_4

    .line 66
    .line 67
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 68
    .line 69
    if-eqz v1, :cond_4

    .line 70
    .line 71
    :cond_3
    add-int/lit8 p1, v0, -0x1

    .line 72
    .line 73
    :cond_4
    if-nez v2, :cond_5

    .line 74
    .line 75
    if-le v0, p2, :cond_5

    .line 76
    .line 77
    add-int/lit8 p1, v0, -0x1

    .line 78
    .line 79
    :cond_5
    if-eq p1, p2, :cond_7

    .line 80
    .line 81
    iget p0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 82
    .line 83
    if-ne p1, p0, :cond_6

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_6
    return p1

    .line 87
    :cond_7
    :goto_0
    const/4 p0, -0x1

    .line 88
    return p0
.end method

.method protected getChildGap(II)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected getChildOffset(I)I
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    if-le p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 17
    .line 18
    invoke-interface {p0, p1}, Lcom/android/launcher3/touch/G;->getChildStart(Landroid/view/View;)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method protected getChildVisibleSize(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/android/launcher3/touch/G;->getMeasuredSize(Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getCurrentPage()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 2
    .line 3
    return p0
.end method

.method protected getCurrentPageDescription()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/lit8 v1, v1, 0x1

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    filled-new-array {v1, p0}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const v1, 0x7f140178

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public getCurrentPageWithVerify()I
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    div-int/2addr v0, v1

    .line 19
    int-to-float v0, v0

    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    mul-float/2addr v0, v1

    .line 23
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/lit8 v1, v1, -0x1

    .line 32
    .line 33
    int-to-float v1, v1

    .line 34
    sub-float v0, v1, v0

    .line 35
    .line 36
    :cond_1
    iget v1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 37
    .line 38
    int-to-float v2, v1

    .line 39
    sub-float v2, v0, v2

    .line 40
    .line 41
    const v3, 0x3f59999a    # 0.85f

    .line 42
    .line 43
    .line 44
    cmpl-float v2, v2, v3

    .line 45
    .line 46
    const/4 v4, -0x2

    .line 47
    if-lez v2, :cond_2

    .line 48
    .line 49
    float-to-double v0, v0

    .line 50
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    :goto_0
    double-to-int v0, v0

    .line 55
    goto :goto_1

    .line 56
    :cond_2
    int-to-float v1, v1

    .line 57
    sub-float/2addr v1, v0

    .line 58
    cmpl-float v1, v1, v3

    .line 59
    .line 60
    if-lez v1, :cond_3

    .line 61
    .line 62
    float-to-double v0, v0

    .line 63
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 64
    .line 65
    .line 66
    move-result-wide v0

    .line 67
    goto :goto_0

    .line 68
    :cond_3
    move v0, v4

    .line 69
    :goto_1
    if-eq v0, v4, :cond_5

    .line 70
    .line 71
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 72
    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->transformPageNum(I)I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    return p0

    .line 80
    :cond_4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    return p0

    .line 85
    :cond_5
    iget p0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 86
    .line 87
    return p0
.end method

.method public getDestinationPage()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    invoke-interface {v0, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getDestinationPage(I)I

    move-result p0

    return p0
.end method

.method protected getDestinationPage(I)I
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/V4;->getPageNearestToCenterOfScreen(I)I

    move-result p0

    return p0
.end method

.method protected getDisplacementFromScreenCenter(I)I
    .locals 1

    .line 4
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    invoke-interface {v0, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getScreenCenter(I)I

    move-result v0

    .line 6
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/V4;->getDisplacementFromScreenCenter(II)I

    move-result p0

    return p0
.end method

.method public getDistanceForScroll(I)I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

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
    if-gez p1, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lt p1, v0, :cond_3

    .line 18
    .line 19
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 20
    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    mul-int/2addr p1, p0

    .line 28
    return p1

    .line 29
    :cond_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-lt p1, v0, :cond_4

    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 36
    .line 37
    if-eqz v0, :cond_5

    .line 38
    .line 39
    :cond_4
    if-gez p1, :cond_6

    .line 40
    .line 41
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 42
    .line 43
    if-eqz v0, :cond_6

    .line 44
    .line 45
    :cond_5
    iget v0, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    sub-int/2addr p1, v1

    .line 52
    add-int/lit8 p1, p1, 0x1

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    mul-int/2addr p1, p0

    .line 59
    add-int/2addr v0, p1

    .line 60
    return v0

    .line 61
    :cond_6
    return v1
.end method

.method protected getDownMotionX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/V4;->mDownMotionX:F

    .line 2
    .line 3
    return p0
.end method

.method protected getDownMotionY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/V4;->mDownMotionY:F

    .line 2
    .line 3
    return p0
.end method

.method public getExpectedHeight()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getExpectedWidth()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getLayoutTransitionOffsetForPage(I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageScrollsInitialized()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/V4;->mPageScrolls:[I

    .line 8
    .line 9
    array-length v0, v0

    .line 10
    if-ge p1, v0, :cond_2

    .line 11
    .line 12
    if-gez p1, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/V4;->mPageScrolls:[I

    .line 33
    .line 34
    aget p0, p0, p1

    .line 35
    .line 36
    add-int/2addr p0, v1

    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    sub-int/2addr p1, p0

    .line 42
    return p1

    .line 43
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public getLeftmostVisiblePageForIndex(I)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    rem-int p0, p1, p0

    .line 6
    .line 7
    sub-int/2addr p1, p0

    .line 8
    return p1
.end method

.method public getMfvPageIndicator()Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorLayout:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getMfvPageIndicatorMarker(I)Lcom/android/launcher3/pageindicators/b;
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    instance-of p1, p0, Lcom/android/launcher3/Workspace;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/r4;->e()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    sget-object p0, Lcom/android/launcher3/pageindicators/b;->l:Lcom/android/launcher3/pageindicators/b;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    sget-object p0, Lcom/android/launcher3/pageindicators/b;->k:Lcom/android/launcher3/pageindicators/b;

    .line 35
    .line 36
    return-object p0
.end method

.method public getNextPage()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget p0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 8
    .line 9
    return p0
.end method

.method public getNormalChildHeight()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getExpectedHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget-object p0, p0, Lcom/android/launcher3/V4;->mInsets:Landroid/graphics/Rect;

    .line 16
    .line 17
    iget v1, p0, Landroid/graphics/Rect;->top:I

    .line 18
    .line 19
    sub-int/2addr v0, v1

    .line 20
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 21
    .line 22
    sub-int/2addr v0, p0

    .line 23
    return v0
.end method

.method public getNormalChildWidth()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getExpectedWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget-object p0, p0, Lcom/android/launcher3/V4;->mInsets:Landroid/graphics/Rect;

    .line 16
    .line 17
    iget v1, p0, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    sub-int/2addr v0, v1

    .line 20
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 21
    .line 22
    sub-int/2addr v0, p0

    .line 23
    return v0
.end method

.method protected getOrientationHandler()Lcom/android/launcher3/touch/G;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOverScrollAmount(FIFII)I
    .locals 5

    .line 1
    int-to-float p0, p4

    .line 2
    cmpl-float v0, p1, p0

    .line 3
    .line 4
    if-ltz v0, :cond_0

    .line 5
    .line 6
    int-to-float v0, p5

    .line 7
    cmpg-float v0, p1, v0

    .line 8
    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    cmpg-float v0, p1, p0

    .line 17
    .line 18
    if-gez v0, :cond_1

    .line 19
    .line 20
    :goto_0
    sub-float p0, p1, p0

    .line 21
    .line 22
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    int-to-float p0, p5

    .line 28
    goto :goto_0

    .line 29
    :goto_1
    int-to-float v1, p2

    .line 30
    div-float/2addr p0, v1

    .line 31
    div-float/2addr p0, p3

    .line 32
    const/high16 v2, 0x3f800000    # 1.0f

    .line 33
    .line 34
    sub-float v3, v2, p0

    .line 35
    .line 36
    mul-float v4, v3, v3

    .line 37
    .line 38
    mul-float/2addr v4, v3

    .line 39
    sub-float v3, v2, v4

    .line 40
    .line 41
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    div-float/2addr p0, v4

    .line 46
    mul-float/2addr p0, v3

    .line 47
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    cmpl-float v3, v3, v2

    .line 52
    .line 53
    if-ltz v3, :cond_2

    .line 54
    .line 55
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    div-float/2addr p0, v3

    .line 60
    :cond_2
    mul-float/2addr p0, v2

    .line 61
    mul-float/2addr p0, v1

    .line 62
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_3

    .line 67
    .line 68
    new-instance p0, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    const-string v1, "getOverScrollAmount Cannot round NaN value. scrollX="

    .line 74
    .line 75
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v1, " pageWidth="

    .line 82
    .line 83
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string p2, " factor="

    .line 90
    .line 91
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string p2, " minScrollX="

    .line 98
    .line 99
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string p2, " maxScrollX="

    .line 106
    .line 107
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const-string p2, "PagedView"

    .line 118
    .line 119
    invoke-static {p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_3
    move p1, p0

    .line 124
    :goto_2
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-gez v0, :cond_4

    .line 129
    .line 130
    sub-int/2addr p4, p0

    .line 131
    return p4

    .line 132
    :cond_4
    add-int/2addr p5, p0

    .line 133
    return p5
.end method

.method public getPageAt(I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getPageCount()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getPageIndicator()Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageNearestToCenterOfScreen()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    invoke-interface {v0, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/launcher3/V4;->getPageNearestToCenterOfScreen(I)I

    move-result p0

    return p0
.end method

.method protected getPageScrolls([IZLcom/android/launcher3/V4$c;)Z
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-boolean v2, v0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    add-int/lit8 v4, v1, -0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v4, 0x0

    .line 15
    :goto_0
    const/4 v5, -0x1

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    move v6, v5

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    move v6, v1

    .line 21
    :goto_1
    if-eqz v2, :cond_2

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_2
    const/4 v5, 0x1

    .line 25
    :goto_2
    iget-object v2, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 26
    .line 27
    iget-object v8, v0, Lcom/android/launcher3/V4;->mInsets:Landroid/graphics/Rect;

    .line 28
    .line 29
    invoke-interface {v2, v0, v8}, Lcom/android/launcher3/touch/G;->getCenterForPage(Landroid/view/View;Landroid/graphics/Rect;)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget-object v8, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 34
    .line 35
    iget-object v9, v0, Lcom/android/launcher3/V4;->mInsets:Landroid/graphics/Rect;

    .line 36
    .line 37
    invoke-interface {v8, v0, v9}, Lcom/android/launcher3/touch/G;->getScrollOffsetStart(Landroid/view/View;Landroid/graphics/Rect;)I

    .line 38
    .line 39
    .line 40
    move-result v8

    .line 41
    iget-object v9, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 42
    .line 43
    iget-object v10, v0, Lcom/android/launcher3/V4;->mInsets:Landroid/graphics/Rect;

    .line 44
    .line 45
    invoke-interface {v9, v0, v10}, Lcom/android/launcher3/touch/G;->getScrollOffsetEnd(Landroid/view/View;Landroid/graphics/Rect;)I

    .line 46
    .line 47
    .line 48
    move-result v9

    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 50
    .line 51
    .line 52
    move-result v10

    .line 53
    move v11, v8

    .line 54
    const/4 v12, 0x0

    .line 55
    :goto_3
    if-eq v4, v6, :cond_a

    .line 56
    .line 57
    invoke-virtual {v0, v4}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v13

    .line 61
    move-object/from16 v14, p3

    .line 62
    .line 63
    invoke-interface {v14, v13}, Lcom/android/launcher3/V4$c;->a(Landroid/view/View;)Z

    .line 64
    .line 65
    .line 66
    move-result v15

    .line 67
    if-eqz v15, :cond_9

    .line 68
    .line 69
    iget-object v15, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 70
    .line 71
    move/from16 v3, p2

    .line 72
    .line 73
    invoke-interface {v15, v13, v11, v2, v3}, Lcom/android/launcher3/touch/G;->getChildBounds(Landroid/view/View;IIZ)Lcom/android/launcher3/touch/G$a;

    .line 74
    .line 75
    .line 76
    move-result-object v13

    .line 77
    new-instance v15, Landroid/graphics/Rect;

    .line 78
    .line 79
    iget v7, v13, Lcom/android/launcher3/touch/G$a;->d:I

    .line 80
    .line 81
    move/from16 v16, v2

    .line 82
    .line 83
    iget v2, v13, Lcom/android/launcher3/touch/G$a;->c:I

    .line 84
    .line 85
    iget v3, v13, Lcom/android/launcher3/touch/G$a;->b:I

    .line 86
    .line 87
    add-int/2addr v3, v7

    .line 88
    invoke-direct {v15, v11, v7, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 89
    .line 90
    .line 91
    iput-object v15, v0, Lcom/android/launcher3/V4;->mLandRect:Landroid/graphics/Rect;

    .line 92
    .line 93
    iget v2, v13, Lcom/android/launcher3/touch/G$a;->a:I

    .line 94
    .line 95
    iget v3, v13, Lcom/android/launcher3/touch/G$a;->c:I

    .line 96
    .line 97
    iget-boolean v7, v0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 98
    .line 99
    if-eqz v7, :cond_3

    .line 100
    .line 101
    sub-int/2addr v3, v9

    .line 102
    goto :goto_4

    .line 103
    :cond_3
    sub-int v3, v11, v8

    .line 104
    .line 105
    :goto_4
    aget v7, p1, v4

    .line 106
    .line 107
    if-eq v7, v3, :cond_5

    .line 108
    .line 109
    const/4 v7, 0x1

    .line 110
    if-le v10, v7, :cond_4

    .line 111
    .line 112
    invoke-virtual {v0, v4}, Lcom/android/launcher3/V4;->getLeftmostVisiblePageForIndex(I)I

    .line 113
    .line 114
    .line 115
    move-result v7

    .line 116
    if-ne v4, v7, :cond_5

    .line 117
    .line 118
    :cond_4
    aput v3, p1, v4

    .line 119
    .line 120
    const/4 v12, 0x1

    .line 121
    :cond_5
    add-int v3, v4, v5

    .line 122
    .line 123
    invoke-virtual {v0, v4, v3}, Lcom/android/launcher3/V4;->getChildGap(II)I

    .line 124
    .line 125
    .line 126
    move-result v7

    .line 127
    add-int/2addr v7, v2

    .line 128
    add-int/2addr v11, v7

    .line 129
    iget-boolean v7, v0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 130
    .line 131
    if-eqz v7, :cond_6

    .line 132
    .line 133
    const/4 v7, 0x0

    .line 134
    goto :goto_5

    .line 135
    :cond_6
    add-int/lit8 v7, v10, -0x1

    .line 136
    .line 137
    :goto_5
    rem-int v13, v4, v10

    .line 138
    .line 139
    if-ne v13, v7, :cond_7

    .line 140
    .line 141
    iget v7, v0, Lcom/android/launcher3/V4;->mPageSpacing:I

    .line 142
    .line 143
    add-int/2addr v11, v7

    .line 144
    const/4 v7, 0x1

    .line 145
    goto :goto_6

    .line 146
    :cond_7
    const/4 v7, 0x0

    .line 147
    :goto_6
    if-eqz v7, :cond_8

    .line 148
    .line 149
    iget v7, v0, Lcom/android/launcher3/V4;->mPageSpacing:I

    .line 150
    .line 151
    goto :goto_7

    .line 152
    :cond_8
    const/4 v7, 0x0

    .line 153
    :goto_7
    add-int/2addr v2, v7

    .line 154
    invoke-virtual {v0, v4, v3}, Lcom/android/launcher3/V4;->getChildGap(II)I

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    add-int/2addr v2, v3

    .line 159
    invoke-virtual {v0, v2}, Lcom/android/launcher3/V4;->setPageWidth(I)V

    .line 160
    .line 161
    .line 162
    goto :goto_8

    .line 163
    :cond_9
    move/from16 v16, v2

    .line 164
    .line 165
    :goto_8
    add-int/2addr v4, v5

    .line 166
    move/from16 v2, v16

    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_a
    const/4 v7, 0x1

    .line 170
    if-le v10, v7, :cond_c

    .line 171
    .line 172
    const/4 v3, 0x0

    .line 173
    :goto_9
    if-ge v3, v1, :cond_c

    .line 174
    .line 175
    invoke-virtual {v0, v3}, Lcom/android/launcher3/V4;->getLeftmostVisiblePageForIndex(I)I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    aget v2, p1, v2

    .line 180
    .line 181
    aget v4, p1, v3

    .line 182
    .line 183
    if-eq v4, v2, :cond_b

    .line 184
    .line 185
    aput v2, p1, v3

    .line 186
    .line 187
    move v12, v7

    .line 188
    :cond_b
    add-int/lit8 v3, v3, 0x1

    .line 189
    .line 190
    goto :goto_9

    .line 191
    :cond_c
    return v12
.end method

.method public getPageSnapAnimationDuration()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/V4;->mPageSnapAnimationDuration:I

    .line 2
    .line 3
    return p0
.end method

.method public getPageSpacing()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/V4;->mPageSpacing:I

    .line 2
    .line 3
    return p0
.end method

.method public getPageWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/V4;->mPageWidth:I

    .line 2
    .line 3
    return p0
.end method

.method protected getPagedOrientationHandler()Lcom/android/launcher3/touch/G;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getPanelCount()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected getScreenCenter(I)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScale(Landroid/view/View;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPivotX()F

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPivotY()F

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-interface {v1, v2, v3}, Lcom/android/launcher3/touch/G;->getPrimaryValue(FF)F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget-object v2, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 22
    .line 23
    invoke-interface {v2, p0}, Lcom/android/launcher3/touch/G;->getMeasuredSize(Landroid/view/View;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    int-to-float p1, p1

    .line 28
    int-to-float p0, p0

    .line 29
    const/high16 v2, 0x40000000    # 2.0f

    .line 30
    .line 31
    div-float/2addr p0, v2

    .line 32
    sub-float/2addr p0, v1

    .line 33
    div-float/2addr p0, v0

    .line 34
    add-float/2addr p1, p0

    .line 35
    add-float/2addr p1, v1

    .line 36
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method public getScrollForPage(I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageScrollsInitialized()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/V4;->mPageScrolls:[I

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    if-ge p1, v1, :cond_1

    .line 11
    .line 12
    if-gez p1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    aget p0, v0, p1

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getDistanceForScroll(I)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method protected getScrollProgress(ILandroid/view/View;I)F
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    move-result v1

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    .line 4
    invoke-virtual {p0, p1, v0, p3, v2}, Lcom/android/launcher3/V4;->getScrollProgress(IIII)I

    move-result p1

    add-int v0, p3, v1

    if-gez p1, :cond_0

    .line 5
    iget-boolean v3, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    if-eqz v3, :cond_1

    :cond_0
    if-lez p1, :cond_2

    iget-boolean v3, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    if-eqz v3, :cond_2

    :cond_1
    sub-int v0, p3, v1

    :cond_2
    if-ltz v0, :cond_4

    add-int/lit8 v2, v2, -0x1

    if-le v0, v2, :cond_3

    goto :goto_0

    .line 6
    :cond_3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    move-result p2

    invoke-virtual {p0, p3}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    move-result p0

    sub-int/2addr p2, p0

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p0

    goto :goto_1

    .line 7
    :cond_4
    :goto_0
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p2

    iget p0, p0, Lcom/android/launcher3/V4;->mPageSpacing:I

    add-int/2addr p2, p0

    mul-int p0, p2, v1

    :goto_1
    int-to-float p1, p1

    int-to-float p0, p0

    const/high16 p2, 0x3f800000    # 1.0f

    mul-float/2addr p0, p2

    div-float/2addr p1, p0

    .line 8
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    move-result p0

    const/high16 p1, -0x40800000    # -1.0f

    .line 9
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method

.method protected getScrollProgress(IIII)I
    .locals 2

    .line 10
    invoke-virtual {p0, p3}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    move-result v0

    add-int/2addr v0, p2

    sub-int v0, p1, v0

    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    if-eqz v1, :cond_3

    .line 12
    invoke-virtual {p0, p4}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    move-result v1

    sub-int/2addr v1, p2

    if-le p1, v1, :cond_1

    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    if-nez v1, :cond_0

    if-nez p3, :cond_1

    goto :goto_0

    :cond_0
    add-int/lit8 v1, p4, -0x1

    if-ne p3, v1, :cond_1

    .line 13
    :goto_0
    invoke-virtual {p0, p4}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    move-result v0

    sub-int v0, p1, v0

    sub-int/2addr v0, p2

    .line 14
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    move-result v1

    sub-int/2addr v1, p2

    if-ge p1, v1, :cond_3

    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    if-nez p0, :cond_2

    add-int/lit8 p4, p4, -0x1

    if-ne p3, p4, :cond_3

    goto :goto_1

    :cond_2
    if-nez p3, :cond_3

    :goto_1
    add-int/2addr p1, p2

    return p1

    :cond_3
    return v0
.end method

.method public getScroller()Landroid/widget/OverScroller;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getSnapAnimationDuration()I
    .locals 1

    .line 1
    invoke-static {}, Lx1/Z;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lx1/O;->j3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const v0, 0x7f0c0053

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    iget p0, p0, Lcom/android/launcher3/V4;->mPageSnapAnimationDuration:I

    .line 26
    .line 27
    return p0
.end method

.method protected getUnboundedScroll()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/V4;->mUnboundedScroll:I

    .line 2
    .line 3
    return p0
.end method

.method public getVisibleChildrenRange()[I
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/4 v1, 0x0

    .line 7
    add-float/2addr v0, v1

    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScaleX()F

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/high16 v3, 0x3f800000    # 1.0f

    .line 13
    .line 14
    cmpg-float v3, v2, v3

    .line 15
    .line 16
    if-gez v3, :cond_0

    .line 17
    .line 18
    cmpl-float v3, v2, v1

    .line 19
    .line 20
    if-lez v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    div-int/lit8 v3, v3, 0x2

    .line 27
    .line 28
    int-to-float v3, v3

    .line 29
    sub-float v1, v3, v1

    .line 30
    .line 31
    div-float/2addr v1, v2

    .line 32
    sub-float v1, v3, v1

    .line 33
    .line 34
    sub-float/2addr v0, v3

    .line 35
    div-float/2addr v0, v2

    .line 36
    add-float/2addr v0, v3

    .line 37
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/4 v3, 0x0

    .line 42
    const/4 v4, -0x1

    .line 43
    move v5, v3

    .line 44
    move v6, v4

    .line 45
    move v7, v6

    .line 46
    :goto_0
    if-ge v5, v2, :cond_3

    .line 47
    .line 48
    invoke-virtual {p0, v5}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v8

    .line 52
    invoke-virtual {v8}, Landroid/view/View;->getLeft()I

    .line 53
    .line 54
    .line 55
    move-result v9

    .line 56
    int-to-float v9, v9

    .line 57
    invoke-virtual {v8}, Landroid/view/View;->getTranslationX()F

    .line 58
    .line 59
    .line 60
    move-result v10

    .line 61
    add-float/2addr v9, v10

    .line 62
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 63
    .line 64
    .line 65
    move-result v10

    .line 66
    int-to-float v10, v10

    .line 67
    sub-float/2addr v9, v10

    .line 68
    cmpg-float v10, v9, v0

    .line 69
    .line 70
    if-gtz v10, :cond_2

    .line 71
    .line 72
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    .line 73
    .line 74
    .line 75
    move-result v8

    .line 76
    int-to-float v8, v8

    .line 77
    add-float/2addr v9, v8

    .line 78
    cmpl-float v8, v9, v1

    .line 79
    .line 80
    if-ltz v8, :cond_2

    .line 81
    .line 82
    if-ne v6, v4, :cond_1

    .line 83
    .line 84
    move v6, v5

    .line 85
    :cond_1
    move v7, v5

    .line 86
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/V4;->mTmpIntPair:[I

    .line 90
    .line 91
    aput v6, p0, v3

    .line 92
    .line 93
    const/4 v0, 0x1

    .line 94
    aput v7, p0, v0

    .line 95
    .line 96
    return-object p0
.end method

.method public getVisiblePageIndices()Lcom/android/launcher3/util/z0;
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/V4;->getPageIndices(I)Lcom/android/launcher3/util/z0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public ifScrollDisabled()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected ifTriggerFlingDrag(ILandroid/view/MotionEvent;F)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public iniMfvPageIndicator(Landroid/view/View;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorLayout:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 10
    .line 11
    const v0, 0x7f0b03c2

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->g(Landroid/view/ViewGroup;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->p()V

    .line 31
    .line 32
    .line 33
    new-instance p1, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    move v1, v0

    .line 39
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-ge v1, v2, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->getMfvPageIndicatorMarker(I)Lcom/android/launcher3/pageindicators/b;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 56
    .line 57
    invoke-virtual {v1, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->e(Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorLayout:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 61
    .line 62
    const v1, 0x7f0b03c3

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorMiboard:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 72
    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    invoke-virtual {p1, p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->g(Landroid/view/ViewGroup;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorMiboard:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q(I)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorMiboard:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 84
    .line 85
    sget-object v1, Lcom/android/launcher3/pageindicators/b;->l:Lcom/android/launcher3/pageindicators/b;

    .line 86
    .line 87
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->f(ILcom/android/launcher3/pageindicators/b;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorMiboard:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 91
    .line 92
    iget-boolean p1, p1, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->y:Z

    .line 93
    .line 94
    if-eqz p1, :cond_2

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isInWorkSpace()Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_1

    .line 101
    .line 102
    move-object p1, p0

    .line 103
    check-cast p1, Lcom/android/launcher3/Workspace;

    .line 104
    .line 105
    iget-object v2, p1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 106
    .line 107
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 112
    .line 113
    invoke-virtual {v2}, Lcom/android/launcher3/r4;->w()Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-eqz v2, :cond_1

    .line 118
    .line 119
    iget-object p1, p1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 120
    .line 121
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {p1, v2}, Lcom/android/launcher3/r4;->C(Landroid/content/Context;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-nez p1, :cond_1

    .line 136
    .line 137
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorMiboard:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->p()V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorMiboard:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 143
    .line 144
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->f(ILcom/android/launcher3/pageindicators/b;)V

    .line 145
    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorMiboard:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 149
    .line 150
    const/4 v2, 0x1

    .line 151
    invoke-virtual {p1, v2, v1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->f(ILcom/android/launcher3/pageindicators/b;)V

    .line 152
    .line 153
    .line 154
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->notifyLongClickTextViewWhenPageIndicatorCountChanged()V

    .line 155
    .line 156
    .line 157
    :cond_3
    instance-of p1, p0, Lcom/android/launcher3/Workspace;

    .line 158
    .line 159
    if-eqz p1, :cond_5

    .line 160
    .line 161
    move-object p1, p0

    .line 162
    check-cast p1, Lcom/android/launcher3/Workspace;

    .line 163
    .line 164
    iget-object p1, p1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 165
    .line 166
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->V2()Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-eqz p1, :cond_4

    .line 171
    .line 172
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorMiboard:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 173
    .line 174
    if-eqz p1, :cond_5

    .line 175
    .line 176
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 177
    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorMiboard:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 181
    .line 182
    if-eqz p1, :cond_5

    .line 183
    .line 184
    const/16 v1, 0x8

    .line 185
    .line 186
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 187
    .line 188
    .line 189
    :cond_5
    :goto_2
    iget-object p0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 190
    .line 191
    if-eqz p0, :cond_6

    .line 192
    .line 193
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 194
    .line 195
    .line 196
    :cond_6
    return-void
.end method

.method public initDownIfNeeded(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    iput v1, p0, Lcom/android/launcher3/V4;->mDownMotionX:F

    .line 11
    .line 12
    iput v2, p0, Lcom/android/launcher3/V4;->mDownMotionY:F

    .line 13
    .line 14
    iput v1, p0, Lcom/android/launcher3/V4;->mLastMotion:F

    .line 15
    .line 16
    iput v1, p0, Lcom/android/launcher3/V4;->mDownMotionPrimary:F

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput v1, p0, Lcom/android/launcher3/V4;->mTotalMotion:F

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 26
    .line 27
    iput v2, p0, Lcom/android/launcher3/V4;->mDownMotionSecondary:F

    .line 28
    .line 29
    return-void
.end method

.method protected initEdgeEffect()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/i0;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/i0;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/util/i0;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/i0;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 22
    .line 23
    return-void
.end method

.method public initParentViews(Landroid/view/View;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-le v0, v1, :cond_1

    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->w()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget v0, p0, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 23
    .line 24
    check-cast p1, Lcom/android/launcher3/pageindicators/d;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    div-int/2addr v0, p0

    .line 35
    invoke-interface {p1, v0}, Lcom/android/launcher3/pageindicators/d;->setMarkersCount(I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->iniMfvPageIndicator(Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method protected interruptScroll()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "interruptScroll!!! isEnableInterruptPageScrollAnimation = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lx1/O;->Q1()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "PagedView"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lx1/O;->Q1()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsInterruptScrollAnimation:Z

    .line 35
    .line 36
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 37
    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    iget v1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iput v1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 47
    .line 48
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->abortScrollerAnimation(Z)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    const/4 v0, 0x0

    .line 53
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->abortScrollerAnimation(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public isCircle()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 2
    .line 3
    return p0
.end method

.method public isClipCanvasWidth()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isEnableEdgeRebound()Z
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-gt p0, v1, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_0
    return v1
.end method

.method public isHandlingTouch()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 2
    .line 3
    return p0
.end method

.method isInWorkSpace()Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    return p0
.end method

.method public isPageInTransition()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mIsPageInTransition:Z

    .line 2
    .line 3
    return p0
.end method

.method protected isPageOrderFlipped()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected isPageScrollsInitialized()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mPageScrolls:[I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    array-length v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-ne v0, p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method protected isScreenValid(I)Z
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ge p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method protected isSignificantMove(FI)Z
    .locals 0

    .line 1
    int-to-float p2, p2

    .line 2
    iget p0, p0, Lcom/android/launcher3/V4;->SIGNIFICANT_MOVE_THRESHOLD_LOCAL:F

    .line 3
    .line 4
    mul-float/2addr p2, p0

    .line 5
    cmpl-float p0, p1, p2

    .line 6
    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public isSnapToCrossScreenAlreadyIn(I)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPageWithVerify()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eq v2, v1, :cond_1

    .line 13
    .line 14
    iget v2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 15
    .line 16
    if-eq v2, p1, :cond_1

    .line 17
    .line 18
    iget-boolean v3, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 19
    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    const/4 v3, -0x2

    .line 23
    if-eq v2, v3, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->transformPageNum(I)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-ne v2, p1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v3, "snapToCrossScreen already in "

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string p1, " cur"

    .line 48
    .line 49
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string p1, "/"

    .line 60
    .line 61
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string p1, "/next"

    .line 68
    .line 69
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget p1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 73
    .line 74
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p1, "/ x"

    .line 78
    .line 79
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string p1, "PagedView"

    .line 94
    .line 95
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    return v1
.end method

.method protected isSpringOverScrollerFinished()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public isValidPageForScroll(Z)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    if-gtz v0, :cond_1

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 12
    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    add-int/lit8 p1, v1, -0x1

    .line 17
    .line 18
    if-lt v0, p1, :cond_1

    .line 19
    .line 20
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 21
    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    if-le v1, p0, :cond_2

    .line 26
    .line 27
    return p0

    .line 28
    :cond_2
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public isVisible(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/launcher3/V4;->isVisible(I)Z

    move-result p0

    return p0
.end method

.method protected isWorkspaceCanScrollToMiBoard()Z
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->s:Z

    .line 35
    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method protected notifyLongClickTextViewWhenPageIndicatorCountChanged()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isInWorkSpace()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    move-object v0, p0

    .line 8
    check-cast v0, Lcom/android/launcher3/Workspace;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getMarkerCount()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v1, v2

    .line 29
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicatorMiboard:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getMarkerCount()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    :cond_1
    add-int/2addr v1, v2

    .line 38
    invoke-virtual {v0, v1}, Lcom/android/launcher3/LongClickTextView;->f(I)V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method

.method protected notifyPageSwitchListener(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->updatePageIndicator()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/V4;->updateHomeScreenEditor()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/V4;->updateVelocityValues()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onDisallowSwipeToMinusOnePage()V
    .locals 0

    .line 1
    return-void
.end method

.method protected onEdgeAbsorbingScroll()V
    .locals 0

    .line 1
    return-void
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    if-eqz v0, :cond_a

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_5

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getMetaState()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    and-int/2addr v0, v1

    .line 25
    const/16 v2, 0x9

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    move v2, v0

    .line 35
    move v0, v3

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    neg-float v0, v0

    .line 42
    const/16 v2, 0xa

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    :goto_0
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    invoke-virtual {p0, v4, v5}, Lcom/android/launcher3/V4;->canScroll(FF)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    const/4 v5, 0x0

    .line 61
    if-nez v4, :cond_2

    .line 62
    .line 63
    return v5

    .line 64
    :cond_2
    cmpl-float v4, v2, v3

    .line 65
    .line 66
    if-nez v4, :cond_3

    .line 67
    .line 68
    cmpl-float v6, v0, v3

    .line 69
    .line 70
    if-eqz v6, :cond_a

    .line 71
    .line 72
    :cond_3
    iget-boolean p1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 73
    .line 74
    if-eqz p1, :cond_6

    .line 75
    .line 76
    cmpg-float p1, v2, v3

    .line 77
    .line 78
    if-ltz p1, :cond_5

    .line 79
    .line 80
    cmpg-float p1, v0, v3

    .line 81
    .line 82
    if-gez p1, :cond_4

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_4
    move p1, v5

    .line 86
    goto :goto_2

    .line 87
    :cond_5
    :goto_1
    move p1, v1

    .line 88
    goto :goto_2

    .line 89
    :cond_6
    if-gtz v4, :cond_5

    .line 90
    .line 91
    cmpl-float p1, v0, v3

    .line 92
    .line 93
    if-lez p1, :cond_4

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :goto_2
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_9

    .line 103
    .line 104
    iget v0, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 105
    .line 106
    const/4 v2, -0x2

    .line 107
    if-eq v0, v2, :cond_7

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_7
    if-eqz p1, :cond_8

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->scrollRight()Z

    .line 113
    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_8
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->scrollLeft()Z

    .line 117
    .line 118
    .line 119
    :goto_3
    return v1

    .line 120
    :cond_9
    :goto_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    const-string v0, "onGenericMotionEvent ACTION_SCROLL cant scroll return, isFinished="

    .line 126
    .line 127
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 131
    .line 132
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v0, " mNextPage="

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget p0, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 145
    .line 146
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    const-string p1, "PagedView"

    .line 154
    .line 155
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    return v5

    .line 159
    :cond_a
    :goto_5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    return p0
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mAllowOverScroll:Z

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-le p0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    :cond_1
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityEvent;->setScrollable(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageOrderFlipped()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-lez v1, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setScrollable(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 22
    .line 23
    invoke-interface {v1, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    sub-int/2addr v4, v5

    .line 40
    if-lt v3, v4, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    sub-int/2addr v4, v5

    .line 55
    if-ne v3, v4, :cond_4

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    sub-int/2addr v3, v4

    .line 66
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eq v1, v3, :cond_4

    .line 71
    .line 72
    :cond_1
    if-eqz v0, :cond_2

    .line 73
    .line 74
    sget-object v3, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_BACKWARD:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    sget-object v3, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_FORWARD:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 78
    .line 79
    :goto_1
    invoke-virtual {p1, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 80
    .line 81
    .line 82
    iget-boolean v3, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 83
    .line 84
    if-eqz v3, :cond_3

    .line 85
    .line 86
    sget-object v3, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_PAGE_LEFT:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_3
    sget-object v3, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_PAGE_RIGHT:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 90
    .line 91
    :goto_2
    invoke-virtual {p1, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 92
    .line 93
    .line 94
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    if-gtz v3, :cond_5

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-nez v3, :cond_8

    .line 105
    .line 106
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-eq v1, v3, :cond_8

    .line 111
    .line 112
    :cond_5
    if-eqz v0, :cond_6

    .line 113
    .line 114
    sget-object v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_FORWARD:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_6
    sget-object v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_BACKWARD:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 118
    .line 119
    :goto_3
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 120
    .line 121
    .line 122
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 123
    .line 124
    if-eqz p0, :cond_7

    .line 125
    .line 126
    sget-object p0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_PAGE_RIGHT:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_7
    sget-object p0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_PAGE_LEFT:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 130
    .line 131
    :goto_4
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 132
    .line 133
    .line 134
    :cond_8
    invoke-virtual {p1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setLongClickable(Z)V

    .line 135
    .line 136
    .line 137
    sget-object p0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_LONG_CLICK:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 138
    .line 139
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->removeAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)Z

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-gtz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/V4;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v2, 0x1

    .line 17
    const/4 v3, 0x2

    .line 18
    if-ne v0, v3, :cond_1

    .line 19
    .line 20
    iget-boolean v4, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 21
    .line 22
    if-eqz v4, :cond_1

    .line 23
    .line 24
    return v2

    .line 25
    :cond_1
    and-int/lit16 v0, v0, 0xff

    .line 26
    .line 27
    if-eqz v0, :cond_5

    .line 28
    .line 29
    if-eq v0, v2, :cond_4

    .line 30
    .line 31
    if-eq v0, v3, :cond_3

    .line 32
    .line 33
    const/4 v1, 0x3

    .line 34
    if-eq v0, v1, :cond_4

    .line 35
    .line 36
    const/4 v1, 0x6

    .line 37
    if-eq v0, v1, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/launcher3/V4;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Lcom/android/launcher3/V4;->releaseVelocityTracker()V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    iget v0, p0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 48
    .line 49
    const/4 v1, -0x1

    .line 50
    if-eq v0, v1, :cond_7

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->determineScrollingStart(Landroid/view/MotionEvent;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->resetTouchState()V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    iput v0, p0, Lcom/android/launcher3/V4;->mDownMotionX:F

    .line 69
    .line 70
    iput v2, p0, Lcom/android/launcher3/V4;->mDownMotionY:F

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 73
    .line 74
    invoke-interface {v0, p1, v1}, Lcom/android/launcher3/touch/G;->getPrimaryDirection(Landroid/view/MotionEvent;I)F

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput v0, p0, Lcom/android/launcher3/V4;->mDownMotionPrimary:F

    .line 79
    .line 80
    float-to-int v0, v0

    .line 81
    int-to-float v0, v0

    .line 82
    iput v0, p0, Lcom/android/launcher3/V4;->mLastMotion:F

    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    iput v0, p0, Lcom/android/launcher3/V4;->mTotalMotion:F

    .line 86
    .line 87
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mAllowEasyFling:Z

    .line 88
    .line 89
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 94
    .line 95
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 96
    .line 97
    invoke-interface {v0, p1, v1}, Lcom/android/launcher3/touch/G;->getSecondaryDirection(Landroid/view/MotionEvent;I)F

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iput v0, p0, Lcom/android/launcher3/V4;->mDownMotionSecondary:F

    .line 102
    .line 103
    iget-object v0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 104
    .line 105
    if-eqz v0, :cond_6

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r()V

    .line 108
    .line 109
    .line 110
    :cond_6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V

    .line 111
    .line 112
    .line 113
    :cond_7
    :goto_0
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 114
    .line 115
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DrawAllocation"
        }
    .end annotation

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/launcher3/V4;->mIsLayoutValid:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iget-object p3, p0, Lcom/android/launcher3/V4;->mPageScrolls:[I

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageScrollsInitialized()Z

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    const/4 p5, 0x0

    .line 15
    if-nez p4, :cond_0

    .line 16
    .line 17
    new-array p3, p2, [I

    .line 18
    .line 19
    move p4, p1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move p4, p5

    .line 22
    :goto_0
    sget-object v0, Lcom/android/launcher3/V4;->SIMPLE_SCROLL_LOGIC:Lcom/android/launcher3/V4$c;

    .line 23
    .line 24
    invoke-virtual {p0, p3, p1, v0}, Lcom/android/launcher3/V4;->getPageScrolls([IZLcom/android/launcher3/V4$c;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    or-int/2addr p1, p4

    .line 29
    iput-object p3, p0, Lcom/android/launcher3/V4;->mPageScrolls:[I

    .line 30
    .line 31
    if-nez p2, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->onPageScrollsInitialized()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    if-eqz p3, :cond_2

    .line 42
    .line 43
    invoke-virtual {p3}, Landroid/animation/LayoutTransition;->isRunning()Z

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    if-eqz p4, :cond_2

    .line 48
    .line 49
    new-instance p4, Lcom/android/launcher3/V4$a;

    .line 50
    .line 51
    invoke-direct {p4, p0}, Lcom/android/launcher3/V4$a;-><init>(Lcom/android/launcher3/V4;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p3, p4}, Landroid/animation/LayoutTransition;->addTransitionListener(Landroid/animation/LayoutTransition$TransitionListener;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->updateMinAndMaxScrollX()V

    .line 59
    .line 60
    .line 61
    :goto_1
    iget-boolean p3, p0, Lcom/android/launcher3/V4;->mFirstLayout:Z

    .line 62
    .line 63
    if-eqz p3, :cond_3

    .line 64
    .line 65
    iget p3, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 66
    .line 67
    if-ltz p3, :cond_3

    .line 68
    .line 69
    if-ge p3, p2, :cond_3

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->updateCurrentPageScroll()V

    .line 72
    .line 73
    .line 74
    iput-boolean p5, p0, Lcom/android/launcher3/V4;->mFirstLayout:Z

    .line 75
    .line 76
    :cond_3
    iget-object p2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 77
    .line 78
    invoke-virtual {p2}, Landroid/widget/OverScroller;->isFinished()Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-eqz p2, :cond_5

    .line 83
    .line 84
    if-eqz p1, :cond_5

    .line 85
    .line 86
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_4

    .line 91
    .line 92
    instance-of p1, p0, Lcom/android/launcher3/Workspace;

    .line 93
    .line 94
    if-nez p1, :cond_4

    .line 95
    .line 96
    new-instance p1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    const-string p2, "PagedView#onLayout() -> if(mScroller.isFinished() && pageScrollChanged) -> getNextPage(): "

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string p2, ", getScrollForPage(getNextPage()): "

    .line 114
    .line 115
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    invoke-virtual {p0, p2}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    const-string p2, "b/246283207"

    .line 134
    .line 135
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 143
    .line 144
    .line 145
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->onPageScrollsInitialized()V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method protected onMeasure(II)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eqz v4, :cond_3

    .line 32
    .line 33
    instance-of v4, p0, Lcom/android/launcher3/Workspace;

    .line 34
    .line 35
    if-eqz v4, :cond_3

    .line 36
    .line 37
    move-object v4, p0

    .line 38
    check-cast v4, Lcom/android/launcher3/Workspace;

    .line 39
    .line 40
    iget-object v5, v4, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 41
    .line 42
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    iget-boolean v5, v5, Lcom/android/launcher3/h0;->N0:Z

    .line 47
    .line 48
    iget-object v6, v4, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 49
    .line 50
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    iget v6, v6, Lcom/android/launcher3/h0;->T0:I

    .line 55
    .line 56
    iget-object v4, v4, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 57
    .line 58
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    iget v4, v4, Lcom/android/launcher3/h0;->U0:I

    .line 63
    .line 64
    if-eqz v5, :cond_1

    .line 65
    .line 66
    if-lt v1, v3, :cond_2

    .line 67
    .line 68
    :cond_1
    if-nez v5, :cond_3

    .line 69
    .line 70
    if-le v1, v3, :cond_3

    .line 71
    .line 72
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v8, "onMeasure cur size not right, isLand="

    .line 78
    .line 79
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v5, " widthSize="

    .line 86
    .line 87
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, " heightSize="

    .line 94
    .line 95
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v1, " widthPx="

    .line 102
    .line 103
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string v1, " heightPx="

    .line 110
    .line 111
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const-string v3, "PagedView"

    .line 122
    .line 123
    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    move v3, v4

    .line 127
    move v1, v6

    .line 128
    :cond_3
    if-eqz v0, :cond_7

    .line 129
    .line 130
    if-nez v2, :cond_4

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_4
    if-lez v1, :cond_6

    .line 134
    .line 135
    if-gtz v3, :cond_5

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_5
    invoke-direct {p0, v1}, Lcom/android/launcher3/V4;->getPageWidthSize(I)I

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    const/high16 p2, 0x40000000    # 2.0f

    .line 143
    .line 144
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    iget-object v0, p0, Lcom/android/launcher3/V4;->mInsets:Landroid/graphics/Rect;

    .line 149
    .line 150
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 151
    .line 152
    sub-int v0, v3, v0

    .line 153
    .line 154
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->measureChildren(II)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0, v1, v3}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_6
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_7
    :goto_1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method protected onNotSnappingToPageInFreeScroll()V
    .locals 0

    .line 1
    return-void
.end method

.method protected onPageBeginTransition()V
    .locals 0

    .line 1
    return-void
.end method

.method protected onPageEndTransition()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/android/launcher3/V4;->mCurrentPageScrollDiff:I

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "TAPL_SCROLL_FINISHED"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendTestProtocolEventToTest(Landroid/content/Context;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/16 v1, 0x8

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendCustomAccessibilityEvent(Landroid/view/View;ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOnPageTransitionEndCallback:Ljava/lang/Runnable;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 30
    .line 31
    .line 32
    iput-object v2, p0, Lcom/android/launcher3/V4;->mOnPageTransitionEndCallback:Ljava/lang/Runnable;

    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method protected onPageScrollsInitialized()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOnPageScrollsInitializedCallbacks:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/Runnable;

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/V4;->mOnPageScrollsInitializedCallbacks:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 8
    .line 9
    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->requestFocus(ILandroid/graphics/Rect;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method protected onScrollChanged(IIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-ltz p1, :cond_1

    .line 15
    .line 16
    iget p2, p0, Lcom/android/launcher3/V4;->mCurrentScrollOverPage:I

    .line 17
    .line 18
    if-eq p1, p2, :cond_1

    .line 19
    .line 20
    iput p1, p0, Lcom/android/launcher3/V4;->mCurrentScrollOverPage:I

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->onScrollOverPageChanged()V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method protected onScrollOverPageChanged()V
    .locals 0

    .line 1
    return-void
.end method

.method protected onScrollerAnimationAborted()V
    .locals 0

    .line 1
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v11, p1

    .line 4
    .line 5
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v12, 0x0

    .line 13
    if-gtz v1, :cond_0

    .line 14
    .line 15
    return v12

    .line 16
    :cond_0
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/V4;->acquireVelocityTrackerAndAddMovement(Landroid/view/MotionEvent;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v11}, Landroid/view/MotionEvent;->getAction()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    and-int/lit16 v1, v1, 0xff

    .line 24
    .line 25
    const-string v2, "PagedView"

    .line 26
    .line 27
    const/4 v3, -0x1

    .line 28
    const/4 v13, 0x0

    .line 29
    const/4 v14, 0x1

    .line 30
    if-eqz v1, :cond_46

    .line 31
    .line 32
    const/4 v4, 0x2

    .line 33
    if-eq v1, v14, :cond_18

    .line 34
    .line 35
    if-eq v1, v4, :cond_6

    .line 36
    .line 37
    const/4 v2, 0x3

    .line 38
    if-eq v1, v2, :cond_4

    .line 39
    .line 40
    const/4 v2, 0x6

    .line 41
    if-eq v1, v2, :cond_3

    .line 42
    .line 43
    const/16 v2, 0xfe

    .line 44
    .line 45
    if-eq v1, v2, :cond_2

    .line 46
    .line 47
    :cond_1
    :goto_0
    move v13, v14

    .line 48
    goto/16 :goto_21

    .line 49
    .line 50
    :cond_2
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/V4;->determineScrollingStart(Landroid/view/MotionEvent;)V

    .line 51
    .line 52
    .line 53
    iput-boolean v14, v0, Lcom/android/launcher3/V4;->mAllowEasyFling:Z

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/V4;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    .line 57
    .line 58
    .line 59
    invoke-direct {v0}, Lcom/android/launcher3/V4;->releaseVelocityTracker()V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    iget-boolean v1, v0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 64
    .line 65
    if-eqz v1, :cond_5

    .line 66
    .line 67
    new-instance v1, Lcom/android/launcher3/T4;

    .line 68
    .line 69
    invoke-direct {v1, v0}, Lcom/android/launcher3/T4;-><init>(Lcom/android/launcher3/V4;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->runOnPageScrollsInitialized(Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    :cond_5
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 76
    .line 77
    invoke-virtual {v1, v11}, Lcom/android/launcher3/util/i0;->c(Landroid/view/MotionEvent;)V

    .line 78
    .line 79
    .line 80
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 81
    .line 82
    invoke-virtual {v1, v11}, Lcom/android/launcher3/util/i0;->c(Landroid/view/MotionEvent;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->resetTouchState()V

    .line 86
    .line 87
    .line 88
    iput-boolean v12, v0, Lcom/android/launcher3/V4;->mDownWithBeingDragged:Z

    .line 89
    .line 90
    iput-boolean v12, v0, Lcom/android/launcher3/V4;->mIsInterruptScrollAnimation:Z

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_6
    iget-boolean v1, v0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 94
    .line 95
    if-eqz v1, :cond_17

    .line 96
    .line 97
    iget v1, v0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 98
    .line 99
    invoke-virtual {v11, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-ne v1, v3, :cond_7

    .line 104
    .line 105
    return v14

    .line 106
    :cond_7
    iget-object v2, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 107
    .line 108
    invoke-interface {v2, v0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    invoke-virtual {v11, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    float-to-int v3, v3

    .line 117
    invoke-virtual {v11, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    float-to-int v1, v1

    .line 122
    iget-object v4, v0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 123
    .line 124
    if-eqz v4, :cond_8

    .line 125
    .line 126
    invoke-virtual {v4}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->s()V

    .line 127
    .line 128
    .line 129
    :cond_8
    iget-object v4, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 130
    .line 131
    invoke-interface {v4, v3, v1}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    iget v5, v0, Lcom/android/launcher3/V4;->mLastMotion:F

    .line 136
    .line 137
    float-to-int v5, v5

    .line 138
    sub-int/2addr v5, v4

    .line 139
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    .line 144
    .line 145
    .line 146
    move-result v7

    .line 147
    iget-object v8, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 148
    .line 149
    invoke-interface {v8, v6, v7}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 150
    .line 151
    .line 152
    move-result v8

    .line 153
    int-to-float v8, v8

    .line 154
    if-eqz v6, :cond_a

    .line 155
    .line 156
    if-nez v7, :cond_9

    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_9
    iget-object v9, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 160
    .line 161
    invoke-interface {v9, v3, v1}, Lcom/android/launcher3/touch/G;->getSecondaryValue(II)I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    int-to-float v1, v1

    .line 166
    iget-object v3, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 167
    .line 168
    invoke-interface {v3, v6, v7}, Lcom/android/launcher3/touch/G;->getSecondaryValue(II)I

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    int-to-float v3, v3

    .line 173
    div-float/2addr v1, v3

    .line 174
    goto :goto_2

    .line 175
    :cond_a
    :goto_1
    move v1, v13

    .line 176
    :goto_2
    iget v3, v0, Lcom/android/launcher3/V4;->mTotalMotion:F

    .line 177
    .line 178
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 179
    .line 180
    .line 181
    move-result v6

    .line 182
    int-to-float v6, v6

    .line 183
    add-float/2addr v3, v6

    .line 184
    iput v3, v0, Lcom/android/launcher3/V4;->mTotalMotion:F

    .line 185
    .line 186
    iget-boolean v3, v0, Lcom/android/launcher3/V4;->mAllowOverScroll:Z

    .line 187
    .line 188
    const/high16 v6, 0x3f800000    # 1.0f

    .line 189
    .line 190
    if-eqz v3, :cond_f

    .line 191
    .line 192
    iget-boolean v3, v0, Lcom/android/launcher3/V4;->mFreeScrollMFV:Z

    .line 193
    .line 194
    if-nez v3, :cond_f

    .line 195
    .line 196
    if-gez v5, :cond_c

    .line 197
    .line 198
    iget-object v3, v0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 199
    .line 200
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->getDistance()F

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    cmpl-float v3, v3, v13

    .line 205
    .line 206
    if-eqz v3, :cond_c

    .line 207
    .line 208
    iget-boolean v3, v0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 209
    .line 210
    if-nez v3, :cond_c

    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    if-eqz v3, :cond_b

    .line 217
    .line 218
    invoke-direct {v0}, Lcom/android/launcher3/V4;->isWorkspaceCircleScroll()Z

    .line 219
    .line 220
    .line 221
    move-result v3

    .line 222
    if-nez v3, :cond_b

    .line 223
    .line 224
    invoke-direct {v0}, Lcom/android/launcher3/V4;->isWorkspaceCanScrollRightToMiBoardRtl()Z

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    if-eqz v3, :cond_c

    .line 229
    .line 230
    :cond_b
    iget-object v3, v0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 231
    .line 232
    int-to-float v7, v5

    .line 233
    div-float/2addr v7, v8

    .line 234
    invoke-virtual {v3, v7, v1, v11}, Lcom/android/launcher3/util/i0;->b(FFLandroid/view/MotionEvent;)F

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    mul-float/2addr v3, v8

    .line 239
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 240
    .line 241
    .line 242
    move-result v12

    .line 243
    goto :goto_3

    .line 244
    :cond_c
    if-lez v5, :cond_e

    .line 245
    .line 246
    iget-object v3, v0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 247
    .line 248
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->getDistance()F

    .line 249
    .line 250
    .line 251
    move-result v3

    .line 252
    cmpl-float v3, v3, v13

    .line 253
    .line 254
    if-eqz v3, :cond_e

    .line 255
    .line 256
    iget-boolean v3, v0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 257
    .line 258
    if-nez v3, :cond_e

    .line 259
    .line 260
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 261
    .line 262
    .line 263
    move-result v3

    .line 264
    if-eqz v3, :cond_d

    .line 265
    .line 266
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->isWorkspaceCanScrollToMiBoard()Z

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    if-eqz v3, :cond_e

    .line 271
    .line 272
    :cond_d
    neg-float v3, v8

    .line 273
    iget-object v7, v0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 274
    .line 275
    neg-int v9, v5

    .line 276
    int-to-float v9, v9

    .line 277
    div-float/2addr v9, v8

    .line 278
    sub-float v10, v6, v1

    .line 279
    .line 280
    invoke-virtual {v7, v9, v10, v11}, Lcom/android/launcher3/util/i0;->b(FFLandroid/view/MotionEvent;)F

    .line 281
    .line 282
    .line 283
    move-result v7

    .line 284
    mul-float/2addr v3, v7

    .line 285
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 286
    .line 287
    .line 288
    move-result v12

    .line 289
    :cond_e
    :goto_3
    sub-int/2addr v5, v12

    .line 290
    :cond_f
    int-to-float v3, v5

    .line 291
    iget-object v5, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 292
    .line 293
    invoke-interface {v5, v0}, Lcom/android/launcher3/touch/G;->getPrimaryScale(Landroid/view/View;)F

    .line 294
    .line 295
    .line 296
    move-result v5

    .line 297
    div-float/2addr v3, v5

    .line 298
    float-to-int v3, v3

    .line 299
    int-to-float v4, v4

    .line 300
    iput v4, v0, Lcom/android/launcher3/V4;->mLastMotion:F

    .line 301
    .line 302
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 303
    .line 304
    .line 305
    move-result v4

    .line 306
    int-to-float v4, v4

    .line 307
    const v5, 0x3a83126f    # 0.001f

    .line 308
    .line 309
    .line 310
    cmpl-float v4, v4, v5

    .line 311
    .line 312
    if-lez v4, :cond_16

    .line 313
    .line 314
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->ifScrollDisabled()Z

    .line 315
    .line 316
    .line 317
    move-result v4

    .line 318
    if-nez v4, :cond_16

    .line 319
    .line 320
    iget-object v4, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 321
    .line 322
    sget-object v5, Lcom/android/launcher3/touch/G;->b:Lcom/android/launcher3/touch/G$c;

    .line 323
    .line 324
    invoke-virtual {v0, v3}, Lcom/android/launcher3/V4;->updateMovedDelta(I)I

    .line 325
    .line 326
    .line 327
    move-result v7

    .line 328
    invoke-interface {v4, v0, v5, v7}, Lcom/android/launcher3/touch/G;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V

    .line 329
    .line 330
    .line 331
    iget-boolean v4, v0, Lcom/android/launcher3/V4;->mAllowOverScroll:Z

    .line 332
    .line 333
    if-eqz v4, :cond_1

    .line 334
    .line 335
    iget-boolean v4, v0, Lcom/android/launcher3/V4;->mFreeScrollMFV:Z

    .line 336
    .line 337
    if-nez v4, :cond_1

    .line 338
    .line 339
    add-int/2addr v2, v3

    .line 340
    int-to-float v2, v2

    .line 341
    iget v4, v0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 342
    .line 343
    int-to-float v4, v4

    .line 344
    cmpg-float v4, v2, v4

    .line 345
    .line 346
    if-gez v4, :cond_11

    .line 347
    .line 348
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 349
    .line 350
    .line 351
    move-result v4

    .line 352
    if-eqz v4, :cond_10

    .line 353
    .line 354
    iget-boolean v4, v0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 355
    .line 356
    if-nez v4, :cond_10

    .line 357
    .line 358
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->isWorkspaceCanScrollToMiBoard()Z

    .line 359
    .line 360
    .line 361
    move-result v4

    .line 362
    if-eqz v4, :cond_11

    .line 363
    .line 364
    :cond_10
    iget-object v2, v0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 365
    .line 366
    neg-int v3, v3

    .line 367
    int-to-float v3, v3

    .line 368
    div-float/2addr v3, v8

    .line 369
    sub-float/2addr v6, v1

    .line 370
    invoke-virtual {v2, v3, v6, v11}, Lcom/android/launcher3/util/i0;->b(FFLandroid/view/MotionEvent;)F

    .line 371
    .line 372
    .line 373
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 374
    .line 375
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    if-nez v1, :cond_14

    .line 380
    .line 381
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 382
    .line 383
    invoke-virtual {v1, v11}, Lcom/android/launcher3/util/i0;->c(Landroid/view/MotionEvent;)V

    .line 384
    .line 385
    .line 386
    goto :goto_4

    .line 387
    :cond_11
    iget v4, v0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 388
    .line 389
    int-to-float v4, v4

    .line 390
    cmpl-float v2, v2, v4

    .line 391
    .line 392
    if-lez v2, :cond_14

    .line 393
    .line 394
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 395
    .line 396
    .line 397
    move-result v2

    .line 398
    if-eqz v2, :cond_13

    .line 399
    .line 400
    iget-boolean v2, v0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 401
    .line 402
    if-nez v2, :cond_13

    .line 403
    .line 404
    invoke-direct {v0}, Lcom/android/launcher3/V4;->isWorkspaceCircleScroll()Z

    .line 405
    .line 406
    .line 407
    move-result v2

    .line 408
    if-nez v2, :cond_13

    .line 409
    .line 410
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->isInWorkSpace()Z

    .line 411
    .line 412
    .line 413
    move-result v2

    .line 414
    if-eqz v2, :cond_12

    .line 415
    .line 416
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 421
    .line 422
    .line 423
    move-result-object v2

    .line 424
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 425
    .line 426
    .line 427
    move-result-object v2

    .line 428
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->t:Z

    .line 429
    .line 430
    if-nez v2, :cond_13

    .line 431
    .line 432
    :cond_12
    invoke-direct {v0}, Lcom/android/launcher3/V4;->isWorkspaceCanScrollRightToMiBoardRtl()Z

    .line 433
    .line 434
    .line 435
    move-result v2

    .line 436
    if-eqz v2, :cond_14

    .line 437
    .line 438
    :cond_13
    iget-object v2, v0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 439
    .line 440
    int-to-float v3, v3

    .line 441
    div-float/2addr v3, v8

    .line 442
    invoke-virtual {v2, v3, v1, v11}, Lcom/android/launcher3/util/i0;->b(FFLandroid/view/MotionEvent;)F

    .line 443
    .line 444
    .line 445
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 446
    .line 447
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 448
    .line 449
    .line 450
    move-result v1

    .line 451
    if-nez v1, :cond_14

    .line 452
    .line 453
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 454
    .line 455
    invoke-virtual {v1, v11}, Lcom/android/launcher3/util/i0;->c(Landroid/view/MotionEvent;)V

    .line 456
    .line 457
    .line 458
    :cond_14
    :goto_4
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 459
    .line 460
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 461
    .line 462
    .line 463
    move-result v1

    .line 464
    if-eqz v1, :cond_15

    .line 465
    .line 466
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 467
    .line 468
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 469
    .line 470
    .line 471
    move-result v1

    .line 472
    if-nez v1, :cond_1

    .line 473
    .line 474
    :cond_15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->postInvalidateOnAnimation()V

    .line 475
    .line 476
    .line 477
    goto/16 :goto_0

    .line 478
    .line 479
    :cond_16
    invoke-virtual {v0}, Landroid/view/ViewGroup;->awakenScrollBars()Z

    .line 480
    .line 481
    .line 482
    goto/16 :goto_0

    .line 483
    .line 484
    :cond_17
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/V4;->determineScrollingStart(Landroid/view/MotionEvent;)V

    .line 485
    .line 486
    .line 487
    goto/16 :goto_0

    .line 488
    .line 489
    :cond_18
    iput-boolean v14, v0, Lcom/android/launcher3/V4;->isFirstFrameWhenUp:Z

    .line 490
    .line 491
    iget-boolean v1, v0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 492
    .line 493
    if-eqz v1, :cond_41

    .line 494
    .line 495
    iget v1, v0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 496
    .line 497
    invoke-virtual {v11, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 498
    .line 499
    .line 500
    move-result v1

    .line 501
    if-ne v1, v3, :cond_19

    .line 502
    .line 503
    return v14

    .line 504
    :cond_19
    iget-object v3, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 505
    .line 506
    invoke-interface {v3, v11, v1}, Lcom/android/launcher3/touch/G;->getPrimaryDirection(Landroid/view/MotionEvent;I)F

    .line 507
    .line 508
    .line 509
    move-result v3

    .line 510
    iget-object v5, v0, Lcom/android/launcher3/V4;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 511
    .line 512
    iget v6, v0, Lcom/android/launcher3/V4;->mMaximumVelocity:I

    .line 513
    .line 514
    int-to-float v6, v6

    .line 515
    const/16 v7, 0x3e8

    .line 516
    .line 517
    invoke-virtual {v5, v7, v6}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 518
    .line 519
    .line 520
    iget-object v6, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 521
    .line 522
    iget v7, v0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 523
    .line 524
    invoke-interface {v6, v5, v7}, Lcom/android/launcher3/touch/G;->getPrimaryVelocity(Landroid/view/VelocityTracker;I)F

    .line 525
    .line 526
    .line 527
    move-result v5

    .line 528
    float-to-int v5, v5

    .line 529
    iget v6, v0, Lcom/android/launcher3/V4;->mDownMotionPrimary:F

    .line 530
    .line 531
    sub-float v6, v3, v6

    .line 532
    .line 533
    iget v7, v0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 534
    .line 535
    invoke-virtual {v0, v7}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 536
    .line 537
    .line 538
    move-result-object v7

    .line 539
    if-nez v7, :cond_1a

    .line 540
    .line 541
    const-string v0, "current page was null. this should not happen."

    .line 542
    .line 543
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 544
    .line 545
    .line 546
    return v14

    .line 547
    :cond_1a
    iget-object v8, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 548
    .line 549
    invoke-interface {v8, v7}, Lcom/android/launcher3/touch/G;->getMeasuredSize(Landroid/view/View;)I

    .line 550
    .line 551
    .line 552
    move-result v7

    .line 553
    int-to-float v7, v7

    .line 554
    iget-object v8, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 555
    .line 556
    invoke-interface {v8, v0}, Lcom/android/launcher3/touch/G;->getPrimaryScale(Landroid/view/View;)F

    .line 557
    .line 558
    .line 559
    move-result v8

    .line 560
    mul-float/2addr v7, v8

    .line 561
    float-to-int v7, v7

    .line 562
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 563
    .line 564
    .line 565
    move-result v8

    .line 566
    invoke-virtual {v0, v8, v7}, Lcom/android/launcher3/V4;->isSignificantMove(FI)Z

    .line 567
    .line 568
    .line 569
    move-result v8

    .line 570
    iget v9, v0, Lcom/android/launcher3/V4;->mTotalMotion:F

    .line 571
    .line 572
    iget v10, v0, Lcom/android/launcher3/V4;->mLastMotion:F

    .line 573
    .line 574
    sub-float/2addr v10, v3

    .line 575
    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    .line 576
    .line 577
    .line 578
    move-result v3

    .line 579
    add-float/2addr v9, v3

    .line 580
    iput v9, v0, Lcom/android/launcher3/V4;->mTotalMotion:F

    .line 581
    .line 582
    invoke-static {}, Lx1/O;->O1()Z

    .line 583
    .line 584
    .line 585
    move-result v3

    .line 586
    if-eqz v3, :cond_1b

    .line 587
    .line 588
    iget-boolean v3, v0, Lcom/android/launcher3/V4;->mAllowEasyFling:Z

    .line 589
    .line 590
    if-nez v3, :cond_1c

    .line 591
    .line 592
    iget v3, v0, Lcom/android/launcher3/V4;->mTotalMotion:F

    .line 593
    .line 594
    iget v9, v0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 595
    .line 596
    int-to-float v9, v9

    .line 597
    const/high16 v10, 0x40400000    # 3.0f

    .line 598
    .line 599
    div-float/2addr v9, v10

    .line 600
    cmpl-float v3, v3, v9

    .line 601
    .line 602
    if-lez v3, :cond_1d

    .line 603
    .line 604
    goto :goto_5

    .line 605
    :cond_1b
    iget-boolean v3, v0, Lcom/android/launcher3/V4;->mAllowEasyFling:Z

    .line 606
    .line 607
    if-nez v3, :cond_1c

    .line 608
    .line 609
    iget v3, v0, Lcom/android/launcher3/V4;->mTotalMotion:F

    .line 610
    .line 611
    iget v9, v0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 612
    .line 613
    int-to-float v9, v9

    .line 614
    cmpl-float v3, v3, v9

    .line 615
    .line 616
    if-lez v3, :cond_1d

    .line 617
    .line 618
    :cond_1c
    :goto_5
    invoke-virtual {v0, v5}, Lcom/android/launcher3/V4;->shouldFlingForVelocity(I)Z

    .line 619
    .line 620
    .line 621
    move-result v3

    .line 622
    if-eqz v3, :cond_1d

    .line 623
    .line 624
    move v3, v14

    .line 625
    goto :goto_6

    .line 626
    :cond_1d
    move v3, v12

    .line 627
    :goto_6
    iget-boolean v9, v0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 628
    .line 629
    if-eqz v9, :cond_1f

    .line 630
    .line 631
    cmpl-float v9, v6, v13

    .line 632
    .line 633
    if-lez v9, :cond_1e

    .line 634
    .line 635
    :goto_7
    move v9, v14

    .line 636
    goto :goto_8

    .line 637
    :cond_1e
    move v9, v12

    .line 638
    goto :goto_8

    .line 639
    :cond_1f
    cmpg-float v9, v6, v13

    .line 640
    .line 641
    if-gez v9, :cond_1e

    .line 642
    .line 643
    goto :goto_7

    .line 644
    :goto_8
    invoke-static {}, Lx1/O;->O1()Z

    .line 645
    .line 646
    .line 647
    move-result v10

    .line 648
    if-eqz v10, :cond_20

    .line 649
    .line 650
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 651
    .line 652
    .line 653
    move-result v10

    .line 654
    iget v15, v0, Lcom/android/launcher3/V4;->mOriginalFlingThresholdVelocity:I

    .line 655
    .line 656
    if-ge v10, v15, :cond_20

    .line 657
    .line 658
    if-eqz v3, :cond_20

    .line 659
    .line 660
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 661
    .line 662
    .line 663
    move-result v10

    .line 664
    iget v15, v0, Lcom/android/launcher3/V4;->mTouchSlop:I

    .line 665
    .line 666
    int-to-float v15, v15

    .line 667
    cmpl-float v10, v10, v15

    .line 668
    .line 669
    if-lez v10, :cond_20

    .line 670
    .line 671
    int-to-float v10, v5

    .line 672
    invoke-static {v10}, Ljava/lang/Math;->signum(F)F

    .line 673
    .line 674
    .line 675
    move-result v10

    .line 676
    invoke-static {v6}, Ljava/lang/Math;->signum(F)F

    .line 677
    .line 678
    .line 679
    move-result v15

    .line 680
    cmpl-float v10, v10, v15

    .line 681
    .line 682
    if-eqz v10, :cond_20

    .line 683
    .line 684
    invoke-static {v6}, Ljava/lang/Math;->signum(F)F

    .line 685
    .line 686
    .line 687
    move-result v10

    .line 688
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 689
    .line 690
    .line 691
    move-result v5

    .line 692
    int-to-float v5, v5

    .line 693
    mul-float/2addr v10, v5

    .line 694
    float-to-int v5, v10

    .line 695
    new-instance v10, Ljava/lang/StringBuilder;

    .line 696
    .line 697
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 698
    .line 699
    .line 700
    const-string v15, "Action_UP: velocity direction replaced by delta direction, new velocity="

    .line 701
    .line 702
    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 703
    .line 704
    .line 705
    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 706
    .line 707
    .line 708
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 709
    .line 710
    .line 711
    move-result-object v10

    .line 712
    invoke-static {v2, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 713
    .line 714
    .line 715
    :cond_20
    move v15, v5

    .line 716
    iget-boolean v2, v0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 717
    .line 718
    if-eqz v2, :cond_22

    .line 719
    .line 720
    if-lez v15, :cond_21

    .line 721
    .line 722
    :goto_9
    move v2, v14

    .line 723
    goto :goto_a

    .line 724
    :cond_21
    move v2, v12

    .line 725
    goto :goto_a

    .line 726
    :cond_22
    if-gez v15, :cond_21

    .line 727
    .line 728
    goto :goto_9

    .line 729
    :goto_a
    instance-of v5, v0, Lcom/android/launcher3/Workspace;

    .line 730
    .line 731
    if-eqz v5, :cond_23

    .line 732
    .line 733
    move-object v5, v0

    .line 734
    check-cast v5, Lcom/android/launcher3/Workspace;

    .line 735
    .line 736
    invoke-virtual {v5}, Lcom/android/launcher3/Workspace;->H1()Z

    .line 737
    .line 738
    .line 739
    move-result v5

    .line 740
    :cond_23
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 741
    .line 742
    .line 743
    move-result v5

    .line 744
    instance-of v10, v0, Lcom/android/quickstep/views/RecentsView;

    .line 745
    .line 746
    if-eqz v10, :cond_25

    .line 747
    .line 748
    move-object/from16 v16, v0

    .line 749
    .line 750
    check-cast v16, Lcom/android/quickstep/views/RecentsView;

    .line 751
    .line 752
    if-nez v3, :cond_25

    .line 753
    .line 754
    if-eqz v8, :cond_25

    .line 755
    .line 756
    invoke-virtual/range {v16 .. v16}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 757
    .line 758
    .line 759
    move-result v5

    .line 760
    if-eqz v5, :cond_24

    .line 761
    .line 762
    goto :goto_b

    .line 763
    :cond_24
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 764
    .line 765
    .line 766
    move-result v4

    .line 767
    :goto_b
    move v5, v4

    .line 768
    move/from16 v17, v13

    .line 769
    .line 770
    goto/16 :goto_10

    .line 771
    .line 772
    :cond_25
    if-eqz v10, :cond_2f

    .line 773
    .line 774
    move-object/from16 v16, v0

    .line 775
    .line 776
    check-cast v16, Lcom/android/quickstep/views/RecentsView;

    .line 777
    .line 778
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 779
    .line 780
    .line 781
    move-result v17

    .line 782
    if-eqz v17, :cond_2f

    .line 783
    .line 784
    if-eqz v3, :cond_2f

    .line 785
    .line 786
    move/from16 v17, v13

    .line 787
    .line 788
    iget-object v13, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 789
    .line 790
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 791
    .line 792
    .line 793
    move-result v12

    .line 794
    move/from16 v18, v14

    .line 795
    .line 796
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 797
    .line 798
    .line 799
    move-result v14

    .line 800
    invoke-interface {v13, v12, v14}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 801
    .line 802
    .line 803
    move-result v12

    .line 804
    if-lez v15, :cond_26

    .line 805
    .line 806
    move/from16 v13, v18

    .line 807
    .line 808
    goto :goto_c

    .line 809
    :cond_26
    const/4 v13, 0x0

    .line 810
    :goto_c
    iget-object v14, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 811
    .line 812
    instance-of v4, v14, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;

    .line 813
    .line 814
    if-nez v4, :cond_27

    .line 815
    .line 816
    instance-of v4, v14, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;

    .line 817
    .line 818
    if-eqz v4, :cond_2a

    .line 819
    .line 820
    :cond_27
    iget v4, v0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 821
    .line 822
    if-le v12, v4, :cond_28

    .line 823
    .line 824
    if-eqz v13, :cond_29

    .line 825
    .line 826
    :cond_28
    iget v4, v0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 827
    .line 828
    if-ge v12, v4, :cond_2a

    .line 829
    .line 830
    if-eqz v13, :cond_2a

    .line 831
    .line 832
    :cond_29
    :goto_d
    move/from16 v4, v18

    .line 833
    .line 834
    goto :goto_e

    .line 835
    :cond_2a
    instance-of v4, v14, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;

    .line 836
    .line 837
    if-eqz v4, :cond_2c

    .line 838
    .line 839
    iget v4, v0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 840
    .line 841
    if-ge v12, v4, :cond_2b

    .line 842
    .line 843
    if-eqz v13, :cond_2b

    .line 844
    .line 845
    iget v4, v0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 846
    .line 847
    if-nez v4, :cond_29

    .line 848
    .line 849
    :cond_2b
    iget v4, v0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 850
    .line 851
    if-le v12, v4, :cond_2c

    .line 852
    .line 853
    if-nez v13, :cond_2c

    .line 854
    .line 855
    iget v4, v0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 856
    .line 857
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 858
    .line 859
    .line 860
    move-result v12

    .line 861
    add-int/lit8 v12, v12, -0x1

    .line 862
    .line 863
    if-eq v4, v12, :cond_2c

    .line 864
    .line 865
    goto :goto_d

    .line 866
    :cond_2c
    const/4 v4, 0x0

    .line 867
    :goto_e
    invoke-virtual/range {v16 .. v16}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 868
    .line 869
    .line 870
    move-result v12

    .line 871
    if-eqz v12, :cond_2d

    .line 872
    .line 873
    invoke-virtual/range {v16 .. v16}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 874
    .line 875
    .line 876
    move-result v12

    .line 877
    const/4 v13, 0x2

    .line 878
    if-ne v12, v13, :cond_2e

    .line 879
    .line 880
    goto :goto_f

    .line 881
    :cond_2d
    invoke-virtual/range {v16 .. v16}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 882
    .line 883
    .line 884
    move-result v12

    .line 885
    move/from16 v13, v18

    .line 886
    .line 887
    if-ne v12, v13, :cond_2e

    .line 888
    .line 889
    :goto_f
    const/4 v14, 0x1

    .line 890
    goto :goto_10

    .line 891
    :cond_2e
    move v14, v4

    .line 892
    goto :goto_10

    .line 893
    :cond_2f
    move/from16 v17, v13

    .line 894
    .line 895
    const/4 v14, 0x0

    .line 896
    :goto_10
    iget-boolean v4, v0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 897
    .line 898
    if-eqz v4, :cond_36

    .line 899
    .line 900
    if-eqz v14, :cond_30

    .line 901
    .line 902
    goto/16 :goto_14

    .line 903
    .line 904
    :cond_30
    iget-object v1, v0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 905
    .line 906
    invoke-virtual {v1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 907
    .line 908
    .line 909
    move-result v1

    .line 910
    if-nez v1, :cond_31

    .line 911
    .line 912
    const/4 v13, 0x1

    .line 913
    invoke-virtual {v0, v13}, Lcom/android/launcher3/V4;->abortScrollerAnimation(Z)V

    .line 914
    .line 915
    .line 916
    :cond_31
    iget-object v1, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 917
    .line 918
    invoke-interface {v1, v0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 919
    .line 920
    .line 921
    move-result v1

    .line 922
    if-eqz v10, :cond_32

    .line 923
    .line 924
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 925
    .line 926
    .line 927
    move-result v4

    .line 928
    if-eqz v4, :cond_32

    .line 929
    .line 930
    invoke-direct {v0}, Lcom/android/launcher3/V4;->getOriginScroll()I

    .line 931
    .line 932
    .line 933
    move-result v1

    .line 934
    :cond_32
    iget v6, v0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 935
    .line 936
    iget v5, v0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 937
    .line 938
    if-lt v1, v6, :cond_33

    .line 939
    .line 940
    if-nez v2, :cond_35

    .line 941
    .line 942
    if-eqz v3, :cond_35

    .line 943
    .line 944
    :cond_33
    if-gt v1, v5, :cond_34

    .line 945
    .line 946
    if-eqz v2, :cond_35

    .line 947
    .line 948
    if-nez v3, :cond_34

    .line 949
    .line 950
    goto :goto_11

    .line 951
    :cond_34
    move v8, v6

    .line 952
    goto :goto_12

    .line 953
    :cond_35
    :goto_11
    iget-object v4, v0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 954
    .line 955
    const/4 v9, 0x0

    .line 956
    const/4 v10, 0x0

    .line 957
    move v8, v6

    .line 958
    const/4 v6, 0x0

    .line 959
    move v7, v5

    .line 960
    move v5, v1

    .line 961
    invoke-virtual/range {v4 .. v10}, Landroid/widget/OverScroller;->springBack(IIIIII)Z

    .line 962
    .line 963
    .line 964
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 965
    .line 966
    .line 967
    move-result v1

    .line 968
    iput v1, v0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 969
    .line 970
    goto :goto_13

    .line 971
    :goto_12
    neg-int v3, v15

    .line 972
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 973
    .line 974
    .line 975
    move-result v2

    .line 976
    int-to-float v2, v2

    .line 977
    const/high16 v4, 0x3f000000    # 0.5f

    .line 978
    .line 979
    mul-float/2addr v2, v4

    .line 980
    const v4, 0x3e99999a    # 0.3f

    .line 981
    .line 982
    .line 983
    mul-float/2addr v2, v4

    .line 984
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 985
    .line 986
    .line 987
    move-result v9

    .line 988
    const/4 v10, 0x0

    .line 989
    const/4 v2, 0x0

    .line 990
    const/4 v4, 0x0

    .line 991
    const/4 v7, 0x0

    .line 992
    move v6, v8

    .line 993
    const/4 v8, 0x0

    .line 994
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/V4;->freeScrollFling(IIIIIIIIII)V

    .line 995
    .line 996
    .line 997
    new-instance v1, Lcom/android/launcher3/U4;

    .line 998
    .line 999
    invoke-direct {v1, v0}, Lcom/android/launcher3/U4;-><init>(Lcom/android/launcher3/V4;)V

    .line 1000
    .line 1001
    .line 1002
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->runOnPageScrollsInitialized(Ljava/lang/Runnable;)V

    .line 1003
    .line 1004
    .line 1005
    :goto_13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->invalidate()V

    .line 1006
    .line 1007
    .line 1008
    goto/16 :goto_1e

    .line 1009
    .line 1010
    :cond_36
    :goto_14
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 1011
    .line 1012
    .line 1013
    move-result v4

    .line 1014
    int-to-float v7, v7

    .line 1015
    const v10, 0x3ea8f5c3    # 0.33f

    .line 1016
    .line 1017
    .line 1018
    mul-float/2addr v7, v10

    .line 1019
    cmpl-float v4, v4, v7

    .line 1020
    .line 1021
    if-lez v4, :cond_37

    .line 1022
    .line 1023
    int-to-float v4, v15

    .line 1024
    invoke-static {v4}, Ljava/lang/Math;->signum(F)F

    .line 1025
    .line 1026
    .line 1027
    move-result v4

    .line 1028
    invoke-static {v6}, Ljava/lang/Math;->signum(F)F

    .line 1029
    .line 1030
    .line 1031
    move-result v7

    .line 1032
    cmpl-float v4, v4, v7

    .line 1033
    .line 1034
    if-eqz v4, :cond_37

    .line 1035
    .line 1036
    if-eqz v3, :cond_37

    .line 1037
    .line 1038
    const/4 v4, 0x1

    .line 1039
    goto :goto_15

    .line 1040
    :cond_37
    const/4 v4, 0x0

    .line 1041
    :goto_15
    invoke-virtual {v0, v1, v11, v6}, Lcom/android/launcher3/V4;->ifTriggerFlingDrag(ILandroid/view/MotionEvent;F)Z

    .line 1042
    .line 1043
    .line 1044
    move-result v1

    .line 1045
    if-eqz v8, :cond_39

    .line 1046
    .line 1047
    if-nez v9, :cond_39

    .line 1048
    .line 1049
    if-eqz v3, :cond_38

    .line 1050
    .line 1051
    goto :goto_17

    .line 1052
    :cond_38
    :goto_16
    const/4 v13, 0x1

    .line 1053
    goto :goto_18

    .line 1054
    :cond_39
    :goto_17
    if-eqz v3, :cond_3b

    .line 1055
    .line 1056
    if-nez v2, :cond_3b

    .line 1057
    .line 1058
    goto :goto_16

    .line 1059
    :goto_18
    invoke-virtual {v0, v13}, Lcom/android/launcher3/V4;->isValidPageForScroll(Z)Z

    .line 1060
    .line 1061
    .line 1062
    move-result v6

    .line 1063
    if-eqz v6, :cond_3b

    .line 1064
    .line 1065
    if-eqz v1, :cond_3b

    .line 1066
    .line 1067
    if-eqz v4, :cond_3a

    .line 1068
    .line 1069
    iget v1, v0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 1070
    .line 1071
    goto :goto_19

    .line 1072
    :cond_3a
    iget v1, v0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 1073
    .line 1074
    sub-int/2addr v1, v5

    .line 1075
    :goto_19
    new-instance v2, Lcom/android/launcher3/R4;

    .line 1076
    .line 1077
    invoke-direct {v2, v0, v1, v15}, Lcom/android/launcher3/R4;-><init>(Lcom/android/launcher3/V4;II)V

    .line 1078
    .line 1079
    .line 1080
    invoke-virtual {v0, v2}, Lcom/android/launcher3/V4;->runOnPageScrollsInitialized(Ljava/lang/Runnable;)V

    .line 1081
    .line 1082
    .line 1083
    goto :goto_1e

    .line 1084
    :cond_3b
    if-eqz v8, :cond_3d

    .line 1085
    .line 1086
    if-eqz v9, :cond_3d

    .line 1087
    .line 1088
    if-eqz v3, :cond_3c

    .line 1089
    .line 1090
    goto :goto_1b

    .line 1091
    :cond_3c
    :goto_1a
    const/4 v2, 0x0

    .line 1092
    goto :goto_1c

    .line 1093
    :cond_3d
    :goto_1b
    if-eqz v3, :cond_3f

    .line 1094
    .line 1095
    if-eqz v2, :cond_3f

    .line 1096
    .line 1097
    goto :goto_1a

    .line 1098
    :goto_1c
    invoke-virtual {v0, v2}, Lcom/android/launcher3/V4;->isValidPageForScroll(Z)Z

    .line 1099
    .line 1100
    .line 1101
    move-result v3

    .line 1102
    if-eqz v3, :cond_3f

    .line 1103
    .line 1104
    if-eqz v1, :cond_3f

    .line 1105
    .line 1106
    if-eqz v4, :cond_3e

    .line 1107
    .line 1108
    iget v1, v0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 1109
    .line 1110
    goto :goto_1d

    .line 1111
    :cond_3e
    iget v1, v0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 1112
    .line 1113
    add-int/2addr v1, v5

    .line 1114
    :goto_1d
    new-instance v2, Lcom/android/launcher3/S4;

    .line 1115
    .line 1116
    invoke-direct {v2, v0, v1, v15}, Lcom/android/launcher3/S4;-><init>(Lcom/android/launcher3/V4;II)V

    .line 1117
    .line 1118
    .line 1119
    invoke-virtual {v0, v2}, Lcom/android/launcher3/V4;->runOnPageScrollsInitialized(Ljava/lang/Runnable;)V

    .line 1120
    .line 1121
    .line 1122
    goto :goto_1e

    .line 1123
    :cond_3f
    new-instance v1, Lcom/android/launcher3/T4;

    .line 1124
    .line 1125
    invoke-direct {v1, v0}, Lcom/android/launcher3/T4;-><init>(Lcom/android/launcher3/V4;)V

    .line 1126
    .line 1127
    .line 1128
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->runOnPageScrollsInitialized(Ljava/lang/Runnable;)V

    .line 1129
    .line 1130
    .line 1131
    :goto_1e
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 1132
    .line 1133
    invoke-virtual {v1, v15}, Lcom/android/launcher3/util/i0;->a(I)V

    .line 1134
    .line 1135
    .line 1136
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 1137
    .line 1138
    invoke-virtual {v1, v15}, Lcom/android/launcher3/util/i0;->a(I)V

    .line 1139
    .line 1140
    .line 1141
    invoke-static {v15}, Ljava/lang/Math;->abs(I)I

    .line 1142
    .line 1143
    .line 1144
    :cond_40
    :goto_1f
    const/4 v2, 0x0

    .line 1145
    goto :goto_20

    .line 1146
    :cond_41
    move/from16 v17, v13

    .line 1147
    .line 1148
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->isInWorkSpace()Z

    .line 1149
    .line 1150
    .line 1151
    move-result v1

    .line 1152
    if-eqz v1, :cond_42

    .line 1153
    .line 1154
    move-object v1, v0

    .line 1155
    check-cast v1, Lcom/android/launcher3/Workspace;

    .line 1156
    .line 1157
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1158
    .line 1159
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 1160
    .line 1161
    .line 1162
    move-result-object v2

    .line 1163
    if-eqz v2, :cond_42

    .line 1164
    .line 1165
    iget-object v1, v1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1166
    .line 1167
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 1168
    .line 1169
    .line 1170
    move-result-object v1

    .line 1171
    invoke-virtual {v1}, Lcom/android/launcher3/LongClickTextView;->c()Z

    .line 1172
    .line 1173
    .line 1174
    move-result v1

    .line 1175
    if-nez v1, :cond_40

    .line 1176
    .line 1177
    :cond_42
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/V4;->onUnhandledTap(Landroid/view/MotionEvent;)V

    .line 1178
    .line 1179
    .line 1180
    goto :goto_1f

    .line 1181
    :goto_20
    iput-boolean v2, v0, Lcom/android/launcher3/V4;->mDownWithBeingDragged:Z

    .line 1182
    .line 1183
    iput-boolean v2, v0, Lcom/android/launcher3/V4;->mIsInterruptScrollAnimation:Z

    .line 1184
    .line 1185
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutDirection()I

    .line 1186
    .line 1187
    .line 1188
    move-result v1

    .line 1189
    iget-object v2, v0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 1190
    .line 1191
    invoke-virtual {v2}, Landroid/widget/EdgeEffect;->getDistance()F

    .line 1192
    .line 1193
    .line 1194
    move-result v2

    .line 1195
    cmpl-float v2, v2, v17

    .line 1196
    .line 1197
    if-lez v2, :cond_43

    .line 1198
    .line 1199
    if-eqz v1, :cond_44

    .line 1200
    .line 1201
    :cond_43
    iget-object v2, v0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 1202
    .line 1203
    invoke-virtual {v2}, Landroid/widget/EdgeEffect;->getDistance()F

    .line 1204
    .line 1205
    .line 1206
    move-result v2

    .line 1207
    cmpl-float v2, v2, v17

    .line 1208
    .line 1209
    if-lez v2, :cond_45

    .line 1210
    .line 1211
    const/4 v13, 0x1

    .line 1212
    if-ne v1, v13, :cond_45

    .line 1213
    .line 1214
    :cond_44
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->onDisallowSwipeToMinusOnePage()V

    .line 1215
    .line 1216
    .line 1217
    :cond_45
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 1218
    .line 1219
    invoke-virtual {v1, v11}, Lcom/android/launcher3/util/i0;->c(Landroid/view/MotionEvent;)V

    .line 1220
    .line 1221
    .line 1222
    iget-object v1, v0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 1223
    .line 1224
    invoke-virtual {v1, v11}, Lcom/android/launcher3/util/i0;->c(Landroid/view/MotionEvent;)V

    .line 1225
    .line 1226
    .line 1227
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->resetTouchState()V

    .line 1228
    .line 1229
    .line 1230
    const/4 v13, 0x1

    .line 1231
    goto :goto_21

    .line 1232
    :cond_46
    move v1, v12

    .line 1233
    move/from16 v17, v13

    .line 1234
    .line 1235
    iput-boolean v1, v0, Lcom/android/launcher3/V4;->isFirstFrameWhenUp:Z

    .line 1236
    .line 1237
    iput v3, v0, Lcom/android/launcher3/V4;->mScrollMode:I

    .line 1238
    .line 1239
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/V4;->updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V

    .line 1240
    .line 1241
    .line 1242
    iget-object v1, v0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 1243
    .line 1244
    invoke-virtual {v1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 1245
    .line 1246
    .line 1247
    move-result v1

    .line 1248
    if-nez v1, :cond_47

    .line 1249
    .line 1250
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->interruptScroll()V

    .line 1251
    .line 1252
    .line 1253
    :cond_47
    invoke-virtual {v11}, Landroid/view/MotionEvent;->getX()F

    .line 1254
    .line 1255
    .line 1256
    move-result v1

    .line 1257
    iput v1, v0, Lcom/android/launcher3/V4;->mDownMotionX:F

    .line 1258
    .line 1259
    invoke-virtual {v11}, Landroid/view/MotionEvent;->getY()F

    .line 1260
    .line 1261
    .line 1262
    move-result v1

    .line 1263
    iput v1, v0, Lcom/android/launcher3/V4;->mDownMotionY:F

    .line 1264
    .line 1265
    iget-object v1, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 1266
    .line 1267
    const/4 v3, 0x0

    .line 1268
    invoke-interface {v1, v11, v3}, Lcom/android/launcher3/touch/G;->getPrimaryDirection(Landroid/view/MotionEvent;I)F

    .line 1269
    .line 1270
    .line 1271
    move-result v1

    .line 1272
    iput v1, v0, Lcom/android/launcher3/V4;->mDownMotionPrimary:F

    .line 1273
    .line 1274
    float-to-int v1, v1

    .line 1275
    int-to-float v1, v1

    .line 1276
    iput v1, v0, Lcom/android/launcher3/V4;->mLastMotion:F

    .line 1277
    .line 1278
    move/from16 v1, v17

    .line 1279
    .line 1280
    iput v1, v0, Lcom/android/launcher3/V4;->mTotalMotion:F

    .line 1281
    .line 1282
    iput-boolean v3, v0, Lcom/android/launcher3/V4;->mAllowEasyFling:Z

    .line 1283
    .line 1284
    invoke-virtual {v11, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 1285
    .line 1286
    .line 1287
    move-result v1

    .line 1288
    iput v1, v0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 1289
    .line 1290
    iget-object v1, v0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 1291
    .line 1292
    invoke-interface {v1, v11, v3}, Lcom/android/launcher3/touch/G;->getSecondaryDirection(Landroid/view/MotionEvent;I)F

    .line 1293
    .line 1294
    .line 1295
    move-result v1

    .line 1296
    iput v1, v0, Lcom/android/launcher3/V4;->mDownMotionSecondary:F

    .line 1297
    .line 1298
    iget-boolean v1, v0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 1299
    .line 1300
    const/4 v13, 0x1

    .line 1301
    if-eqz v1, :cond_48

    .line 1302
    .line 1303
    iput-boolean v13, v0, Lcom/android/launcher3/V4;->mDownWithBeingDragged:Z

    .line 1304
    .line 1305
    const-string v1, "onTouchEvent ACTION_DOWN pageBeginTransition"

    .line 1306
    .line 1307
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1308
    .line 1309
    .line 1310
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->pageBeginTransition()V

    .line 1311
    .line 1312
    .line 1313
    :cond_48
    :goto_21
    return v13
.end method

.method protected onUnhandledTap(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected onVelocityValuesUpdated()V
    .locals 0

    .line 1
    return-void
.end method

.method public onViewAdded(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewAdded(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/V4;->dispatchPageCountChanged()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getMfvPageIndicatorMarker(I)Lcom/android/launcher3/pageindicators/b;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->f(ILcom/android/launcher3/pageindicators/b;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->x()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->notifyLongClickTextViewWhenPageIndicatorCountChanged()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewRemoved(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/android/launcher3/P4;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/android/launcher3/P4;-><init>(Lcom/android/launcher3/V4;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->runOnPageScrollsInitialized(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/V4;->dispatchPageCountChanged()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v0, 0x1

    .line 20
    if-ne p1, v0, :cond_0

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/high16 v1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    cmpl-float v0, v0, v1

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public onVisibilityAggregated(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageEndTransition()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onVisibilityAggregated(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected pageBeginTransition()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsPageInTransition:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsPageInTransition:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->onPageBeginTransition()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method protected pageEndTransition()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsPageInTransition:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isShown()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    :cond_0
    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsPageInTransition:Z

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->onPageEndTransition()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public performAccessibilityAction(ILandroid/os/Bundle;)Z
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageOrderFlipped()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const/16 v1, 0x1000

    .line 14
    .line 15
    if-eq p1, v1, :cond_5

    .line 16
    .line 17
    const/16 v1, 0x2000

    .line 18
    .line 19
    if-eq p1, v1, :cond_3

    .line 20
    .line 21
    packed-switch p1, :pswitch_data_0

    .line 22
    .line 23
    .line 24
    goto :goto_2

    .line 25
    :pswitch_0
    iget-boolean p1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->scrollRight()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->scrollLeft()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :pswitch_1
    iget-boolean p1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 40
    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->scrollLeft()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0

    .line 48
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->scrollRight()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0

    .line 53
    :cond_3
    if-eqz p2, :cond_4

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->scrollRight()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_7

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->scrollLeft()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_7

    .line 67
    .line 68
    :goto_0
    return v0

    .line 69
    :cond_5
    if-eqz p2, :cond_6

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->scrollLeft()Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_7

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_6
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->scrollRight()Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_7

    .line 83
    .line 84
    :goto_1
    return v0

    .line 85
    :cond_7
    :goto_2
    const/4 p0, 0x0

    .line 86
    return p0

    .line 87
    :pswitch_data_0
    .packed-switch 0x1020048
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public removeView(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->notifyLongClickTextViewWhenPageIndicatorCountChanged()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isInWorkSpace()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    move-object p1, p0

    .line 31
    check-cast p1, Lcom/android/launcher3/Workspace;

    .line 32
    .line 33
    iget-object v0, p1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->V2()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object p1, p1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 44
    .line 45
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->x()V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->shouldHandleRequestChildFocus(Landroid/view/View;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 16
    .line 17
    if-eq p2, v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-ltz p1, :cond_2

    .line 27
    .line 28
    invoke-direct {p0, p1}, Lcom/android/launcher3/V4;->isVisible(I)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-nez p2, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isInTouchMode()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-nez p2, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_0
    return-void
.end method

.method public requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/V4;->isVisible(I)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/widget/OverScroller;->isFinished()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    if-eqz p3, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 29
    .line 30
    .line 31
    :goto_1
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->cancelCurrentPageLongPress()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public requestLayout()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsLayoutValid:Z

    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public resetDelta(II)I
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-le v0, v1, :cond_3

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    add-int/lit8 v1, v1, -0x1

    .line 26
    .line 27
    if-ne v0, v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    :goto_0
    neg-int p0, p0

    .line 34
    return p0

    .line 35
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/lit8 v0, v0, -0x1

    .line 40
    .line 41
    if-ne p2, v0, :cond_3

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-nez p2, :cond_3

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_1
    if-nez p2, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    add-int/lit8 v1, v1, -0x1

    .line 65
    .line 66
    if-ne v0, v1, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0

    .line 73
    :cond_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/lit8 v0, v0, -0x1

    .line 78
    .line 79
    if-ne p2, v0, :cond_3

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-nez p2, :cond_3

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    goto :goto_0

    .line 92
    :cond_3
    return p1
.end method

.method protected resetTouchState()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/V4;->releaseVelocityTracker()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 9
    .line 10
    return-void
.end method

.method public runOnPageScrollsInitialized(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageScrollsInitialized()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/V4;->mOnPageScrollsInitializedCallbacks:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public scrollBy(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 8
    .line 9
    instance-of v0, v0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-direct {p0}, Lcom/android/launcher3/V4;->getOriginScroll()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    add-int/2addr p1, p2

    .line 23
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/V4;->scrollTo(II)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/V4;->getOriginScroll()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr v0, p1

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    add-int/2addr p1, p2

    .line 37
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/V4;->scrollTo(II)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->scrollBy(II)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public scrollLeft()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-int/2addr v0, v1

    .line 16
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mAllowOverScroll:Z

    .line 22
    .line 23
    return p0
.end method

.method public scrollRight()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    sub-int/2addr v1, v2

    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    add-int/2addr v0, v1

    .line 22
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 23
    .line 24
    .line 25
    return v2

    .line 26
    :cond_0
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mAllowOverScroll:Z

    .line 27
    .line 28
    return p0
.end method

.method public scrollTo(II)V
    .locals 9

    .line 1
    iget-object v3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 2
    .line 3
    invoke-interface {v3, p1, p2}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 4
    .line 5
    .line 6
    move-result v5

    .line 7
    iget-object v3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 8
    .line 9
    invoke-interface {v3, p1, p2}, Lcom/android/launcher3/touch/G;->getSecondaryValue(II)I

    .line 10
    .line 11
    .line 12
    iget-boolean v3, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 13
    .line 14
    const/4 v6, 0x1

    .line 15
    const/4 v7, 0x0

    .line 16
    if-eqz v3, :cond_1

    .line 17
    .line 18
    iget v4, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 19
    .line 20
    if-le v5, v4, :cond_0

    .line 21
    .line 22
    :goto_0
    move v4, v3

    .line 23
    move v3, v6

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    move v4, v3

    .line 26
    move v3, v7

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget v4, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 29
    .line 30
    if-ge v5, v4, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :goto_1
    if-eqz v4, :cond_3

    .line 34
    .line 35
    iget v4, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 36
    .line 37
    if-ge v5, v4, :cond_2

    .line 38
    .line 39
    :goto_2
    move v4, v6

    .line 40
    goto :goto_3

    .line 41
    :cond_2
    move v4, v7

    .line 42
    goto :goto_3

    .line 43
    :cond_3
    iget v4, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 44
    .line 45
    if-le v5, v4, :cond_2

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :goto_3
    iput p1, p0, Lcom/android/launcher3/V4;->mUnboundedScroll:I

    .line 49
    .line 50
    iget-boolean v8, p0, Lcom/android/launcher3/V4;->mIsInterruptScrollAnimation:Z

    .line 51
    .line 52
    if-eqz v8, :cond_5

    .line 53
    .line 54
    iget-boolean v8, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 55
    .line 56
    if-nez v8, :cond_4

    .line 57
    .line 58
    if-nez v3, :cond_5

    .line 59
    .line 60
    if-nez v4, :cond_5

    .line 61
    .line 62
    :cond_4
    move-object v0, p0

    .line 63
    move v1, p1

    .line 64
    move v2, p2

    .line 65
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/V4;->verifyScrollToParameters(IIZZI)Landroid/graphics/Point;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 70
    .line 71
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 72
    .line 73
    goto :goto_4

    .line 74
    :cond_5
    move v2, p1

    .line 75
    move v1, p2

    .line 76
    :goto_4
    iget-boolean v5, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 77
    .line 78
    if-eqz v5, :cond_7

    .line 79
    .line 80
    if-nez v3, :cond_6

    .line 81
    .line 82
    if-eqz v4, :cond_7

    .line 83
    .line 84
    :cond_6
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/V4;->setOriginValue(II)V

    .line 85
    .line 86
    .line 87
    invoke-super {p0, v2, v1}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_7
    iget-boolean v3, p0, Lcom/android/launcher3/V4;->mFreeScrollMFV:Z

    .line 92
    .line 93
    if-nez v3, :cond_b

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_9

    .line 100
    .line 101
    instance-of v3, p0, Lcom/android/launcher3/Workspace;

    .line 102
    .line 103
    if-eqz v3, :cond_b

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    if-gt v3, v6, :cond_8

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isWorkspaceCanScrollToMiBoard()Z

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    if-eqz v3, :cond_b

    .line 116
    .line 117
    :cond_8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->t:Z

    .line 130
    .line 131
    if-eqz v3, :cond_b

    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isSpringOverScrollerFinished()Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    if-eqz v3, :cond_b

    .line 138
    .line 139
    :cond_9
    iget-object v3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 140
    .line 141
    iget v4, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 142
    .line 143
    invoke-interface {v3, v4, v7}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    iget v4, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 148
    .line 149
    invoke-static {v2, v3, v4}, Lcom/android/launcher3/N5;->c(III)I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    iget-object v3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 154
    .line 155
    iget v4, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 156
    .line 157
    invoke-interface {v3, v7, v4}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    iget v4, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 162
    .line 163
    invoke-static {v1, v3, v4}, Lcom/android/launcher3/N5;->c(III)I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    :cond_a
    :goto_5
    move v6, v1

    .line 168
    move v7, v2

    .line 169
    goto :goto_6

    .line 170
    :cond_b
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    if-eqz v3, :cond_a

    .line 175
    .line 176
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isWorkspaceCanScrollToMiBoard()Z

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    if-eqz v3, :cond_c

    .line 181
    .line 182
    iget-object v3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 183
    .line 184
    iget v4, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 185
    .line 186
    invoke-interface {v3, v4, v7}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    invoke-static {v2, v3, v2}, Lcom/android/launcher3/N5;->c(III)I

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    iget-object v3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 195
    .line 196
    iget v4, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 197
    .line 198
    invoke-interface {v3, v7, v4}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    invoke-static {v1, v3, v1}, Lcom/android/launcher3/N5;->c(III)I

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    goto :goto_5

    .line 207
    :cond_c
    invoke-direct {p0}, Lcom/android/launcher3/V4;->isWorkspaceCanScrollRightToMiBoardRtl()Z

    .line 208
    .line 209
    .line 210
    move-result v3

    .line 211
    if-eqz v3, :cond_a

    .line 212
    .line 213
    iget-object v3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 214
    .line 215
    invoke-interface {v3, v2, v7}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    iget v4, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 220
    .line 221
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    .line 222
    .line 223
    .line 224
    move-result v3

    .line 225
    iget v4, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 226
    .line 227
    invoke-static {v2, v3, v4}, Lcom/android/launcher3/N5;->c(III)I

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    iget-object v3, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 232
    .line 233
    invoke-interface {v3, v7, v1}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 234
    .line 235
    .line 236
    move-result v3

    .line 237
    iget v4, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 238
    .line 239
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    iget v4, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 244
    .line 245
    invoke-static {v1, v3, v4}, Lcom/android/launcher3/N5;->c(III)I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    goto :goto_5

    .line 250
    :goto_6
    invoke-direct {p0, v7, v6}, Lcom/android/launcher3/V4;->setOriginValue(II)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    if-eqz v1, :cond_e

    .line 258
    .line 259
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 260
    .line 261
    instance-of v1, v1, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;

    .line 262
    .line 263
    if-eqz v1, :cond_d

    .line 264
    .line 265
    int-to-float v1, v6

    .line 266
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    iget v4, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 271
    .line 272
    iget v5, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 273
    .line 274
    const/high16 v3, 0x41000000    # 8.0f

    .line 275
    .line 276
    move-object v0, p0

    .line 277
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/V4;->getOverScrollAmount(FIFII)I

    .line 278
    .line 279
    .line 280
    move-result v6

    .line 281
    goto :goto_7

    .line 282
    :cond_d
    int-to-float v1, v7

    .line 283
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 284
    .line 285
    .line 286
    move-result v2

    .line 287
    iget v4, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 288
    .line 289
    iget v5, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 290
    .line 291
    const/high16 v3, 0x41000000    # 8.0f

    .line 292
    .line 293
    move-object v0, p0

    .line 294
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/V4;->getOverScrollAmount(FIFII)I

    .line 295
    .line 296
    .line 297
    move-result v7

    .line 298
    :cond_e
    :goto_7
    invoke-super {p0, v7, v6}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 299
    .line 300
    .line 301
    return-void
.end method

.method public sendAccessibilityEvent(I)V
    .locals 1

    .line 1
    const/16 v0, 0x1000

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->sendAccessibilityEvent(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public sendScrollAccessibilityEvent()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x1000

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->isObservedEventType(Landroid/content/Context;I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eq v0, v2, :cond_0

    .line 20
    .line 21
    invoke-static {v1}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityEvent;->setScrollable(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityEvent;->setScrollX(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityEvent;->setScrollY(I)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 44
    .line 45
    iget v2, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 46
    .line 47
    invoke-interface {v1, v0, v2}, Lcom/android/launcher3/touch/G;->setMaxScroll(Landroid/view/accessibility/AccessibilityEvent;I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public setChildAlpha(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setCurrentPage(I)V
    .locals 1

    const/4 v0, -0x2

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/V4;->setCurrentPage(II)V

    return-void
.end method

.method public setCurrentPage(II)V
    .locals 1

    .line 2
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->abortScrollerAnimation(Z)V

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    const/4 v0, -0x2

    if-eq p2, v0, :cond_2

    goto :goto_0

    .line 5
    :cond_2
    iget p2, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 6
    :goto_0
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    if-eqz v0, :cond_3

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->transformPageNum(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    goto :goto_1

    .line 8
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 9
    :goto_1
    iget p1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    iput p1, p0, Lcom/android/launcher3/V4;->mCurrentScrollOverPage:I

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->updateCurrentPageScroll()V

    .line 11
    invoke-virtual {p0, p2}, Lcom/android/launcher3/V4;->notifyPageSwitchListener(I)V

    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/V4;->verifyPageAlpha()V

    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public setEnableFreeScroll(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "setEnableFreeScroll: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "=old="

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "PagedView"

    .line 34
    .line 35
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 39
    .line 40
    iput-boolean p1, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    if-eqz v0, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eq v0, v1, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 73
    .line 74
    .line 75
    :cond_2
    :goto_0
    instance-of v0, p0, Lcom/android/quickstep/views/RecentsView;

    .line 76
    .line 77
    if-nez v0, :cond_3

    .line 78
    .line 79
    xor-int/lit8 v0, p1, 0x1

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->setEnableOverscroll(Z)V

    .line 82
    .line 83
    .line 84
    :cond_3
    xor-int/lit8 p1, p1, 0x1

    .line 85
    .line 86
    iput-boolean p1, p0, Lcom/android/launcher3/V4;->mFreeScrollMFV:Z

    .line 87
    .line 88
    return-void
.end method

.method protected setEnableOverscroll(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/V4;->mAllowOverScroll:Z

    .line 2
    .line 3
    return-void
.end method

.method public setIconArrangeCurrentPage(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setIsCircle(Z)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isInWorkSpace()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-gt v0, v2, :cond_0

    .line 14
    .line 15
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->s:Z

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    move v0, v2

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move v0, v1

    .line 41
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->t:Z

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    if-eqz v3, :cond_2

    .line 58
    .line 59
    move-object v4, p0

    .line 60
    check-cast v4, Lcom/android/launcher3/Workspace;

    .line 61
    .line 62
    iget-object v4, v4, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 63
    .line 64
    sget-object v5, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 65
    .line 66
    invoke-interface {v4, v5}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-eqz v4, :cond_2

    .line 71
    .line 72
    const-string p1, "PagedView"

    .line 73
    .line 74
    const-string v0, "setIsCircle in MENU_OVERVIEW"

    .line 75
    .line 76
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    iput-boolean v2, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    if-nez v0, :cond_3

    .line 83
    .line 84
    if-nez v3, :cond_4

    .line 85
    .line 86
    :cond_3
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iput-boolean p1, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 90
    .line 91
    return-void
.end method

.method public setOnPageTransitionEndCallback(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsPageInTransition:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/V4;->mOnPageTransitionEndCallback:Ljava/lang/Runnable;

    .line 13
    .line 14
    return-void
.end method

.method protected setOrientationHandler(Lcom/android/launcher3/touch/G;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 2
    .line 3
    return-void
.end method

.method public setPageSpacing(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/V4;->mPageSpacing:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method setPageWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/V4;->mPageWidth:I

    .line 2
    .line 3
    return-void
.end method

.method protected shouldFlingForVelocity(I)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mAllowEasyFling:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/V4;->mEasyFlingThresholdVelocity:I

    .line 6
    .line 7
    :goto_0
    int-to-float p0, p0

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget p0, p0, Lcom/android/launcher3/V4;->mFlingThresholdVelocity:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :goto_1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    int-to-float p1, p1

    .line 17
    cmpl-float p0, p1, p0

    .line 18
    .line 19
    if-lez p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method protected shouldHandleRequestChildFocus(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public snapToCrossScreen(II)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPageWithVerify()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq p1, v0, :cond_4

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eq v2, v1, :cond_4

    .line 13
    .line 14
    iget v2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 15
    .line 16
    if-eq v2, p1, :cond_4

    .line 17
    .line 18
    iget-boolean v3, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 19
    .line 20
    const/4 v4, -0x2

    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    if-eq v2, v4, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->transformPageNum(I)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-ne v2, p1, :cond_0

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_0
    iput v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/V4;->scrollTo(II)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-ge p1, v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move v1, v2

    .line 50
    :goto_0
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 51
    .line 52
    if-ne v1, v0, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    goto :goto_1

    .line 59
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    neg-int v0, v0

    .line 64
    :goto_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/V4;->needCrossDraw(I)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mIsSnapToHome:Z

    .line 69
    .line 70
    iput p1, p0, Lcom/android/launcher3/V4;->mFinalPage:I

    .line 71
    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    iget v1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 75
    .line 76
    if-eq v1, v4, :cond_3

    .line 77
    .line 78
    iget v2, p0, Lcom/android/launcher3/V4;->mSnapToHomeStartPage:I

    .line 79
    .line 80
    const/4 v3, -0x1

    .line 81
    if-ne v2, v3, :cond_3

    .line 82
    .line 83
    iput v1, p0, Lcom/android/launcher3/V4;->mSnapToHomeStartPage:I

    .line 84
    .line 85
    :cond_3
    invoke-virtual {p0, p1, v0, p2}, Lcom/android/launcher3/V4;->snapToPage(III)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    return p0

    .line 90
    :cond_4
    :goto_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 93
    .line 94
    .line 95
    const-string v2, "snapToCrossScreen already in "

    .line 96
    .line 97
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string p1, " cur"

    .line 104
    .line 105
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string p1, "/"

    .line 116
    .line 117
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string p1, "/next"

    .line 124
    .line 125
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget p1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 129
    .line 130
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string p1, "/ x"

    .line 134
    .line 135
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    const-string p1, "PagedView"

    .line 150
    .line 151
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    return v1
.end method

.method protected snapToDestination()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getSnapAnimationDuration()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/V4;->snapToPage(II)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public snapToPage(I)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getSnapAnimationDuration()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/V4;->snapToPage(II)Z

    move-result p0

    return p0
.end method

.method public snapToPage(II)Z
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher3/V4;->snapToPage(IIZ)Z

    move-result p0

    return p0
.end method

.method protected snapToPage(III)Z
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/launcher3/V4;->snapToPage(IIIZ)Z

    move-result p0

    return p0
.end method

.method protected snapToPage(IIIZ)Z
    .locals 8

    .line 10
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mFirstLayout:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    return v1

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "snapToPage mNextPage "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "-whichPage "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "-duration"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "PagedView"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    if-nez v0, :cond_1

    .line 14
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    move-result p1

    goto :goto_0

    .line 15
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v0, -0x1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 16
    :goto_0
    iput p1, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 17
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->awakenScrollBars(I)Z

    if-eqz p4, :cond_2

    move v7, v1

    goto :goto_1

    :cond_2
    if-nez p3, :cond_3

    .line 18
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p3

    :cond_3
    move v7, p3

    :goto_1
    if-eqz v7, :cond_4

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageBeginTransition()V

    .line 20
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    move-result p1

    if-nez p1, :cond_5

    .line 21
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->abortScrollerAnimation(Z)V

    .line 22
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isEnableEdgeRebound()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 23
    iget-object p1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    invoke-interface {p1, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    move-result p1

    add-int/2addr p1, p2

    invoke-direct {p0}, Lcom/android/launcher3/V4;->getOriginScroll()I

    move-result p3

    sub-int v5, p1, p3

    .line 24
    iget-object v2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    invoke-direct {p0}, Lcom/android/launcher3/V4;->getOriginScroll()I

    move-result v3

    const/4 v4, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    move v5, p2

    goto :goto_2

    .line 25
    :cond_6
    iget-object v2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    iget-object p1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    invoke-interface {p1, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    move-result v3

    const/4 v4, 0x0

    const/4 v6, 0x0

    move v5, p2

    invoke-virtual/range {v2 .. v7}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 26
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->updatePageIndicator()V

    .line 27
    invoke-direct {p0}, Lcom/android/launcher3/V4;->updateHomeScreenEditor()V

    if-eqz p4, :cond_7

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->computeScroll()V

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageEndTransition()V

    .line 30
    :cond_7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 31
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result p0

    if-lez p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    return v1
.end method

.method protected snapToPage(IIZ)Z
    .locals 3

    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    if-nez v0, :cond_0

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    move-result p1

    .line 5
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    move-result v0

    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "snapToPage: scroll for page: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "PagedView"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    invoke-interface {v1, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    move-result v1

    sub-int/2addr v0, v1

    .line 8
    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/android/launcher3/V4;->snapToPage(IIIZ)Z

    move-result p0

    return p0
.end method

.method public snapToPageImmediately(I)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getSnapAnimationDuration()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/V4;->snapToPage(IIZ)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method protected snapToPageWithVelocity(II)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    if-gez p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-ne p1, v0, :cond_2

    .line 25
    .line 26
    const/4 p1, -0x1

    .line 27
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 28
    .line 29
    invoke-interface {v0, p0}, Lcom/android/launcher3/touch/G;->getMeasuredSize(Landroid/view/View;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    div-int/lit8 v0, v0, 0x2

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v3, "snapToPageWithVelocity: get scroll for page: "

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v3, ", "

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const-string v3, "PagedView"

    .line 65
    .line 66
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 70
    .line 71
    invoke-interface {v2, p0}, Lcom/android/launcher3/touch/G;->getPrimaryScroll(Landroid/view/View;)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    sub-int/2addr v1, v2

    .line 76
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    iget v3, p0, Lcom/android/launcher3/V4;->mMinFlingVelocity:I

    .line 81
    .line 82
    if-ge v2, v3, :cond_3

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getSnapAnimationDuration()I

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/V4;->snapToPage(II)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    return p0

    .line 93
    :cond_3
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    int-to-float v2, v2

    .line 98
    const/high16 v3, 0x3f800000    # 1.0f

    .line 99
    .line 100
    mul-float/2addr v2, v3

    .line 101
    mul-int/lit8 v4, v0, 0x2

    .line 102
    .line 103
    int-to-float v4, v4

    .line 104
    div-float/2addr v2, v4

    .line 105
    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    int-to-float v0, v0

    .line 110
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->distanceInfluenceForSnapDuration(F)F

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    mul-float/2addr v2, v0

    .line 115
    add-float/2addr v0, v2

    .line 116
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    iget v2, p0, Lcom/android/launcher3/V4;->mMinSnapVelocity:I

    .line 121
    .line 122
    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    invoke-static {}, Lx1/O;->j3()Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-eqz v2, :cond_4

    .line 131
    .line 132
    const/high16 v2, 0x40200000    # 2.5f

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_4
    invoke-static {}, Lx1/O;->O1()Z

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    if-eqz v2, :cond_5

    .line 140
    .line 141
    const/high16 v2, 0x40400000    # 3.0f

    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_5
    const/high16 v2, 0x40800000    # 4.0f

    .line 145
    .line 146
    :goto_1
    int-to-float p2, p2

    .line 147
    div-float/2addr v0, p2

    .line 148
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 153
    .line 154
    mul-float/2addr p2, v0

    .line 155
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    int-to-float p2, p2

    .line 160
    mul-float/2addr v2, p2

    .line 161
    float-to-int p2, v2

    .line 162
    invoke-virtual {p0, p1, v1, p2}, Lcom/android/launcher3/V4;->snapToPage(III)Z

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    return p0
.end method

.method protected transformPageNum(I)I
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    if-ne p1, v1, :cond_0

    .line 8
    .line 9
    return v2

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    add-int/lit8 p0, p0, -0x1

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    add-int/lit8 p0, p0, -0x1

    .line 28
    .line 29
    invoke-static {p1, v2, p0}, Lcom/android/launcher3/N5;->c(III)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_2
    if-ne p1, v1, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    add-int/lit8 p0, p0, -0x1

    .line 41
    .line 42
    return p0

    .line 43
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-ne p1, v0, :cond_4

    .line 48
    .line 49
    return v2

    .line 50
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    add-int/lit8 p0, p0, -0x1

    .line 55
    .line 56
    invoke-static {p1, v2, p0}, Lcom/android/launcher3/N5;->c(III)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0
.end method

.method protected updateCurrentPageScroll()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ltz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-ge v0, v2, :cond_0

    .line 11
    .line 12
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v2, p0, Lcom/android/launcher3/V4;->mCurrentPageScrollDiff:I

    .line 19
    .line 20
    add-int/2addr v0, v2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v0, v1

    .line 23
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 24
    .line 25
    sget-object v3, Lcom/android/launcher3/touch/G;->c:Lcom/android/launcher3/touch/G$c;

    .line 26
    .line 27
    invoke-interface {v2, p0, v3, v0}, Lcom/android/launcher3/touch/G;->setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/widget/OverScroller;->getCurrX()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    iget-object v4, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 37
    .line 38
    invoke-virtual {v4}, Landroid/widget/OverScroller;->getCurrX()I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    sub-int/2addr v0, v4

    .line 43
    invoke-virtual {v2, v3, v1, v0, v1}, Landroid/widget/OverScroller;->startScroll(IIII)V

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->forceFinishScroller(Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method protected updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getFinalX()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrX()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-int/2addr v0, v1

    .line 14
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x1

    .line 25
    const/4 v3, 0x0

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    iget v1, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 29
    .line 30
    div-int/lit8 v1, v1, 0x3

    .line 31
    .line 32
    if-ge v0, v1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v0, v3

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :goto_0
    move v0, v2

    .line 38
    :goto_1
    if-eqz v0, :cond_5

    .line 39
    .line 40
    iput-boolean v3, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_2

    .line 49
    .line 50
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 51
    .line 52
    if-nez v1, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageEndTransition()V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 65
    .line 66
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 73
    .line 74
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_3

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    move v2, v3

    .line 82
    :cond_4
    :goto_2
    iput-boolean v2, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_5
    iput-boolean v2, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 86
    .line 87
    :goto_3
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 88
    .line 89
    if-eqz v1, :cond_6

    .line 90
    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v2, "updateIsBeingDraggedOnTouchDown: mIsBeingDragged is true."

    .line 97
    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v0, ", "

    .line 105
    .line 106
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v2, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 110
    .line 111
    invoke-virtual {v2}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 122
    .line 123
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    const-string v1, "PagedView"

    .line 135
    .line 136
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 140
    .line 141
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    invoke-interface {v0, v1, v2}, Lcom/android/launcher3/touch/G;->getSecondaryValue(FF)F

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    iget-object v1, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 154
    .line 155
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    invoke-interface {v1, v2, v3}, Lcom/android/launcher3/touch/G;->getSecondaryValue(II)I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    int-to-float v1, v1

    .line 168
    div-float/2addr v0, v1

    .line 169
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 170
    .line 171
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    const/4 v2, 0x0

    .line 176
    if-nez v1, :cond_7

    .line 177
    .line 178
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 179
    .line 180
    const/high16 v3, 0x3f800000    # 1.0f

    .line 181
    .line 182
    sub-float/2addr v3, v0

    .line 183
    invoke-virtual {v1, v2, v3}, Landroid/widget/EdgeEffect;->onPullDistance(FF)F

    .line 184
    .line 185
    .line 186
    :cond_7
    iget-object v1, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 187
    .line 188
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-nez v1, :cond_8

    .line 193
    .line 194
    iget-object p0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 195
    .line 196
    invoke-virtual {p0, v2, v0, p1}, Lcom/android/launcher3/util/i0;->b(FFLandroid/view/MotionEvent;)F

    .line 197
    .line 198
    .line 199
    :cond_8
    return-void
.end method

.method protected updateMinAndMaxScrollX()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->computeMinScroll()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->computeMaxScroll()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 12
    .line 13
    return-void
.end method

.method public updateMovedDelta(I)I
    .locals 0

    .line 1
    return p1
.end method

.method protected updatePageIndicator()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsCircle:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->transformPageNum(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    check-cast v1, Lcom/android/launcher3/pageindicators/d;

    .line 18
    .line 19
    invoke-interface {v1, v0}, Lcom/android/launcher3/pageindicators/d;->setActiveMarker(I)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->setActiveMarker(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->setIconArrangeCurrentPage(I)V

    .line 34
    .line 35
    .line 36
    :cond_2
    return-void
.end method

.method protected useMFVScrollParameter()V
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->O1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Lcom/android/launcher3/V4;->SIGNIFICANT_MOVE_THRESHOLD:F

    .line 8
    .line 9
    const v1, 0x3f4ccccd    # 0.8f

    .line 10
    .line 11
    .line 12
    div-float/2addr v0, v1

    .line 13
    iput v0, p0, Lcom/android/launcher3/V4;->SIGNIFICANT_MOVE_THRESHOLD_LOCAL:F

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v0, Lcom/android/launcher3/V4;->SIGNIFICANT_MOVE_THRESHOLD:F

    .line 17
    .line 18
    const/high16 v1, 0x40200000    # 2.5f

    .line 19
    .line 20
    div-float/2addr v0, v1

    .line 21
    iput v0, p0, Lcom/android/launcher3/V4;->SIGNIFICANT_MOVE_THRESHOLD_LOCAL:F

    .line 22
    .line 23
    :goto_0
    invoke-static {}, Lx1/O;->j3()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const v0, 0x3dcccccd    # 0.1f

    .line 30
    .line 31
    .line 32
    sput v0, Lcom/android/launcher3/V4;->SIGNIFICANT_MOVE_THRESHOLD:F

    .line 33
    .line 34
    const/high16 v1, 0x41000000    # 8.0f

    .line 35
    .line 36
    div-float/2addr v0, v1

    .line 37
    iput v0, p0, Lcom/android/launcher3/V4;->SIGNIFICANT_MOVE_THRESHOLD_LOCAL:F

    .line 38
    .line 39
    :cond_1
    const/16 v0, 0x190

    .line 40
    .line 41
    iput v0, p0, Lcom/android/launcher3/V4;->mPageSnapAnimationDuration:I

    .line 42
    .line 43
    iget v0, p0, Lcom/android/launcher3/V4;->mTouchSlop:I

    .line 44
    .line 45
    int-to-float v0, v0

    .line 46
    const/high16 v1, 0x3f800000    # 1.0f

    .line 47
    .line 48
    mul-float/2addr v0, v1

    .line 49
    float-to-int v0, v0

    .line 50
    iput v0, p0, Lcom/android/launcher3/V4;->mTouchSlop:I

    .line 51
    .line 52
    iget v0, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 53
    .line 54
    int-to-float v0, v0

    .line 55
    mul-float/2addr v0, v1

    .line 56
    float-to-int v0, v0

    .line 57
    iput v0, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 58
    .line 59
    iget v0, p0, Lcom/android/launcher3/V4;->mFlingThresholdVelocity:I

    .line 60
    .line 61
    int-to-float v0, v0

    .line 62
    const/high16 v1, 0x3f000000    # 0.5f

    .line 63
    .line 64
    mul-float/2addr v0, v1

    .line 65
    float-to-int v0, v0

    .line 66
    iput v0, p0, Lcom/android/launcher3/V4;->FLING_THRESHOLD_VELOCITY_LOCAL:I

    .line 67
    .line 68
    iget v0, p0, Lcom/android/launcher3/V4;->mEasyFlingThresholdVelocity:I

    .line 69
    .line 70
    int-to-float v0, v0

    .line 71
    mul-float/2addr v0, v1

    .line 72
    float-to-int v0, v0

    .line 73
    iput v0, p0, Lcom/android/launcher3/V4;->EASY_FLING_THRESHOLD_VELOCITY_LOCAL:I

    .line 74
    .line 75
    const/16 v0, 0xb4

    .line 76
    .line 77
    iput v0, p0, Lcom/android/launcher3/V4;->FREE_SCROLL_MIN_VELOCITY:I

    .line 78
    .line 79
    const/16 v0, 0x7d0

    .line 80
    .line 81
    iput v0, p0, Lcom/android/launcher3/V4;->FREE_SCROLL_MAX_VELOCITY:I

    .line 82
    .line 83
    return-void
.end method

.method protected validPageIndex(I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit8 p0, p0, -0x1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p1, v0, p0}, Lcom/android/launcher3/N5;->c(III)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public validateNewPage(I)I
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/V4;->ensureWithinScrollBounds(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    sub-int/2addr v0, v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {p1, v2, v0}, Lcom/android/launcher3/N5;->c(III)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-le v0, v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getLeftmostVisiblePageForIndex(I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_0
    return p1
.end method
