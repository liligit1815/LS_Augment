.class public abstract Lcom/android/quickstep/util/AppPairLaunchTimings;
.super Ljava/lang/Object;
.source "AppPairLaunchTimings.kt"

# interfaces
.implements Lcom/android/quickstep/util/SplitAnimationTimings;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final getAppRevealEnd()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getAppRevealStart()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit16 p0, p0, 0xd9

    .line 6
    .line 7
    return p0
.end method

.method private final getAppRevealStart()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getStagedRectSlideEnd()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit8 p0, p0, 0x43

    .line 6
    .line 7
    return p0
.end method

.method private final getCellSplitEnd()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getCellSplitStart()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit16 p0, p0, 0x1f4

    .line 6
    .line 7
    return p0
.end method

.method private final getCellSplitStart()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getStagedRectSlideEnd()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const v0, 0x3f547ae1    # 0.83f

    .line 7
    .line 8
    .line 9
    mul-float/2addr p0, v0

    .line 10
    float-to-int p0, p0

    .line 11
    return p0
.end method

.method private final getIconFadeEnd()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getIconFadeStart()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit8 p0, p0, 0x53

    .line 6
    .line 7
    return p0
.end method

.method private final getIconFadeStart()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getStagedRectSlideEnd()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public getAppRevealEndOffset()F
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getAppRevealEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getDuration()I

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

.method public getAppRevealStartOffset()F
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getAppRevealStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getDuration()I

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

.method public getCellSplitEndOffset()F
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getCellSplitEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getDuration()I

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

.method public getCellSplitInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCellSplitStartOffset()F
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getCellSplitStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getDuration()I

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

.method public getIconFadeEndOffset()F
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getIconFadeEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getDuration()I

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

.method public getIconFadeInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconFadeStartOffset()F
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getIconFadeStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getDuration()I

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

.method public getPlaceholderFadeInEnd()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getPlaceholderFadeInStart()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getPlaceholderIconFadeInEnd()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getPlaceholderIconFadeInStart()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected abstract getSTAGED_RECT_SLIDE_DURATION()I
.end method

.method public getStagedRectScaleXInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStagedRectScaleYInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStagedRectSlideEnd()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getStagedRectSlideStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/AppPairLaunchTimings;->getSTAGED_RECT_SLIDE_DURATION()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public getStagedRectSlideStart()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getStagedRectXInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->b:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStagedRectYInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method
