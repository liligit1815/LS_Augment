.class final Lcom/android/quickstep/interaction/HomeGestureTutorialController;
.super Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;
.source "HomeGestureTutorialController.java"


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/HomeGestureTutorialFragment;Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V
    .locals 7

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;-><init>(Lcom/android/quickstep/interaction/TutorialFragment;Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 5
    .line 6
    iget-object v0, p1, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 7
    .line 8
    iget v0, v0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorOnSurfaceHome:I

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
    iget v0, v0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSurfaceHome:I

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
    iget v0, v0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSecondaryHome:I

    .line 25
    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    const-string v1, ".onSurfaceHome"

    .line 31
    .line 32
    const-string v3, ".surfaceHome"

    .line 33
    .line 34
    const-string v5, ".secondaryHome"

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
    iget p0, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorOnSurfaceHome:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    iget-object p0, p1, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 59
    .line 60
    iget p0, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSecondaryHome:I

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
    iget p1, p1, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSurfaceHome:I

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

.method private synthetic lambda$onNavBarGestureAttempted$0()V
    .locals 1

    .line 1
    const v0, 0x7f1401f8

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(I)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Lcom/android/quickstep/interaction/TutorialController;->showFakeTaskbar(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic p(Lcom/android/quickstep/interaction/HomeGestureTutorialController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/HomeGestureTutorialController;->lambda$onNavBarGestureAttempted$0()V

    .line 2
    .line 3
    .line 4
    return-void
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
    iget p0, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorOnSurfaceHome:I

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
    iget p0, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSecondaryHome:I

    .line 21
    .line 22
    return p0
.end method

.method public getDoneButtonTextAppearance()I
    .locals 0

    .line 1
    const p0, 0x7f1502d1

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
    iget p0, p0, Lcom/android/quickstep/interaction/RootSandboxLayout;->mColorSurfaceHome:I

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

.method protected getFakeTaskViewColor()I
    .locals 1

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
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/HomeGestureTutorialController;->getFakeLauncherColor()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/HomeGestureTutorialController;->getExitingAppColor()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
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
    const p0, 0x7f13000e

    .line 18
    .line 19
    .line 20
    return p0

    .line 21
    :cond_0
    const p0, 0x7f13000f

    .line 22
    .line 23
    .line 24
    return p0

    .line 25
    :cond_1
    const p0, 0x7f13000d

    .line 26
    .line 27
    .line 28
    return p0
.end method

.method protected getHotseatIconColor()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/HomeGestureTutorialController;->getExitingAppColor()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getIntroductionSubtitle()I
    .locals 0

    .line 1
    const p0, 0x7f1401fe

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public getIntroductionTitle()I
    .locals 0

    .line 1
    const p0, 0x7f140200

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method protected getMockAppTaskLayoutResId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const p0, 0x7f0e00f0

    .line 10
    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    const p0, 0x7f0e00e9

    .line 14
    .line 15
    .line 16
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
    const p0, 0x7f1401f7

    .line 10
    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    const p0, 0x7f1401f6

    .line 14
    .line 15
    .line 16
    return p0
.end method

.method public getSuccessFeedbackTitle()I
    .locals 0

    .line 1
    const p0, 0x7f1401ff

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public getSuccessTitleTextAppearance()I
    .locals 0

    .line 1
    const p0, 0x7f1502e4

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public getTitleTextAppearance()I
    .locals 0

    .line 1
    const p0, 0x7f1502e1

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public onBackGestureAttempted(Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;)V
    .locals 3

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
    sget-object v0, Lcom/android/quickstep/interaction/HomeGestureTutorialController$1;->$SwitchMap$com$android$quickstep$interaction$TutorialController$TutorialType:[I

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
    const/4 v1, 0x2

    .line 19
    const/4 v2, 0x1

    .line 20
    if-eq v0, v2, :cond_3

    .line 21
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
    if-eq p1, v0, :cond_2

    .line 28
    .line 29
    sget-object v0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;->BACK_COMPLETED_FROM_RIGHT:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 30
    .line 31
    if-ne p1, v0, :cond_4

    .line 32
    .line 33
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialFragment;->close()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_3
    sget-object v0, Lcom/android/quickstep/interaction/HomeGestureTutorialController$1;->$SwitchMap$com$android$quickstep$interaction$EdgeBackGestureHandler$BackGestureResult:[I

    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    aget p1, v0, p1

    .line 46
    .line 47
    if-eq p1, v2, :cond_5

    .line 48
    .line 49
    if-eq p1, v1, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x3

    .line 52
    if-eq p1, v0, :cond_5

    .line 53
    .line 54
    const/4 v0, 0x4

    .line 55
    if-eq p1, v0, :cond_5

    .line 56
    .line 57
    const/4 v0, 0x5

    .line 58
    if-eq p1, v0, :cond_5

    .line 59
    .line 60
    :cond_4
    :goto_0
    return-void

    .line 61
    :cond_5
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->resetTaskViews()V

    .line 62
    .line 63
    .line 64
    const p1, 0x7f1401f9

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public onNavBarGestureAttempted(Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;Landroid/graphics/PointF;)V
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
    sget-object v0, Lcom/android/quickstep/interaction/HomeGestureTutorialController$1;->$SwitchMap$com$android$quickstep$interaction$TutorialController$TutorialType:[I

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
    if-eq v0, v1, :cond_2

    .line 20
    .line 21
    const/4 p2, 0x2

    .line 22
    if-eq v0, p2, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget-object p2, Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;->HOME_GESTURE_COMPLETED:Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureResult;

    .line 26
    .line 27
    if-ne p1, p2, :cond_3

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialFragment;->close()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    sget-object v0, Lcom/android/quickstep/interaction/HomeGestureTutorialController$1;->$SwitchMap$com$android$quickstep$interaction$NavBarGestureHandler$NavBarGestureResult:[I

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    aget p1, v0, p1

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    const/4 v1, 0x0

    .line 45
    packed-switch p1, :pswitch_data_0

    .line 46
    .line 47
    .line 48
    :cond_3
    :goto_0
    return-void

    .line 49
    :pswitch_0
    invoke-virtual {p0, v1, v0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->fadeOutFakeTaskView(ZLjava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    const p1, 0x7f1401fa

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :pswitch_1
    new-instance p1, Lcom/android/quickstep/interaction/s;

    .line 60
    .line 61
    invoke-direct {p1, p0}, Lcom/android/quickstep/interaction/s;-><init>(Lcom/android/quickstep/interaction/HomeGestureTutorialController;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v1, p1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->fadeOutFakeTaskView(ZLjava/lang/Runnable;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->resetTaskViews()V

    .line 69
    .line 70
    .line 71
    const p1, 0x7f1401f9

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(I)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :pswitch_3
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/android/quickstep/interaction/TutorialFragment;->releaseFeedbackAnimation()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p2, v0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->animateFakeTaskViewHome(Landroid/graphics/PointF;Ljava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->showSuccessFeedback()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    nop

    .line 91
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
