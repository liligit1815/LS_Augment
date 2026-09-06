.class public interface abstract Lcom/android/quickstep/util/SplitAnimationTimings;
.super Ljava/lang/Object;
.source "SplitAnimationTimings.java"


# static fields
.field public static final ABORT_DURATION:I = 0x1f4

.field public static final DESKTOP_FADE_OUT_DURATION:I = 0xc8

.field public static final PHONE_APP_PAIR_LAUNCH:Lcom/android/quickstep/util/SplitAnimationTimings;

.field public static final PHONE_APP_PAIR_LAUNCH_DURATION:I = 0x393

.field public static final PHONE_CONFIRM_DURATION:I = 0x14d

.field public static final PHONE_ENTER_DURATION:I = 0x205

.field public static final PHONE_OVERVIEW_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

.field public static final PHONE_SPLIT_TO_CONFIRM:Lcom/android/quickstep/util/SplitAnimationTimings;

.field public static final TABLET_APP_PAIR_LAUNCH:Lcom/android/quickstep/util/SplitAnimationTimings;

.field public static final TABLET_APP_PAIR_LAUNCH_DURATION:I = 0x3e6

.field public static final TABLET_CONFIRM_DURATION:I = 0x1f4

.field public static final TABLET_ENTER_DURATION:I = 0x362

.field public static final TABLET_HOME_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

.field public static final TABLET_OVERVIEW_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

.field public static final TABLET_SPLIT_TO_CONFIRM:Lcom/android/quickstep/util/SplitAnimationTimings;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/TabletOverviewToSplitTimings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/TabletOverviewToSplitTimings;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_OVERVIEW_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 7
    .line 8
    new-instance v0, Lcom/android/quickstep/util/TabletHomeToSplitTimings;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/android/quickstep/util/TabletHomeToSplitTimings;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_HOME_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 14
    .line 15
    new-instance v0, Lcom/android/quickstep/util/TabletSplitToConfirmTimings;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/android/quickstep/util/TabletSplitToConfirmTimings;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_SPLIT_TO_CONFIRM:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 21
    .line 22
    new-instance v0, Lcom/android/quickstep/util/PhoneOverviewToSplitTimings;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/android/quickstep/util/PhoneOverviewToSplitTimings;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->PHONE_OVERVIEW_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 28
    .line 29
    new-instance v0, Lcom/android/quickstep/util/PhoneSplitToConfirmTimings;

    .line 30
    .line 31
    invoke-direct {v0}, Lcom/android/quickstep/util/PhoneSplitToConfirmTimings;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->PHONE_SPLIT_TO_CONFIRM:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 35
    .line 36
    new-instance v0, Lcom/android/quickstep/util/TabletAppPairLaunchTimings;

    .line 37
    .line 38
    invoke-direct {v0}, Lcom/android/quickstep/util/TabletAppPairLaunchTimings;-><init>()V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_APP_PAIR_LAUNCH:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 42
    .line 43
    new-instance v0, Lcom/android/quickstep/util/PhoneAppPairLaunchTimings;

    .line 44
    .line 45
    invoke-direct {v0}, Lcom/android/quickstep/util/PhoneAppPairLaunchTimings;-><init>()V

    .line 46
    .line 47
    .line 48
    sput-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->PHONE_APP_PAIR_LAUNCH:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public getActionsFadeEndOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getActionsFadeStartOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getAppRevealEndOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getAppRevealStartOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getCellSplitEndOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getCellSplitInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCellSplitStartOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getDesktopFadeSplitAnimationEndOffset()F
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 v0, 0x43480000    # 200.0f

    .line 7
    .line 8
    div-float/2addr v0, p0

    .line 9
    return v0
.end method

.method public getDesktopTaskFadeInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDesktopTaskScaleInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->k:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract getDuration()I
.end method

.method public getGridSlideDurationOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getGridSlidePrimaryInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGridSlideSecondaryInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGridSlideStaggerOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getGridSlideStartOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getIconFadeEndOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
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
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getInstructionsContainerFadeInEndOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getInstructionsContainerFadeInStartOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getInstructionsFadeEndOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getInstructionsFadeStartOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getInstructionsTextFadeInEndOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getInstructionsTextFadeInStartOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getInstructionsUnfoldEndOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getInstructionsUnfoldStartOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public abstract getPlaceholderFadeInEnd()I
.end method

.method public getPlaceholderFadeInEndOffset()F
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getPlaceholderFadeInEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

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

.method public abstract getPlaceholderFadeInStart()I
.end method

.method public getPlaceholderFadeInStartOffset()F
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getPlaceholderFadeInStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

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

.method public abstract getPlaceholderIconFadeInEnd()I
.end method

.method public getPlaceholderIconFadeInEndOffset()F
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getPlaceholderIconFadeInEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

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

.method public abstract getPlaceholderIconFadeInStart()I
.end method

.method public getPlaceholderIconFadeInStartOffset()F
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getPlaceholderIconFadeInStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

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

.method public getScrimFadeInEndOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getScrimFadeInStartOffset()F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public abstract getStagedRectScaleXInterpolator()Landroid/view/animation/Interpolator;
.end method

.method public abstract getStagedRectScaleYInterpolator()Landroid/view/animation/Interpolator;
.end method

.method public abstract getStagedRectSlideEnd()I
.end method

.method public getStagedRectSlideEndOffset()F
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideEnd()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

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

.method public abstract getStagedRectSlideStart()I
.end method

.method public getStagedRectSlideStartOffset()F
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideStart()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-interface {p0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

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

.method public abstract getStagedRectXInterpolator()Landroid/view/animation/Interpolator;
.end method

.method public abstract getStagedRectYInterpolator()Landroid/view/animation/Interpolator;
.end method
