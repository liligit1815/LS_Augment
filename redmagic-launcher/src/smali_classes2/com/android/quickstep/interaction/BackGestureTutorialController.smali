.class final Lcom/android/quickstep/interaction/BackGestureTutorialController;
.super Lcom/android/quickstep/interaction/TutorialController;
.source "BackGestureTutorialController.java"


# static fields
.field private static final EXITING_APP_MIN_SIZE_PERCENTAGE:F = 0.8f

.field private static final Y_TRANSLATION_SMOOTHENING_FACTOR:F = 0.2f


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/BackGestureTutorialFragment;Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V
    .locals 7

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/interaction/TutorialController;-><init>(Lcom/android/quickstep/interaction/TutorialFragment;Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 5
    .line 6
    iget-object v0, p1, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 7
    .line 8
    iget v0, v0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorOnSurfaceBack:I

    .line 9
    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-object v0, p1, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 15
    .line 16
    iget v0, v0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSurfaceBack:I

    .line 17
    .line 18
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    iget-object v0, p1, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 23
    .line 24
    iget v0, v0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSecondaryBack:I

    .line 25
    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    const-string v1, ".onSurfaceBack"

    .line 31
    .line 32
    const-string v3, ".surfaceBack"

    .line 33
    .line 34
    const-string v5, ".secondaryBack"

    .line 35
    .line 36
    invoke-static/range {v1 .. v6}, Ljava/util/Map;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {p2, v0}, Lcom/android/quickstep/util/LottieAnimationColorUtils;->updateToArgbColors(Lcom/airbnb/lottie/LottieAnimationView;Ljava/util/Map;)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/android/quickstep/interaction/TutorialController;->mCheckmarkAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_0

    .line 52
    .line 53
    iget-object p0, p1, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 54
    .line 55
    iget p0, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorOnSurfaceBack:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    iget-object p0, p1, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 59
    .line 60
    iget p0, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSecondaryBack:I

    .line 61
    .line 62
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-object p1, p1, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 67
    .line 68
    iget p1, p1, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSurfaceBack:I

    .line 69
    .line 70
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string v0, ".checkmark"

    .line 75
    .line 76
    const-string v1, ".checkmarkBackground"

    .line 77
    .line 78
    invoke-static {v0, p0, v1, p1}, Ljava/util/Map;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {p2, p0}, Lcom/android/quickstep/util/LottieAnimationColorUtils;->updateToArgbColors(Lcom/airbnb/lottie/LottieAnimationView;Ljava/util/Map;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method private handleBackAttempt(Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->resetViewsForBackGesture()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/quickstep/interaction/BackGestureTutorialController$1;->$SwitchMap$com$android$quickstep$interaction$EdgeBackGestureHandler$BackGestureResult:[I

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    aget p1, v0, p1

    .line 11
    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    const p1, 0x7f1400bd

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :pswitch_1
    const p1, 0x7f1400be

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_2
    const p1, 0x7f1400b9

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :pswitch_3
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/quickstep/interaction/TutorialFragment;->releaseFeedbackAnimation()V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 43
    .line 44
    const/16 v0, 0x8

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/BackGestureTutorialController;->getMockAppTaskPreviousPageLayoutResId()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->updateFakeAppTaskViewLayout(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->showSuccessFeedback()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    nop

    .line 61
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getDoneButtonColor()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 12
    .line 13
    iget p0, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorOnSurfaceBack:I

    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 19
    .line 20
    iget p0, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSecondaryBack:I

    .line 21
    .line 22
    return p0
.end method

.method public getDoneButtonTextAppearance()I
    .locals 0

    .line 1
    const p0, 0x7f1502d0

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method protected getExitingAppColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSurfaceBack:I

    .line 6
    .line 7
    return p0
.end method

.method protected getFakeLauncherColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSurfaceContainer:I

    .line 6
    .line 7
    return p0
.end method

.method protected getGestureLottieAnimationId()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialFragment;->isFoldable()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const p0, 0x7f130002

    .line 18
    .line 19
    .line 20
    return p0

    .line 21
    :cond_0
    const p0, 0x7f130003

    .line 22
    .line 23
    .line 24
    return p0

    .line 25
    :cond_1
    const p0, 0x7f130001

    .line 26
    .line 27
    .line 28
    return p0
.end method

.method public getIntroductionSubtitle()I
    .locals 0

    .line 1
    const p0, 0x7f1400c3

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public getIntroductionTitle()I
    .locals 0

    .line 1
    const p0, 0x7f1400c4

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method getMockAppTaskCurrentPageLayoutResId()I
    .locals 0

    .line 1
    const p0, 0x7f0e0074

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method protected getMockAppTaskLayoutResId()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/BackGestureTutorialController;->getMockAppTaskCurrentPageLayoutResId()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method getMockAppTaskPreviousPageLayoutResId()I
    .locals 0

    .line 1
    const p0, 0x7f0e0074

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public getSuccessFeedbackSubtitle()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialFragment;->isAtFinalStep()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const p0, 0x7f1400bc

    .line 10
    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    const p0, 0x7f1400ba

    .line 14
    .line 15
    .line 16
    return p0
.end method

.method public getSuccessFeedbackTitle()I
    .locals 0

    .line 1
    const p0, 0x7f1401d6

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public getSuccessTitleTextAppearance()I
    .locals 0

    .line 1
    const p0, 0x7f1502e3

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public getTitleTextAppearance()I
    .locals 0

    .line 1
    const p0, 0x7f1502e0

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public onBackGestureAttempted(Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->isGestureCompleted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Lcom/android/quickstep/interaction/BackGestureTutorialController$1;->$SwitchMap$com$android$quickstep$interaction$TutorialController$TutorialType:[I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialType:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    aget v0, v0, v1

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    if-eq v0, v1, :cond_4

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-eq v0, v1, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget-object v0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;->BACK_COMPLETED_FROM_LEFT:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 26
    .line 27
    if-eq p1, v0, :cond_3

    .line 28
    .line 29
    sget-object v0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;->BACK_COMPLETED_FROM_RIGHT:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 30
    .line 31
    if-ne p1, v0, :cond_2

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    :goto_0
    return-void

    .line 35
    :cond_3
    :goto_1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialFragment;->close()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_4
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/BackGestureTutorialController;->handleBackAttempt(Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onBackGestureProgress(FFZ)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->isGestureCompleted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mScreenWidth:F

    .line 9
    .line 10
    div-float/2addr p1, v0

    .line 11
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sget-object v5, LJ0/h;->I:Landroid/view/animation/Interpolator;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    const/high16 v2, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/high16 v3, 0x3f800000    # 1.0f

    .line 21
    .line 22
    const v4, 0x3f4ccccd    # 0.8f

    .line 23
    .line 24
    .line 25
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 30
    .line 31
    if-eqz p3, :cond_1

    .line 32
    .line 33
    iget v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mScreenWidth:F

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v2, 0x0

    .line 37
    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 41
    .line 42
    iget v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mScreenHeight:I

    .line 43
    .line 44
    int-to-float v2, v2

    .line 45
    const/high16 v3, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float/2addr v2, v3

    .line 48
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotY(F)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 52
    .line 53
    invoke-virtual {v1, p1}, Landroid/view/View;->setScaleX(F)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 57
    .line 58
    invoke-virtual {v1, p1}, Landroid/view/View;->setScaleY(F)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 62
    .line 63
    const v1, 0x3e4ccccd    # 0.2f

    .line 64
    .line 65
    .line 66
    mul-float/2addr p2, v1

    .line 67
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    iget v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppMargin:F

    .line 74
    .line 75
    const/4 v1, 0x0

    .line 76
    const/high16 v2, 0x3f800000    # 1.0f

    .line 77
    .line 78
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-eqz p3, :cond_2

    .line 83
    .line 84
    const/4 p3, -0x1

    .line 85
    goto :goto_1

    .line 86
    :cond_2
    const/4 p3, 0x1

    .line 87
    :goto_1
    int-to-float p3, p3

    .line 88
    mul-float/2addr p2, p3

    .line 89
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 90
    .line 91
    .line 92
    iget v3, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppStartingCornerRadius:F

    .line 93
    .line 94
    iget v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppEndingCornerRadius:F

    .line 95
    .line 96
    sget-object v5, LJ0/h;->d:Landroid/view/animation/Interpolator;

    .line 97
    .line 98
    const/4 v1, 0x0

    .line 99
    const/high16 v2, 0x3f800000    # 1.0f

    .line 100
    .line 101
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    float-to-int p1, p1

    .line 106
    iput p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppRadius:I

    .line 107
    .line 108
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 109
    .line 110
    invoke-virtual {p0}, Landroid/view/View;->invalidateOutline()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public onNavBarGestureAttempted(Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;Landroid/graphics/PointF;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->isGestureCompleted()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialType:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 9
    .line 10
    sget-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->BACK_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 11
    .line 12
    if-ne p2, v0, :cond_1

    .line 13
    .line 14
    sget-object p2, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;->HOME_GESTURE_COMPLETED:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;

    .line 15
    .line 16
    if-ne p1, p2, :cond_3

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialFragment;->close()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    sget-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->BACK_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 25
    .line 26
    if-ne p2, v0, :cond_3

    .line 27
    .line 28
    sget-object p2, Lcom/android/quickstep/interaction/BackGestureTutorialController$1;->$SwitchMap$com$android$quickstep$interaction$NavBarGestureHandler$NavBarGestureResult:[I

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    aget p1, p2, p1

    .line 35
    .line 36
    const/4 p2, 0x1

    .line 37
    if-eq p1, p2, :cond_2

    .line 38
    .line 39
    const/4 p2, 0x2

    .line 40
    if-eq p1, p2, :cond_2

    .line 41
    .line 42
    const/4 p2, 0x3

    .line 43
    if-eq p1, p2, :cond_2

    .line 44
    .line 45
    const p1, 0x7f1400bd

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(I)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    const p1, 0x7f1400be

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(I)V

    .line 56
    .line 57
    .line 58
    :cond_3
    :goto_0
    return-void
.end method
