.class abstract Lcom/android/quickstep/util/SplitToConfirmTimings;
.super Ljava/lang/Object;
.source "SplitToConfirmTimings.java"

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
.method public abstract getBackingScrimFadeInEnd()I
.end method

.method public getBackingScrimFadeInEndOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitToConfirmTimings;->getBackingScrimFadeInEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitToConfirmTimings;->getDuration()I

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

.method public abstract getBackingScrimFadeInStart()I
.end method

.method public getBackingScrimFadeInStartOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitToConfirmTimings;->getBackingScrimFadeInStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitToConfirmTimings;->getDuration()I

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

.method public getBackingScrimFadeInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract getDuration()I
.end method

.method public getInstructionsFadeEnd()I
    .locals 0

    .line 1
    const/16 p0, 0x43

    .line 2
    .line 3
    return p0
.end method

.method public getInstructionsFadeEndOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitToConfirmTimings;->getInstructionsFadeEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitToConfirmTimings;->getDuration()I

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

.method public getInstructionsFadeStart()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getInstructionsFadeStartOffset()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitToConfirmTimings;->getInstructionsFadeStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitToConfirmTimings;->getDuration()I

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

.method public abstract getStagedRectSlideEnd()I
.end method

.method public abstract getStagedRectSlideStart()I
.end method

.method public getStagedRectXInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->a:Landroid/view/animation/Interpolator;

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
