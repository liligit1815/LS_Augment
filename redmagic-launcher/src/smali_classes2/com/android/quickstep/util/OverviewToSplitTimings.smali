.class abstract Lcom/android/quickstep/util/OverviewToSplitTimings;
.super Ljava/lang/Object;
.source "OverviewToSplitTimings.java"

# interfaces
.implements Lcom/android/quickstep/util/SplitAnimationTimings;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getActionsFadeEnd()I
    .locals 0

    .line 1
    const/16 p0, 0x53

    .line 2
    .line 3
    return p0
.end method

.method public getActionsFadeEndOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getActionsFadeEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public getActionsFadeStart()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getActionsFadeStartOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getActionsFadeStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public abstract getDuration()I
.end method

.method public abstract getGridSlideDuration()I
.end method

.method public getGridSlideDurationOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getGridSlideDuration()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public getGridSlidePrimaryInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGridSlideSecondaryInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract getGridSlideStagger()I
.end method

.method public getGridSlideStaggerOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getGridSlideStagger()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public abstract getGridSlideStart()I
.end method

.method public getGridSlideStartOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getGridSlideStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public getIconFadeEnd()I
    .locals 0

    .line 1
    const/16 p0, 0x53

    .line 2
    .line 3
    return p0
.end method

.method public getIconFadeEndOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getIconFadeEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public getIconFadeStart()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getIconFadeStartOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getIconFadeStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public getInstructionsContainerFadeInEnd()I
    .locals 0

    .line 1
    const/16 p0, 0xfa

    .line 2
    .line 3
    return p0
.end method

.method public getInstructionsContainerFadeInEndOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getInstructionsContainerFadeInEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public getInstructionsContainerFadeInStart()I
    .locals 0

    .line 1
    const/16 p0, 0xa7

    .line 2
    .line 3
    return p0
.end method

.method public getInstructionsContainerFadeInStartOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getInstructionsContainerFadeInStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public getInstructionsTextFadeInEnd()I
    .locals 0

    .line 1
    const/16 p0, 0x12c

    .line 2
    .line 3
    return p0
.end method

.method public getInstructionsTextFadeInEndOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getInstructionsTextFadeInEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public getInstructionsTextFadeInStart()I
    .locals 0

    .line 1
    const/16 p0, 0xd9

    .line 2
    .line 3
    return p0
.end method

.method public getInstructionsTextFadeInStartOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getInstructionsTextFadeInStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public getInstructionsUnfoldEnd()I
    .locals 0

    .line 1
    const/16 p0, 0x1f4

    .line 2
    .line 3
    return p0
.end method

.method public getInstructionsUnfoldEndOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getInstructionsUnfoldEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public getInstructionsUnfoldStart()I
    .locals 0

    .line 1
    const/16 p0, 0xa7

    .line 2
    .line 3
    return p0
.end method

.method public getInstructionsUnfoldStartOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getInstructionsUnfoldStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/OverviewToSplitTimings;->getDuration()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-float p0, p0

    .line 11
    div-float/2addr v0, p0

    .line 12
    return v0
.end method

.method public abstract getPlaceholderFadeInEnd()I
.end method

.method public abstract getPlaceholderFadeInStart()I
.end method

.method public abstract getPlaceholderIconFadeInEnd()I
.end method

.method public abstract getPlaceholderIconFadeInStart()I
.end method

.method public abstract getStagedRectScaleXInterpolator()Landroid/view/animation/Interpolator;
.end method

.method public abstract getStagedRectScaleYInterpolator()Landroid/view/animation/Interpolator;
.end method

.method public abstract getStagedRectSlideEnd()I
.end method

.method public abstract getStagedRectSlideStart()I
.end method

.method public abstract getStagedRectXInterpolator()Landroid/view/animation/Interpolator;
.end method

.method public abstract getStagedRectYInterpolator()Landroid/view/animation/Interpolator;
.end method
