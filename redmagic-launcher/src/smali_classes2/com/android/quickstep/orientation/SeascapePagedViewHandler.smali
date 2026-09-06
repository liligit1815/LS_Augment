.class public final Lcom/android/quickstep/orientation/SeascapePagedViewHandler;
.super Lcom/android/quickstep/orientation/LandscapePagedViewHandler;
.source "SeascapePagedViewHandler.kt"


# instance fields
.field private final degreesRotated:F

.field private final rotation:I

.field private final secondaryTranslationDirectionFactor:I

.field private final upDownSwipeDirection:Lcom/android/launcher3/touch/H$c;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->secondaryTranslationDirectionFactor:I

    .line 6
    .line 7
    const/high16 v0, 0x43870000    # 270.0f

    .line 8
    .line 9
    iput v0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->degreesRotated:F

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    iput v0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->rotation:I

    .line 13
    .line 14
    sget-object v0, Lcom/android/launcher3/touch/H;->x:Lcom/android/launcher3/touch/H$c;

    .line 15
    .line 16
    const-string v1, "HORIZONTAL"

    .line 17
    .line 18
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->upDownSwipeDirection:Lcom/android/launcher3/touch/H$c;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public adjustFloatingIconStartVelocity(Landroid/graphics/PointF;)V
    .locals 1

    .line 1
    const-string p0, "velocity"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p1, Landroid/graphics/PointF;->y:F

    .line 7
    .line 8
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 9
    .line 10
    neg-float v0, v0

    .line 11
    invoke-virtual {p1, p0, v0}, Landroid/graphics/PointF;->set(FF)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public calculateTargetTaskSecondaryPosition(Landroid/graphics/Rect;I)I
    .locals 0

    .line 1
    const-string p0, "taskSize"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p1, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    sub-int/2addr p0, p2

    .line 9
    return p0
.end method

.method public calculateTaskCenterSecondaryTranslation(Landroid/graphics/Rect;Landroid/view/View;I)F
    .locals 2

    .line 1
    const-string p0, "taskSize"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "taskView"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p0, p1, Landroid/graphics/Rect;->right:I

    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    int-to-float p1, p1

    .line 19
    const/high16 v0, 0x40000000    # 2.0f

    .line 20
    .line 21
    div-float/2addr p1, v0

    .line 22
    sub-float/2addr p0, p1

    .line 23
    invoke-virtual {p2}, Landroid/view/View;->getX()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    int-to-float v1, p3

    .line 28
    add-float/2addr p1, v1

    .line 29
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    sub-int/2addr p2, p3

    .line 34
    int-to-float p2, p2

    .line 35
    div-float/2addr p2, v0

    .line 36
    add-float/2addr p1, p2

    .line 37
    sub-float/2addr p0, p1

    .line 38
    const/16 p1, 0x1b

    .line 39
    .line 40
    int-to-float p1, p1

    .line 41
    sub-float/2addr p0, p1

    .line 42
    return p0
.end method

.method public getDegreesRotated()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->degreesRotated:F

    .line 2
    .line 3
    return p0
.end method

.method public getDistanceToBottomOfRect(Lcom/android/launcher3/h0;Landroid/graphics/Rect;)I
    .locals 0

    .line 1
    const-string p0, "dp"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "rect"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p0, p1, Lcom/android/launcher3/h0;->T0:I

    .line 12
    .line 13
    iget p1, p2, Landroid/graphics/Rect;->right:I

    .line 14
    .line 15
    sub-int/2addr p0, p1

    .line 16
    return p0
.end method

.method public getDownDirection(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x2

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
.end method

.method public getDwbBannerTranslations(IILcom/android/launcher3/util/y2$a;Lcom/android/launcher3/h0;[Landroid/view/View;ILandroid/view/View;)Landroid/util/Pair;
    .locals 0
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

    .line 1
    const-string p0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "thumbnailViews"

    .line 7
    .line 8
    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "banner"

    .line 12
    .line 13
    invoke-static {p7, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    aget-object p0, p5, p0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p4, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 24
    .line 25
    invoke-static {p0, p4}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    invoke-virtual {p7}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result p4

    .line 34
    sub-int/2addr p1, p4

    .line 35
    int-to-float p1, p1

    .line 36
    if-nez p3, :cond_0

    .line 37
    .line 38
    invoke-virtual {p7}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    :goto_0
    int-to-float p0, p0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    iget p4, p3, Lcom/android/launcher3/util/y2$a;->k:I

    .line 45
    .line 46
    if-ne p6, p4, :cond_1

    .line 47
    .line 48
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->c()F

    .line 49
    .line 50
    .line 51
    move-result p4

    .line 52
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    add-float/2addr p4, p3

    .line 57
    invoke-virtual {p7}, Landroid/view/View;->getHeight()I

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    int-to-float p3, p3

    .line 62
    iget p0, p0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 63
    .line 64
    sub-int/2addr p2, p0

    .line 65
    int-to-float p0, p2

    .line 66
    mul-float/2addr p0, p4

    .line 67
    sub-float p0, p3, p0

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_1
    invoke-virtual {p7}, Landroid/view/View;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    goto :goto_0

    .line 75
    :goto_1
    new-instance p2, Landroid/util/Pair;

    .line 76
    .line 77
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-direct {p2, p1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    return-object p2
.end method

.method public getGroupedTaskViewSizes(Lcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;III)Landroid/util/Pair;
    .locals 0
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

    .line 1
    const-string p5, "dp"

    .line 2
    .line 3
    invoke-static {p1, p5}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "splitBoundsConfig"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p4, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDividerBarSize(ILcom/android/launcher3/util/y2$a;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p2}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    new-instance p2, Landroid/graphics/Point;

    .line 20
    .line 21
    int-to-float p5, p4

    .line 22
    mul-float/2addr p5, p1

    .line 23
    float-to-int p1, p5

    .line 24
    invoke-direct {p2, p3, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Landroid/graphics/Point;

    .line 28
    .line 29
    iget p5, p2, Landroid/graphics/Point;->y:I

    .line 30
    .line 31
    sub-int/2addr p4, p5

    .line 32
    sub-int/2addr p4, p0

    .line 33
    invoke-direct {p1, p3, p4}, Landroid/graphics/Point;-><init>(II)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Landroid/util/Pair;

    .line 37
    .line 38
    invoke-direct {p0, p2, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-object p0
.end method

.method public getHandlerTypeForLogging()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$OrientationHandler;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$OrientationHandler;->SEASCAPE:Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer$OrientationHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPrimaryGridEnd(ZLandroid/graphics/Rect;)I
    .locals 0

    .line 1
    const-string p0, "rect"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 12
    .line 13
    return p0
.end method

.method public getPrimaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;)TT;"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getPrimaryValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getRecentsRtlSetting(Landroid/content/res/Resources;)Z
    .locals 0

    .line 1
    const-string p0, "resources"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public getRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->rotation:I

    .line 2
    .line 3
    return p0
.end method

.method public getSecondaryDimension(Landroid/view/View;Lcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "dp"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x2

    .line 12
    new-array p0, p0, [I

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 p2, 0x0

    .line 22
    aget p0, p0, p2

    .line 23
    .line 24
    add-int/2addr p1, p0

    .line 25
    return p1
.end method

.method public getSecondaryTranslationDirectionFactor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->secondaryTranslationDirectionFactor:I

    .line 2
    .line 3
    return p0
.end method

.method public getSecondaryTranslationFactor()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public getSplitIconsPosition(IIIZIIZ)Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    if-eqz p4, :cond_0

    .line 9
    .line 10
    new-instance p1, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 11
    .line 12
    sub-int/2addr p3, p2

    .line 13
    invoke-direct {p1, p3, p0}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;-><init>(II)V

    .line 14
    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_0
    new-instance p1, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 18
    .line 19
    add-int/2addr p2, p6

    .line 20
    neg-int p2, p2

    .line 21
    invoke-direct {p1, p0, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;-><init>(II)V

    .line 22
    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_1
    if-eqz p7, :cond_2

    .line 26
    .line 27
    sub-int/2addr p6, p1

    .line 28
    div-int/lit8 p6, p6, 0x2

    .line 29
    .line 30
    add-int/2addr p2, p6

    .line 31
    new-instance p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 32
    .line 33
    invoke-direct {p0, p2, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;-><init>(II)V

    .line 34
    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_2
    new-instance p0, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;

    .line 38
    .line 39
    sub-int p1, p2, p1

    .line 40
    .line 41
    add-int/2addr p2, p6

    .line 42
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler$SplitIconPositions;-><init>(II)V

    .line 43
    .line 44
    .line 45
    return-object p0
.end method

.method public getSplitPositionOptions(Lcom/android/launcher3/h0;)Ljava/util/List;
    .locals 3
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

    .line 1
    const-string p0, "dp"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/android/launcher3/util/y2$b;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    const/4 v0, 0x0

    .line 10
    const v1, 0x7f080d71

    .line 11
    .line 12
    .line 13
    const v2, 0x7f140328

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, v1, v2, p1, v0}, Lcom/android/launcher3/util/y2$b;-><init>(IIII)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public getSplitTranslationDirectionFactor(ILcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    const-string p0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    :cond_0
    return p0
.end method

.method public getTaskDismissLength(ILandroid/graphics/Rect;)I
    .locals 0

    .line 1
    const-string p0, "taskThumbnailBounds"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p2, Landroid/graphics/Rect;->right:I

    .line 7
    .line 8
    return p0
.end method

.method public getTaskDismissVerticalDirection()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getTaskDragDisplacementFactor(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
.end method

.method public getTaskLaunchLength(ILandroid/graphics/Rect;)I
    .locals 0

    .line 1
    const-string p0, "taskThumbnailBounds"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p2, Landroid/graphics/Rect;->right:I

    .line 7
    .line 8
    sub-int/2addr p1, p0

    .line 9
    return p1
.end method

.method public getTaskLockDirectionFactor()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public getTaskMenuHeight(FLcom/android/launcher3/h0;FF)I
    .locals 0

    .line 1
    const-string p0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p2, Lcom/android/launcher3/h0;->V0:I

    .line 7
    .line 8
    int-to-float p0, p0

    .line 9
    sub-float/2addr p0, p1

    .line 10
    sub-float/2addr p0, p3

    .line 11
    float-to-int p0, p0

    .line 12
    return p0
.end method

.method public getTaskMenuX(FLandroid/view/View;Lcom/android/launcher3/h0;FLandroid/view/View;)F
    .locals 0

    .line 1
    const-string p0, "thumbnailView"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "deviceProfile"

    .line 7
    .line 8
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "taskViewIcon"

    .line 12
    .line 13
    invoke-static {p5, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    add-float/2addr p1, p4

    .line 17
    return p1
.end method

.method public getTaskMenuY(FLandroid/view/View;ILandroid/view/View;FLandroid/view/View;)F
    .locals 0

    .line 1
    const-string p0, "thumbnailView"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "taskMenuView"

    .line 7
    .line 8
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "taskViewIcon"

    .line 12
    .line 13
    invoke-static {p6, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    return p1

    .line 23
    :cond_0
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p4, "null cannot be cast to non-null type com.android.launcher3.views.BaseDragLayer.LayoutParams"

    .line 28
    .line 29
    invoke-static {p0, p4}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    check-cast p0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 33
    .line 34
    iget p0, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 35
    .line 36
    const/4 p4, -0x1

    .line 37
    if-ne p3, p4, :cond_1

    .line 38
    .line 39
    add-float/2addr p1, p5

    .line 40
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    add-int/2addr p2, p0

    .line 45
    int-to-float p0, p2

    .line 46
    const/high16 p2, 0x40000000    # 2.0f

    .line 47
    .line 48
    div-float/2addr p0, p2

    .line 49
    add-float/2addr p1, p0

    .line 50
    return p1

    .line 51
    :cond_1
    int-to-float p0, p0

    .line 52
    add-float/2addr p1, p0

    .line 53
    add-float/2addr p1, p5

    .line 54
    return p1
.end method

.method public getUpDirection(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x2

    .line 6
    return p0
.end method

.method public getUpDownSwipeDirection()Lcom/android/launcher3/touch/H$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->upDownSwipeDirection:Lcom/android/launcher3/touch/H$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public isGoingUp(FZ)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p2, :cond_1

    .line 5
    .line 6
    cmpl-float p1, p1, v1

    .line 7
    .line 8
    if-lez p1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    return p0

    .line 12
    :cond_1
    cmpg-float p1, p1, v1

    .line 13
    .line 14
    if-gez p1, :cond_2

    .line 15
    .line 16
    return v0

    .line 17
    :cond_2
    return p0
.end method

.method public measureGroupedTaskViewThumbnailBounds(Landroid/view/View;Landroid/view/View;IILcom/android/launcher3/util/y2$a;Lcom/android/launcher3/h0;ZZI)V
    .locals 6

    .line 1
    const-string p7, "primarySnapshot"

    .line 2
    .line 3
    invoke-static {p1, p7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p7, "secondarySnapshot"

    .line 7
    .line 8
    invoke-static {p2, p7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p7, "splitBoundsConfig"

    .line 12
    .line 13
    invoke-static {p5, p7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p7, "dp"

    .line 17
    .line 18
    invoke-static {p6, p7}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object p7

    .line 25
    const-string p8, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 26
    .line 27
    invoke-static {p7, p8}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    check-cast p7, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0, p8}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 40
    .line 41
    const/4 p8, 0x0

    .line 42
    iput p8, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 43
    .line 44
    iput p8, p7, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 45
    .line 46
    invoke-virtual {p0, p4, p5}, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;->getDividerBarSize(ILcom/android/launcher3/util/y2$a;)I

    .line 47
    .line 48
    .line 49
    move-result p7

    .line 50
    sub-int v3, p3, p9

    .line 51
    .line 52
    move-object v0, p0

    .line 53
    move v4, p4

    .line 54
    move-object v2, p5

    .line 55
    move-object v1, p6

    .line 56
    move v5, p9

    .line 57
    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->getGroupedTaskViewSizes(Lcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;III)Landroid/util/Pair;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iget-object p3, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p3, Landroid/graphics/Point;

    .line 64
    .line 65
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast p0, Landroid/graphics/Point;

    .line 68
    .line 69
    const/4 p4, 0x0

    .line 70
    invoke-virtual {p2, p4}, Landroid/view/View;->setTranslationY(F)V

    .line 71
    .line 72
    .line 73
    iget p4, p0, Landroid/graphics/Point;->y:I

    .line 74
    .line 75
    add-int/2addr p4, p7

    .line 76
    int-to-float p4, p4

    .line 77
    invoke-virtual {p1, p4}, Landroid/view/View;->setTranslationY(F)V

    .line 78
    .line 79
    .line 80
    iget p4, p3, Landroid/graphics/Point;->x:I

    .line 81
    .line 82
    const/high16 p5, 0x40000000    # 2.0f

    .line 83
    .line 84
    invoke-static {p4, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 85
    .line 86
    .line 87
    move-result p4

    .line 88
    iget p3, p3, Landroid/graphics/Point;->y:I

    .line 89
    .line 90
    invoke-static {p3, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    invoke-virtual {p1, p4, p3}, Landroid/view/View;->measure(II)V

    .line 95
    .line 96
    .line 97
    iget p1, p0, Landroid/graphics/Point;->x:I

    .line 98
    .line 99
    invoke-static {p1, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 104
    .line 105
    invoke-static {p0, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    invoke-virtual {p2, p1, p0}, Landroid/view/View;->measure(II)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public rotateInsets(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    const-string p0, "insets"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "outInsets"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p0, p1, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 14
    .line 15
    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 16
    .line 17
    iget p1, p1, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0, v1, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setIconAppChipChildrenParams(Landroid/widget/FrameLayout$LayoutParams;I)V
    .locals 0

    .line 1
    const-string p0, "iconParams"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-virtual {p1, p0, p0, p0, p0}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 11
    .line 12
    .line 13
    const p0, 0x800013

    .line 14
    .line 15
    .line 16
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 17
    .line 18
    return-void
.end method

.method public setIconAppChipMenuParams(Lcom/android/quickstep/views/IconAppChipView;Landroid/widget/FrameLayout$LayoutParams;II)V
    .locals 4

    .line 1
    const-string v0, "iconAppChipView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "iconMenuParams"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutDirection()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    const/4 v2, 0x1

    .line 17
    if-ne v0, v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v2, v1

    .line 21
    :goto_0
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-float v0, v0

    .line 26
    const/high16 v3, 0x40000000    # 2.0f

    .line 27
    .line 28
    div-float/2addr v0, v3

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    const v0, 0x800033

    .line 32
    .line 33
    .line 34
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 35
    .line 36
    iput p3, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 37
    .line 38
    invoke-virtual {p2, p4}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 39
    .line 40
    .line 41
    iget p3, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 42
    .line 43
    int-to-float p3, p3

    .line 44
    div-float/2addr p3, v3

    .line 45
    invoke-virtual {p1, p3}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 46
    .line 47
    .line 48
    iget p3, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 49
    .line 50
    int-to-float p3, p3

    .line 51
    div-float/2addr p3, v3

    .line 52
    invoke-virtual {p1, p3}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    const p4, 0x800055

    .line 57
    .line 58
    .line 59
    iput p4, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 60
    .line 61
    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 62
    .line 63
    invoke-virtual {p2, v1}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 67
    .line 68
    .line 69
    int-to-float p3, p3

    .line 70
    sub-float/2addr v0, p3

    .line 71
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 72
    .line 73
    .line 74
    :goto_1
    invoke-virtual {p2, v1}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 75
    .line 76
    .line 77
    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 78
    .line 79
    const/4 p2, 0x0

    .line 80
    invoke-virtual {p1, p2}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationY(F)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->getDegreesRotated()F

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->setRotation(F)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public setOverviewActionsLayoutParams(Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;ILcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "params"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "deviceProfile"

    .line 12
    .line 13
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget p0, p4, Lcom/android/launcher3/X3;->k0:I

    .line 17
    .line 18
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 19
    .line 20
    iget p1, p4, Lcom/android/launcher3/h0;->U0:I

    .line 21
    .line 22
    iget p3, p4, Lcom/android/launcher3/h0;->T0:I

    .line 23
    .line 24
    sub-int/2addr p1, p3

    .line 25
    div-int/lit8 p1, p1, 0x2

    .line 26
    .line 27
    sub-int/2addr p1, p0

    .line 28
    iput p1, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 29
    .line 30
    iget p1, p4, Lcom/android/launcher3/X3;->l0:I

    .line 31
    .line 32
    add-int/2addr p0, p1

    .line 33
    sub-int/2addr p3, p0

    .line 34
    return p3
.end method

.method public final setSplitIconParamsMFV(Landroid/view/View;Landroid/view/View;IIIIIZLcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;I)V
    .locals 0

    .line 1
    const-string p0, "primaryIconView"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "secondaryIconView"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "splitConfig"

    .line 12
    .line 13
    invoke-static {p10, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p4, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 21
    .line 22
    invoke-static {p0, p4}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    new-instance p4, Landroid/widget/FrameLayout$LayoutParams;

    .line 28
    .line 29
    invoke-direct {p4, p0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    iget-boolean p9, p10, Lcom/android/launcher3/util/y2$a;->i:Z

    .line 33
    .line 34
    if-eqz p9, :cond_0

    .line 35
    .line 36
    invoke-virtual {p10}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 37
    .line 38
    .line 39
    move-result p7

    .line 40
    int-to-float p6, p6

    .line 41
    mul-float/2addr p7, p6

    .line 42
    float-to-int p6, p7

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p10}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 45
    .line 46
    .line 47
    move-result p6

    .line 48
    int-to-float p7, p7

    .line 49
    mul-float/2addr p6, p7

    .line 50
    float-to-int p6, p6

    .line 51
    :goto_0
    const p7, 0x800003

    .line 52
    .line 53
    .line 54
    const p9, 0x800005

    .line 55
    .line 56
    .line 57
    if-eqz p8, :cond_1

    .line 58
    .line 59
    move p10, p9

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    move p10, p7

    .line 62
    :goto_1
    or-int/lit8 p10, p10, 0x30

    .line 63
    .line 64
    iput p10, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 65
    .line 66
    sub-int p3, p5, p3

    .line 67
    .line 68
    iput p3, p0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 69
    .line 70
    const/4 p3, 0x0

    .line 71
    invoke-virtual {p1, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    .line 76
    .line 77
    if-eqz p8, :cond_2

    .line 78
    .line 79
    move p7, p9

    .line 80
    :cond_2
    or-int/lit8 p0, p7, 0x30

    .line 81
    .line 82
    iput p0, p4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 83
    .line 84
    add-int/2addr p5, p6

    .line 85
    iput p5, p4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 86
    .line 87
    invoke-virtual {p2, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2, p4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public setSplitInstructionsParams(Landroid/view/View;Lcom/android/launcher3/h0;II)V
    .locals 2

    .line 1
    const-string v0, "out"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dp"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotX(F)V

    .line 13
    .line 14
    .line 15
    int-to-float v0, p3

    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotY(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->getDegreesRotated()F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p1, p0}, Landroid/view/View;->setRotation(F)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const v0, 0x7f070a86

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 42
    .line 43
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 54
    .line 55
    sub-int/2addr v1, p2

    .line 56
    div-int/lit8 v1, v1, 0x2

    .line 57
    .line 58
    sub-int p0, p4, p0

    .line 59
    .line 60
    add-int/2addr p0, v0

    .line 61
    int-to-float p0, p0

    .line 62
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 63
    .line 64
    .line 65
    neg-int p0, p3

    .line 66
    add-int/2addr p0, p4

    .line 67
    int-to-float p0, p0

    .line 68
    const/high16 p2, 0x40000000    # 2.0f

    .line 69
    .line 70
    div-float/2addr p0, p2

    .line 71
    int-to-float p2, v1

    .line 72
    add-float/2addr p0, p2

    .line 73
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p2, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 81
    .line 82
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 86
    .line 87
    const/16 p2, 0x15

    .line 88
    .line 89
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 90
    .line 91
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public setSplitTaskSwipeRect(Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/util/y2$a;I)V
    .locals 0

    .line 1
    const-string p0, "dp"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "outRect"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "splitInfo"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p3}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p4, :cond_0

    .line 25
    .line 26
    iget p1, p2, Landroid/graphics/Rect;->top:I

    .line 27
    .line 28
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    int-to-float p3, p3

    .line 33
    const/4 p4, 0x1

    .line 34
    int-to-float p4, p4

    .line 35
    sub-float/2addr p4, p0

    .line 36
    mul-float/2addr p3, p4

    .line 37
    float-to-int p0, p3

    .line 38
    add-int/2addr p1, p0

    .line 39
    iput p1, p2, Landroid/graphics/Rect;->top:I

    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget p3, p2, Landroid/graphics/Rect;->bottom:I

    .line 43
    .line 44
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 45
    .line 46
    .line 47
    move-result p4

    .line 48
    int-to-float p4, p4

    .line 49
    add-float/2addr p0, p1

    .line 50
    mul-float/2addr p4, p0

    .line 51
    float-to-int p0, p4

    .line 52
    sub-int/2addr p3, p0

    .line 53
    iput p3, p2, Landroid/graphics/Rect;->bottom:I

    .line 54
    .line 55
    return-void
.end method

.method public setSplitTitleParams(Landroid/view/View;Landroid/view/View;IIIIIIIZLcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;)V
    .locals 7

    .line 1
    move-object/from16 v0, p11

    .line 2
    .line 3
    move-object/from16 v1, p12

    .line 4
    .line 5
    const-string v2, "primaryTitleView"

    .line 6
    .line 7
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v2, "secondaryTitleView"

    .line 11
    .line 12
    invoke-static {p2, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v2, "deviceProfile"

    .line 16
    .line 17
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v2, "splitConfig"

    .line 21
    .line 22
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 30
    .line 31
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 35
    .line 36
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 37
    .line 38
    invoke-direct {v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    iget-boolean v4, v1, Lcom/android/launcher3/util/y2$a;->i:Z

    .line 42
    .line 43
    if-eqz v4, :cond_0

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 46
    .line 47
    .line 48
    move-result p4

    .line 49
    int-to-float p3, p3

    .line 50
    mul-float/2addr p4, p3

    .line 51
    float-to-int p3, p4

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {v1}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    int-to-float p4, p4

    .line 58
    mul-float/2addr p3, p4

    .line 59
    float-to-int p3, p3

    .line 60
    :goto_0
    const/4 p4, 0x0

    .line 61
    invoke-virtual {p1, p4}, Landroid/view/View;->setPivotX(F)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, p4}, Landroid/view/View;->setPivotY(F)V

    .line 65
    .line 66
    .line 67
    const v1, 0x800003

    .line 68
    .line 69
    .line 70
    const v4, 0x800005

    .line 71
    .line 72
    .line 73
    if-eqz p10, :cond_1

    .line 74
    .line 75
    move v5, v4

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    move v5, v1

    .line 78
    :goto_1
    or-int/lit8 v5, v5, 0x30

    .line 79
    .line 80
    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 81
    .line 82
    instance-of v5, p1, Landroid/widget/TextView;

    .line 83
    .line 84
    if-eqz v5, :cond_3

    .line 85
    .line 86
    move-object v5, p1

    .line 87
    check-cast v5, Landroid/widget/TextView;

    .line 88
    .line 89
    if-eqz p10, :cond_2

    .line 90
    .line 91
    move v6, v4

    .line 92
    goto :goto_2

    .line 93
    :cond_2
    move v6, v1

    .line 94
    :goto_2
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 95
    .line 96
    .line 97
    :cond_3
    sub-int v5, p7, p5

    .line 98
    .line 99
    sub-int v5, v5, p9

    .line 100
    .line 101
    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 102
    .line 103
    const/4 v5, 0x0

    .line 104
    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 105
    .line 106
    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 107
    .line 108
    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 109
    .line 110
    iget v6, v0, Lcom/android/launcher3/X3;->g0:I

    .line 111
    .line 112
    iput v6, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 113
    .line 114
    int-to-float v6, p8

    .line 115
    invoke-virtual {p1, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, p4}, Landroid/view/View;->setTranslationY(F)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    .line 123
    .line 124
    if-eqz p10, :cond_4

    .line 125
    .line 126
    move p1, v4

    .line 127
    goto :goto_3

    .line 128
    :cond_4
    move p1, v1

    .line 129
    :goto_3
    or-int/lit8 p1, p1, 0x30

    .line 130
    .line 131
    iput p1, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 132
    .line 133
    instance-of p1, p2, Landroid/widget/TextView;

    .line 134
    .line 135
    if-eqz p1, :cond_6

    .line 136
    .line 137
    move-object p1, p2

    .line 138
    check-cast p1, Landroid/widget/TextView;

    .line 139
    .line 140
    if-eqz p10, :cond_5

    .line 141
    .line 142
    goto :goto_4

    .line 143
    :cond_5
    move v1, v4

    .line 144
    :goto_4
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 145
    .line 146
    .line 147
    :cond_6
    add-int p1, p7, p3

    .line 148
    .line 149
    add-int/2addr p1, p5

    .line 150
    add-int p1, p1, p9

    .line 151
    .line 152
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 153
    .line 154
    .line 155
    move-result p3

    .line 156
    add-int/2addr p1, p3

    .line 157
    iput p1, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 158
    .line 159
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 160
    .line 161
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 162
    .line 163
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 164
    .line 165
    iget p1, v0, Lcom/android/launcher3/X3;->g0:I

    .line 166
    .line 167
    iput p1, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 168
    .line 169
    invoke-virtual {p2, p4}, Landroid/view/View;->setPivotX(F)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p2, p4}, Landroid/view/View;->setPivotY(F)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->getDegreesRotated()F

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    invoke-virtual {p2, p0}, Landroid/view/View;->setRotation(F)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p2, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p2, p4}, Landroid/view/View;->setTranslationY(F)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public setTaskIconParams(Landroid/widget/FrameLayout$LayoutParams;IIIZ)V
    .locals 0

    .line 1
    const-string p0, "iconParams"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p5, :cond_0

    .line 7
    .line 8
    const p0, 0x800015

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const p0, 0x800013

    .line 13
    .line 14
    .line 15
    :goto_0
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 16
    .line 17
    neg-int p0, p3

    .line 18
    div-int/lit8 p2, p2, 0x2

    .line 19
    .line 20
    sub-int/2addr p0, p2

    .line 21
    div-int/lit8 p4, p4, 0x2

    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p1, p0, p4, p2, p2}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setTaskLockIconOrientationState(Landroid/widget/FrameLayout$LayoutParams;IZ)V
    .locals 0

    .line 1
    const-string p0, "lockIconParams"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    const p0, 0x800005

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const p0, 0x800003

    .line 13
    .line 14
    .line 15
    :goto_0
    or-int/lit8 p0, p0, 0x10

    .line 16
    .line 17
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 21
    .line 22
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 23
    .line 24
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 25
    .line 26
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 27
    .line 28
    return-void
.end method

.method public setTaskThumbnailOrientationState(Landroid/widget/FrameLayout$LayoutParams;I)V
    .locals 0

    .line 1
    const-string p0, "thumbnailParams"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 10
    .line 11
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 12
    .line 13
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 14
    .line 15
    return-void
.end method

.method public setTaskTitleAndIconOrientationState(Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;ZFFFFFIIII)V
    .locals 7

    move/from16 v1, p14

    const-string v2, "titleParams"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "iconParams"

    invoke-static {p2, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "splitIconParams"

    invoke-static {p3, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "menuIconParams"

    invoke-static {p4, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p5, :cond_0

    const v2, 0x800055

    goto :goto_0

    :cond_0
    const v2, 0x800033

    .line 1
    :goto_0
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/4 v3, 0x0

    .line 2
    iput v3, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    const/high16 v4, 0x40000000    # 2.0f

    if-eqz p5, :cond_1

    add-float v5, p8, p10

    add-float v5, v5, p9

    div-float v6, p6, v4

    add-float/2addr v5, v6

    div-float v6, p7, v4

    sub-float/2addr v5, v6

    .line 3
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    goto :goto_1

    :cond_1
    move v5, v3

    .line 4
    :goto_1
    iput v5, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    if-eqz p5, :cond_2

    move v5, v3

    goto :goto_2

    :cond_2
    neg-float v5, p7

    div-float/2addr v5, v4

    mul-float v6, p8, v4

    add-float/2addr v5, v6

    add-float v5, v5, p9

    div-float v6, p6, v4

    add-float/2addr v5, v6

    .line 5
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 6
    :goto_2
    iput v5, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    neg-float p0, p6

    div-float/2addr p0, v4

    move/from16 v5, p11

    int-to-float v5, v5

    add-float/2addr p0, v5

    div-float v0, p7, v4

    add-float/2addr p0, v0

    .line 7
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 8
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 9
    iput v3, p2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    if-eqz p5, :cond_3

    .line 10
    invoke-static {p8}, Ljava/lang/Math;->round(F)I

    move-result p0

    goto :goto_3

    :cond_3
    move p0, v3

    :goto_3
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    if-eqz p5, :cond_4

    move p0, v3

    goto :goto_4

    .line 11
    :cond_4
    invoke-static {p8}, Ljava/lang/Math;->round(F)I

    move-result p0

    :goto_4
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 12
    iput v3, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    const p0, 0x800053

    const p1, 0x800035

    if-eqz p5, :cond_5

    move p2, p1

    goto :goto_5

    :cond_5
    move p2, p0

    .line 13
    :goto_5
    iput p2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 14
    iput v3, p3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    if-eqz p5, :cond_6

    move p2, v3

    goto :goto_6

    :cond_6
    add-int p2, p12, p13

    .line 15
    :goto_6
    iput p2, p3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    if-eqz p5, :cond_7

    add-int p2, p12, p13

    goto :goto_7

    :cond_7
    move p2, v3

    .line 16
    :goto_7
    iput p2, p3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 17
    iput v1, p3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    if-eqz p5, :cond_8

    move p0, p1

    .line 18
    :cond_8
    iput p0, p4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 19
    iput v3, p4, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 20
    iput v3, p4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 21
    iput v3, p4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 22
    iput v1, p4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    return-void
.end method

.method public setTranslationSecondary(Landroid/view/View;F)V
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public updateDwbBannerLayout(IIZLcom/android/launcher3/h0;IILandroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p4, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "banner"

    .line 7
    .line 8
    invoke-static {p7, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p7, p1}, Landroid/view/View;->setPivotX(F)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p7, p1}, Landroid/view/View;->setPivotY(F)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;->getDegreesRotated()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p7, p0}, Landroid/view/View;->setRotation(F)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 32
    .line 33
    invoke-virtual {p7}, Landroid/view/View;->isLayoutRtl()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    const p1, 0x800005

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const p1, 0x800003

    .line 44
    .line 45
    .line 46
    :goto_0
    or-int/lit8 p1, p1, 0x50

    .line 47
    .line 48
    iput p1, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 49
    .line 50
    if-eqz p3, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    iget p1, p4, Lcom/android/launcher3/h0;->S2:I

    .line 54
    .line 55
    sub-int p6, p2, p1

    .line 56
    .line 57
    :goto_1
    iput p6, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 58
    .line 59
    invoke-virtual {p7, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    .line 64
    .line 65
    const-string p1, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 66
    .line 67
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw p0
.end method

.method public updateGroupTaskIconAndTaskPosition(Lcom/android/quickstep/views/TaskViewIcon;IFLandroid/widget/FrameLayout$LayoutParams;Landroid/widget/TextView;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

    .line 1
    const-string p0, "iconView"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "primaryIconParams"

    .line 7
    .line 8
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "primaryTitleLayoutParams"

    .line 12
    .line 13
    invoke-static {p6, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "secondaryTitleLayoutParams"

    .line 17
    .line 18
    invoke-static {p7, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    int-to-float p1, p2

    .line 26
    add-float/2addr p3, p1

    .line 27
    neg-float p1, p3

    .line 28
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 29
    .line 30
    .line 31
    iget p0, p6, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 32
    .line 33
    int-to-float p0, p0

    .line 34
    iget p1, p6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 35
    .line 36
    int-to-float p1, p1

    .line 37
    const/high16 p2, 0x40000000    # 2.0f

    .line 38
    .line 39
    div-float/2addr p1, p2

    .line 40
    add-float/2addr p0, p1

    .line 41
    iget p1, p7, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 42
    .line 43
    int-to-float p1, p1

    .line 44
    div-float/2addr p1, p2

    .line 45
    sub-float/2addr p0, p1

    .line 46
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    iput p0, p7, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 51
    .line 52
    if-eqz p5, :cond_0

    .line 53
    .line 54
    iget p0, p7, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 55
    .line 56
    int-to-float p0, p0

    .line 57
    div-float/2addr p0, p2

    .line 58
    add-float/2addr p3, p0

    .line 59
    iget p0, p6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 60
    .line 61
    int-to-float p0, p0

    .line 62
    div-float/2addr p0, p2

    .line 63
    sub-float/2addr p3, p0

    .line 64
    neg-float p0, p3

    .line 65
    invoke-virtual {p5, p0}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void
.end method

.method public updateSplitIconsPosition(Landroid/view/View;IZ)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded"
        }
    .end annotation

    .line 1
    const-string p0, "iconView"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v0, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 11
    .line 12
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    check-cast p1, Lcom/android/quickstep/views/IconAppChipView;

    .line 25
    .line 26
    if-eqz p3, :cond_0

    .line 27
    .line 28
    const p3, 0x800033

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const p3, 0x800055

    .line 33
    .line 34
    .line 35
    :goto_0
    iput p3, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v1}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationX(F)V

    .line 41
    .line 42
    .line 43
    int-to-float p0, p2

    .line 44
    invoke-virtual {p1, p0}, Lcom/android/quickstep/views/IconAppChipView;->setSplitTranslationY(F)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    const/16 p3, 0x53

    .line 49
    .line 50
    iput p3, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 56
    .line 57
    .line 58
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public updateTaskSizeAndPadding(Landroid/graphics/Rect;ILandroid/graphics/Rect;Ljava/lang/Boolean;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    const-string p0, "tempRect"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget p0, p1, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    sub-int/2addr p0, p2

    .line 9
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 10
    .line 11
    return-object p1
.end method
