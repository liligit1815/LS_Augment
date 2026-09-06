.class public interface abstract Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;
.super Ljava/lang/Object;
.source "RecentsPagedOrientationHandler.kt"

# interfaces
.implements Lcom/android/launcher3/touch/G;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler$Companion;

.field public static final LANDSCAPE:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

.field public static final PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

.field public static final SEASCAPE:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler$Companion;->$$INSTANCE:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler$Companion;

    .line 2
    .line 3
    sput-object v0, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->Companion:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler$Companion;

    .line 4
    .line 5
    new-instance v0, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/quickstep/orientation/PortraitPagedViewHandler;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 11
    .line 12
    new-instance v0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->LANDSCAPE:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 18
    .line 19
    new-instance v0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;

    .line 20
    .line 21
    invoke-direct {v0}, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object v0, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->SEASCAPE:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public abstract adjustFloatingIconStartVelocity(Landroid/graphics/PointF;)V
.end method

.method public abstract synthetic calculateDoubleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
.end method

.method public abstract synthetic calculateDoubleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
.end method

.method public abstract synthetic calculateMultiGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;IF)Landroid/graphics/Rect;
.end method

.method public abstract synthetic calculateMultiGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;IF)Landroid/graphics/Rect;
.end method

.method public abstract synthetic calculateSingleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
.end method

.method public abstract synthetic calculateSingleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
.end method

.method public abstract calculateTargetTaskSecondaryPosition(Landroid/graphics/Rect;I)I
.end method

.method public abstract calculateTaskCenterSecondaryTranslation(Landroid/graphics/Rect;Landroid/view/View;I)F
.end method

.method public abstract calculateTopBottomHeightDiff(Landroid/graphics/Rect;II)I
.end method

.method public abstract synthetic calculateWindowRadiusToHome(Landroid/graphics/RectF;FF)F
.end method

.method public abstract fixBoundsForHomeAnimStartRect(Landroid/graphics/RectF;Lcom/android/launcher3/h0;)V
.end method

.method public abstract synthetic getCenterForPage(Landroid/view/View;Landroid/graphics/Rect;)I
.end method

.method public abstract synthetic getChildBounds(Landroid/view/View;IIZ)Lcom/android/launcher3/touch/G$a;
.end method

.method public abstract synthetic getChildStart(Landroid/view/View;)I
.end method

.method public abstract getClearAllPositionFactor(Z)F
.end method

.method public abstract getClearAllSidePadding(Landroid/view/View;Z)I
.end method

.method public abstract getDefaultSplitPosition(Lcom/android/launcher3/h0;)I
.end method

.method public abstract getDegreesRotated()F
.end method

.method public abstract getDistanceToBottomOfRect(Lcom/android/launcher3/h0;Landroid/graphics/Rect;)I
.end method

.method public abstract getDownDirection(Z)I
.end method

.method public abstract getDwbBannerTranslations(IILcom/android/launcher3/util/y2$a;Lcom/android/launcher3/h0;[Landroid/view/View;ILandroid/view/View;)Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/android/launcher3/util/y2$a;",
            "Lcom/android/launcher3/h0;",
            "[",
            "Landroid/view/View;",
            "I",
            "Landroid/view/View;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getEnd(Landroid/graphics/RectF;)F
.end method

.method public abstract getFinalSplitPlaceholderBounds(ILcom/android/launcher3/h0;ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
.end method

.method public abstract getFloatingTaskOffscreenTranslationTarget(Landroid/view/View;Landroid/graphics/RectF;ILcom/android/launcher3/h0;)F
.end method

.method public abstract getFloatingTaskPrimaryTranslation(Landroid/view/View;Lcom/android/launcher3/h0;)F
.end method

.method public abstract getGridPositionFactor(Z)F
.end method

.method public abstract getGridScrollOffset(Landroid/graphics/Rect;Landroid/graphics/Rect;Z)F
.end method

.method public abstract getGroupedTaskViewSizes(Lcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;III)Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/h0;",
            "Lcom/android/launcher3/util/y2$a;",
            "III)",
            "Landroid/util/Pair<",
            "Landroid/graphics/Point;",
            "Landroid/graphics/Point;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getHandlerTypeForLogging()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$OrientationHandler;
.end method

.method public abstract getInitialSplitPlaceholderBounds(IILcom/android/launcher3/h0;ILandroid/graphics/Rect;)V
.end method

.method public abstract getLayoutParameterSizePrimary(Landroid/view/View;)I
.end method

.method public abstract synthetic getMeasuredSize(Landroid/view/View;)I
.end method

.method public abstract getOverviewRowSpace(Lcom/android/launcher3/h0;)I
.end method

.method public abstract getPageSpacing(Lcom/android/launcher3/h0;)I
.end method

.method public abstract synthetic getPrimaryDirection(Landroid/view/MotionEvent;I)F
.end method

.method public abstract getPrimaryGridEnd(ZLandroid/graphics/Rect;)I
.end method

.method public abstract getPrimaryPosition(Landroid/graphics/Rect;)I
.end method

.method public abstract synthetic getPrimaryScale(Landroid/view/View;)F
.end method

.method public abstract synthetic getPrimaryScroll(Landroid/view/View;)I
.end method

.method public abstract getPrimarySize(Landroid/graphics/RectF;)F
.end method

.method public abstract getPrimarySize(Landroid/graphics/Rect;)I
.end method

.method public abstract getPrimarySize(Landroid/view/View;)I
.end method

.method public abstract synthetic getPrimaryValue(FF)F
.end method

.method public abstract synthetic getPrimaryValue(II)I
.end method

.method public abstract getPrimaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;)TT;"
        }
    .end annotation
.end method

.method public abstract synthetic getPrimaryVelocity(Landroid/view/VelocityTracker;I)F
.end method

.method public abstract getPrimaryViewTranslate()Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end method

.method public abstract synthetic getRecentsRtlSetting(Landroid/content/res/Resources;)Z
.end method

.method public abstract getRotation()I
.end method

.method public abstract synthetic getScrollOffsetEnd(Landroid/view/View;Landroid/graphics/Rect;)I
.end method

.method public abstract synthetic getScrollOffsetStart(Landroid/view/View;Landroid/graphics/Rect;)I
.end method

.method public abstract getSecondaryDimension(Landroid/view/View;)I
.end method

.method public abstract getSecondaryDimension(Landroid/view/View;Lcom/android/launcher3/h0;)I
.end method

.method public abstract synthetic getSecondaryDirection(Landroid/view/MotionEvent;I)F
.end method

.method public abstract getSecondarySize(Landroid/graphics/Rect;)I
.end method

.method public abstract getSecondarySize(Landroid/view/View;)I
.end method

.method public abstract getSecondaryTranslationDirectionFactor()I
.end method

.method public abstract getSecondaryTranslationFactor()I
.end method

.method public abstract synthetic getSecondaryValue(FF)F
.end method

.method public abstract synthetic getSecondaryValue(II)I
.end method

.method public abstract getSecondaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;)TT;"
        }
    .end annotation
.end method

.method public abstract getSecondaryViewTranslate()Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/FloatProperty<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSplitPositionOptions(Lcom/android/launcher3/h0;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/h0;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/y2$b;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSplitSelectTaskOffset(Landroid/util/FloatProperty;Landroid/util/FloatProperty;Lcom/android/launcher3/h0;)Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/util/FloatProperty<",
            "TT;>;",
            "Landroid/util/FloatProperty<",
            "TT;>;",
            "Lcom/android/launcher3/h0;",
            ")",
            "Landroid/util/Pair<",
            "Landroid/util/FloatProperty<",
            "TT;>;",
            "Landroid/util/FloatProperty<",
            "TT;>;>;"
        }
    .end annotation
.end method

.method public abstract getSplitTranslationDirectionFactor(ILcom/android/launcher3/h0;)I
.end method

.method public abstract getStart(Landroid/graphics/RectF;)F
.end method

.method public abstract getTaskDismissLength(ILandroid/graphics/Rect;)I
.end method

.method public abstract getTaskDismissVerticalDirection()I
.end method

.method public abstract getTaskDragDisplacementFactor(Z)I
.end method

.method public abstract getTaskLaunchLength(ILandroid/graphics/Rect;)I
.end method

.method public abstract getTaskLockDirectionFactor()I
.end method

.method public abstract getTaskMenuHeight(FLcom/android/launcher3/h0;FF)I
.end method

.method public abstract getTaskMenuWidth(Landroid/view/View;Lcom/android/launcher3/h0;I)I
.end method

.method public abstract getTaskMenuX(FLandroid/view/View;Lcom/android/launcher3/h0;FLandroid/view/View;)F
.end method

.method public abstract getTaskMenuY(FLandroid/view/View;ILandroid/view/View;FLandroid/view/View;)F
.end method

.method public abstract getUpDirection(Z)I
.end method

.method public abstract getUpDownSwipeDirection()Lcom/android/launcher3/touch/H$c;
.end method

.method public abstract isGoingUp(FZ)Z
.end method

.method public abstract isLayoutNaturalToLauncher()Z
.end method

.method public abstract measureGroupedTaskViewThumbnailBounds(Landroid/view/View;Landroid/view/View;IILcom/android/launcher3/util/y2$a;Lcom/android/launcher3/h0;ZZI)V
.end method

.method public abstract rotateInsets(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
.end method

.method public abstract set(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;II)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/android/launcher3/touch/G$c<",
            "TT;>;II)V"
        }
    .end annotation
.end method

.method public abstract setFloatingTaskPrimaryTranslation(Landroid/view/View;FLcom/android/launcher3/h0;)V
.end method

.method public abstract setIconAppChipChildrenParams(Landroid/widget/FrameLayout$LayoutParams;I)V
.end method

.method public abstract setIconAppChipMenuParams(Lcom/android/quickstep/views/IconAppChipView;Landroid/widget/FrameLayout$LayoutParams;II)V
.end method

.method public abstract setLayoutParamsForTaskMenuOptionItem(Landroid/widget/LinearLayout$LayoutParams;Landroid/widget/LinearLayout;Lcom/android/launcher3/h0;)V
.end method

.method public abstract synthetic setMaxScroll(Landroid/view/accessibility/AccessibilityEvent;I)V
.end method

.method public abstract setOverviewActionsLayoutParams(Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;ILcom/android/launcher3/h0;)I
.end method

.method public abstract synthetic setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$b;F)V
.end method

.method public abstract synthetic setPrimary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$c;I)V
.end method

.method public abstract setPrimaryScale(Landroid/view/View;F)V
.end method

.method public abstract setSecondary(Ljava/lang/Object;Lcom/android/launcher3/touch/G$b;F)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/android/launcher3/touch/G$b<",
            "TT;>;F)V"
        }
    .end annotation
.end method

.method public abstract setSecondaryScale(Landroid/view/View;F)V
.end method

.method public abstract setSplitIconParams(Landroid/view/View;Landroid/view/View;IIIIIZLcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;ZZI)V
.end method

.method public abstract setSplitInstructionsParams(Landroid/view/View;Lcom/android/launcher3/h0;II)V
.end method

.method public abstract setSplitTaskSwipeRect(Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/util/y2$a;I)V
.end method

.method public abstract setSplitTitleParams(Landroid/view/View;Landroid/view/View;IIIIIIIZLcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;)V
.end method

.method public abstract setTaskIconParams(Landroid/widget/FrameLayout$LayoutParams;IIIZ)V
.end method

.method public abstract setTaskLockIconOrientationState(Landroid/widget/FrameLayout$LayoutParams;IZ)V
.end method

.method public abstract setTaskOptionsMenuLayoutOrientation(Lcom/android/launcher3/h0;Landroid/widget/LinearLayout;ILandroid/graphics/drawable/ShapeDrawable;)V
.end method

.method public abstract setTaskThumbnailOrientationState(Landroid/widget/FrameLayout$LayoutParams;I)V
.end method

.method public abstract setTaskTitleAndIconOrientationState(Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;ZFFFFFIIII)V
.end method

.method public abstract setTranslationPrimary(Landroid/view/View;F)V
.end method

.method public abstract setTranslationSecondary(Landroid/view/View;F)V
.end method

.method public abstract updateDwbBannerLayout(IIZLcom/android/launcher3/h0;IILandroid/view/View;)V
.end method

.method public abstract updateGroupTaskIconAndTaskPosition(Lcom/android/quickstep/views/TaskViewIcon;IFLandroid/widget/FrameLayout$LayoutParams;Landroid/widget/TextView;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;)V
.end method

.method public abstract updateSplitIconParams(Landroid/view/View;FFFFIILcom/android/launcher3/h0;I)V
.end method

.method public abstract updateTaskExpectedWidthAndHeight(III)Landroid/graphics/Point;
.end method

.method public abstract updateTaskSizeAndPadding(Landroid/graphics/Rect;ILandroid/graphics/Rect;Ljava/lang/Boolean;)Landroid/graphics/Rect;
.end method
