.class public Lcom/android/quickstep/util/TabletHomeToSplitTimings;
.super Lcom/android/quickstep/util/TabletOverviewToSplitTimings;
.source "TabletHomeToSplitTimings.java"

# interfaces
.implements Lcom/android/quickstep/util/SplitAnimationTimings;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/TabletOverviewToSplitTimings;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getScrimFadeInEnd()I
    .locals 0

    .line 1
    const/16 p0, 0xa7

    .line 2
    .line 3
    return p0
.end method

.method public getScrimFadeInEndOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/TabletHomeToSplitTimings;->getScrimFadeInEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/TabletOverviewToSplitTimings;->getDuration()I

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

.method public getScrimFadeInStart()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getScrimFadeInStartOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/TabletHomeToSplitTimings;->getScrimFadeInStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/TabletOverviewToSplitTimings;->getDuration()I

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

.method public getStagedRectScaleXInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStagedRectScaleYInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStagedRectXInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method
