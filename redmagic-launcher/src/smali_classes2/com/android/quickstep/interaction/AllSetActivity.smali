.class public Lcom/android/quickstep/interaction/AllSetActivity;
.super Landroid/app/Activity;
.source "AllSetActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;,
        Lcom/android/quickstep/interaction/AllSetActivity$SkipButtonAccessibilityDelegate;
    }
.end annotation


# static fields
.field private static final ANIMATION_PAUSE_ALPHA_THRESHOLD:F = 0.1f

.field private static final EXTRA_ACCENT_COLOR_DARK_MODE:Ljava/lang/String; = "suwColorAccentDark"

.field private static final EXTRA_ACCENT_COLOR_LIGHT_MODE:Ljava/lang/String; = "suwColorAccentLight"

.field private static final EXTRA_DEVICE_NAME:Ljava/lang/String; = "suwDeviceName"

.field private static final HINT_BOTTOM_FACTOR:F = 0.060000002f

.field private static final INTENT_ACTION_ACTIVITY_CLOSED:Ljava/lang/String; = "com.android.quickstep.interaction.ACTION_ALL_SET_ACTIVITY_CLOSED"

.field private static final KEY_BACKGROUND_ANIMATION_TOGGLED_ON:Ljava/lang/String; = "background_animation_toggled_on"

.field private static final LOG_TAG:Ljava/lang/String; = "AllSetActivity"

.field private static final LOTTIE_PRIMARY_COLOR_TOKEN:Ljava/lang/String; = ".primary"

.field private static final LOTTIE_TERTIARY_COLOR_TOKEN:Ljava/lang/String; = ".tertiary"

.field private static final MAX_SWIPE_DURATION:I = 0x15e

.field private static final TAG:Ljava/lang/String; = "AllSetActivity"

.field private static final URI_SYSTEM_NAVIGATION_SETTING:Ljava/lang/String; = "#Intent;action=com.android.settings.SEARCH_RESULT_TRAMPOLINE;S.:settings:fragment_args_key=gesture_system_navigation_input_summary;S.:settings:show_fragment=com.android.settings.gestures.SystemNavigationGestureSettings;end"


# instance fields
.field private mAnimatedBackground:Lcom/airbnb/lottie/LottieAnimationView;

.field private mBackground:Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;

.field private mBackgroundAnimationToggledOn:Z

.field private mBackgroundAnimatorListener:Landroid/animation/Animator$AnimatorListener;

.field private mHintView:Landroid/widget/TextView;

.field private mLauncherStartAnim:Lcom/android/launcher3/anim/q;

.field private final mOnIDPChangeListener:Lcom/android/launcher3/F1$d;

.field private final mOverviewChangeListener:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

.field private mRootView:Landroid/view/View;

.field private final mSwipeProgress:Lcom/android/launcher3/anim/d;

.field private mSwipeUpShift:F

.field private mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

.field private mVibrator:Landroid/os/Vibrator;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    new-instance v1, Lcom/android/quickstep/interaction/a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/quickstep/interaction/a;-><init>(Lcom/android/quickstep/interaction/AllSetActivity;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mSwipeProgress:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    new-instance v0, Lcom/android/quickstep/interaction/b;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lcom/android/quickstep/interaction/b;-><init>(Lcom/android/quickstep/interaction/AllSetActivity;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mOnIDPChangeListener:Lcom/android/launcher3/F1$d;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mLauncherStartAnim:Lcom/android/launcher3/anim/q;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackgroundAnimationToggledOn:Z

    .line 28
    .line 29
    new-instance v0, Lcom/android/quickstep/interaction/c;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Lcom/android/quickstep/interaction/c;-><init>(Lcom/android/quickstep/interaction/AllSetActivity;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mOverviewChangeListener:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/interaction/AllSetActivity;ZZZZZZ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/quickstep/interaction/AllSetActivity;->lambda$new$0(ZZZZZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/interaction/AllSetActivity;Lcom/android/quickstep/GestureState;)Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/AllSetActivity;->createSwipeUpProxy(Lcom/android/quickstep/GestureState;)Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/android/quickstep/interaction/AllSetActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->onSwipeProgressUpdate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private clearBinderOverride()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/TISBindHelper;->getBinder()Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-direct {p0, v1}, Lcom/android/quickstep/interaction/AllSetActivity;->setSetupUIVisible(Z)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    invoke-virtual {v0, p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->setSwipeUpProxy(Ljava/util/function/Function;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private createSwipeUpProxy(Lcom/android/quickstep/GestureState;)Lcom/android/launcher3/anim/d;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getTopRunningTaskId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mSwipeProgress:Lcom/android/launcher3/anim/d;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mSwipeProgress:Lcom/android/launcher3/anim/d;

    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic d(Lcom/android/quickstep/interaction/AllSetActivity;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/AllSetActivity;->onOverviewTargetChange(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private dispatchLauncherAnimStartEnd()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mLauncherStartAnim:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mLauncherStartAnim:Lcom/android/launcher3/anim/q;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->j()Lcom/android/launcher3/anim/q;

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mLauncherStartAnim:Lcom/android/launcher3/anim/q;

    .line 15
    .line 16
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 17
    .line 18
    const-string v1, "com.android.quickstep.interaction.ACTION_ALL_SET_ACTIVITY_CLOSED"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/interaction/AllSetActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/AllSetActivity;->lambda$onCreate$1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/interaction/AllSetActivity;Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/AllSetActivity;->onTISConnected(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/interaction/AllSetActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/AllSetActivity;->lambda$onCreate$2(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getContentViewAlphaForSwipeProgress()F
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mSwipeProgress:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget v0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    const/4 v4, 0x0

    .line 6
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const v2, 0x3d75c290    # 0.060000002f

    .line 10
    .line 11
    .line 12
    const/high16 v3, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private getDP()Lcom/android/launcher3/h0;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->getIDP()Lcom/android/launcher3/F1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private getIDP()Lcom/android/launcher3/F1;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/quickstep/interaction/AllSetActivity;)Landroid/os/Vibrator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mVibrator:Landroid/os/Vibrator;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/quickstep/interaction/AllSetActivity;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/AllSetActivity;->runOnUiHelperThread(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$0(ZZZZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->updateHint()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onCreate$1(Landroid/view/View;)V
    .locals 1

    .line 1
    :try_start_0
    const-string p1, "#Intent;action=com.android.settings.SEARCH_RESULT_TRAMPOLINE;S.:settings:fragment_args_key=gesture_system_navigation_input_summary;S.:settings:show_fragment=com.android.settings.gestures.SystemNavigationGestureSettings;end"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    const-string p1, "AllSetActivity"

    .line 14
    .line 15
    const-string v0, "Failed to parse system nav settings intent"

    .line 16
    .line 17
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic lambda$onCreate$2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackgroundAnimationToggledOn:Z

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackgroundAnimationToggledOn:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->maybeResumeOrPauseBackgroundAnimation()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private maybeResumeOrPauseBackgroundAnimation()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/E5;->e:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/E5;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/E5;->m()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->getContentViewAlphaForSwipeProgress()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const v1, 0x3dcccccd    # 0.1f

    .line 20
    .line 21
    .line 22
    cmpl-float v0, v0, v1

    .line 23
    .line 24
    if-lez v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Activity;->isResumed()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackgroundAnimationToggledOn:Z

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v0, 0x0

    .line 39
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mAnimatedBackground:Lcom/airbnb/lottie/LottieAnimationView;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/airbnb/lottie/LottieAnimationView;->t()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mAnimatedBackground:Lcom/airbnb/lottie/LottieAnimationView;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->u()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mAnimatedBackground:Lcom/airbnb/lottie/LottieAnimationView;

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/airbnb/lottie/LottieAnimationView;->t()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_2

    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mAnimatedBackground:Lcom/airbnb/lottie/LottieAnimationView;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->x()V

    .line 68
    .line 69
    .line 70
    :cond_2
    return-void
.end method

.method private onOverviewTargetChange(Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/util/ActivityPreloadUtil;->preloadOverviewForSUWAllSet(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private onSwipeProgressUpdate()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackground:Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mSwipeProgress:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;->setProgress(F)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->getContentViewAlphaForSwipeProgress()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mRootView:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mRootView:Landroid/view/View;

    .line 20
    .line 21
    const/high16 v2, 0x3f800000    # 1.0f

    .line 22
    .line 23
    sub-float/2addr v0, v2

    .line 24
    iget v2, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mSwipeUpShift:F

    .line 25
    .line 26
    mul-float/2addr v0, v2

    .line 27
    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mLauncherStartAnim:Lcom/android/launcher3/anim/q;

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    sget-object v1, LJ0/h;->r:Landroid/view/animation/Interpolator;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mSwipeProgress:Lcom/android/launcher3/anim/d;

    .line 37
    .line 38
    iget v2, v2, Lcom/android/launcher3/anim/d;->d:F

    .line 39
    .line 40
    invoke-interface {v1, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->maybeResumeOrPauseBackgroundAnimation()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private onTISConnected(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->isResumed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/AllSetActivity;->setSetupUIVisible(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->isResumed()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Lcom/android/quickstep/interaction/d;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/android/quickstep/interaction/d;-><init>(Lcom/android/quickstep/interaction/AllSetActivity;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    invoke-virtual {p1, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->setSwipeUpProxy(Ljava/util/function/Function;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    const/16 v0, 0x15e

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/g3;->H(I)Lcom/android/launcher3/anim/q;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mLauncherStartAnim:Lcom/android/launcher3/anim/q;

    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method private runOnUiHelperThread(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->isResumed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->getContentViewAlphaForSwipeProgress()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const v0, 0x3dcccccd    # 0.1f

    .line 12
    .line 13
    .line 14
    cmpg-float p0, p0, v0

    .line 15
    .line 16
    if-gtz p0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget-object p0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method private setSetupUIVisible(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/TISBindHelper;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->P0(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private setUpBackgroundAnimation(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mVibrator:Landroid/os/Vibrator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v1, 0x2

    .line 7
    filled-new-array {v1}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v2}, Landroid/os/Vibrator;->areAllPrimitivesSupported([I)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x7

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v3, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mVibrator:Landroid/os/Vibrator;

    .line 19
    .line 20
    filled-new-array {v2}, [I

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-virtual {v3, v4}, Landroid/os/Vibrator;->areAllPrimitivesSupported([I)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-nez v3, :cond_1

    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :cond_1
    iget-object v3, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackgroundAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    .line 32
    .line 33
    if-nez v3, :cond_4

    .line 34
    .line 35
    invoke-static {}, Landroid/os/VibrationEffect;->startComposition()Landroid/os/VibrationEffect$Composition;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    move v1, v2

    .line 43
    :goto_1
    if-eqz p1, :cond_3

    .line 44
    .line 45
    const/high16 p1, 0x3f800000    # 1.0f

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_3
    const p1, 0x3e99999a    # 0.3f

    .line 49
    .line 50
    .line 51
    :goto_2
    const/16 v0, 0x32

    .line 52
    .line 53
    invoke-virtual {v3, v1, p1, v0}, Landroid/os/VibrationEffect$Composition;->addPrimitive(IFI)Landroid/os/VibrationEffect$Composition;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Landroid/os/VibrationEffect$Composition;->compose()Landroid/os/VibrationEffect;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance v0, Lcom/android/quickstep/interaction/AllSetActivity$1;

    .line 62
    .line 63
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/interaction/AllSetActivity$1;-><init>(Lcom/android/quickstep/interaction/AllSetActivity;Landroid/os/VibrationEffect;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackgroundAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    .line 67
    .line 68
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mAnimatedBackground:Lcom/airbnb/lottie/LottieAnimationView;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackgroundAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Lcom/airbnb/lottie/LottieAnimationView;->i(Landroid/animation/Animator$AnimatorListener;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method private updateHint()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mHintView:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->getDP()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->P0:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const p0, 0x7f14007f

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const p0, 0x7f14007d

    .line 16
    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0e0037

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(I)V

    .line 8
    .line 9
    .line 10
    const v0, 0x7f0b04f6

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mRootView:Landroid/view/View;

    .line 18
    .line 19
    const/16 v1, 0x700

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 22
    .line 23
    .line 24
    const-string v0, "AllSetActivity"

    .line 25
    .line 26
    const-string v1, "onCreate setSystemUiVisibility:1792"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget v1, v1, Landroid/content/res/Configuration;->uiMode:I

    .line 40
    .line 41
    and-int/lit8 v1, v1, 0x30

    .line 42
    .line 43
    const/16 v2, 0x20

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    const/4 v4, 0x1

    .line 47
    if-ne v1, v2, :cond_0

    .line 48
    .line 49
    move v1, v4

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    move v1, v3

    .line 52
    :goto_0
    const/16 v2, 0x18

    .line 53
    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    move v5, v3

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    move v5, v2

    .line 59
    :goto_1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    const/4 v7, 0x0

    .line 64
    if-nez v6, :cond_2

    .line 65
    .line 66
    move-object v6, v7

    .line 67
    goto :goto_2

    .line 68
    :cond_2
    invoke-virtual {v6}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    :goto_2
    if-eqz v6, :cond_3

    .line 73
    .line 74
    invoke-interface {v6, v5, v2}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

    .line 75
    .line 76
    .line 77
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    if-eqz v1, :cond_4

    .line 82
    .line 83
    const-string v5, "suwColorAccentDark"

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_4
    const-string v5, "suwColorAccentLight"

    .line 87
    .line 88
    :goto_3
    if-eqz v1, :cond_5

    .line 89
    .line 90
    const/4 v1, -0x1

    .line 91
    goto :goto_4

    .line 92
    :cond_5
    const/high16 v1, -0x1000000

    .line 93
    .line 94
    :goto_4
    invoke-virtual {v2, v5, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    const v5, 0x7f0b02fc

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    check-cast v5, Landroid/widget/ImageView;

    .line 106
    .line 107
    invoke-virtual {v5}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    invoke-virtual {v5, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 116
    .line 117
    .line 118
    new-instance v5, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;

    .line 119
    .line 120
    invoke-direct {v5, p0}, Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;-><init>(Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    iput-object v5, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackground:Lcom/android/quickstep/interaction/AllSetActivity$BgDrawable;

    .line 124
    .line 125
    iget-object v6, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mRootView:Landroid/view/View;

    .line 126
    .line 127
    invoke-virtual {v6, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 128
    .line 129
    .line 130
    const v5, 0x7f070105

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    iput v5, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mSwipeUpShift:F

    .line 138
    .line 139
    const v5, 0x7f0b0599

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    check-cast v5, Landroid/widget/TextView;

    .line 147
    .line 148
    const-string v6, "suwDeviceName"

    .line 149
    .line 150
    invoke-virtual {v2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result v6

    .line 158
    if-nez v6, :cond_6

    .line 159
    .line 160
    goto :goto_5

    .line 161
    :cond_6
    const v2, 0x7f14016d

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    :goto_5
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    const v6, 0x7f14007e

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0, v6, v2}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    .line 181
    .line 182
    const v2, 0x7f0b040c

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    check-cast v2, Landroid/widget/TextView;

    .line 190
    .line 191
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 192
    .line 193
    .line 194
    new-instance v1, Lcom/android/quickstep/interaction/e;

    .line 195
    .line 196
    invoke-direct {v1, p0}, Lcom/android/quickstep/interaction/e;-><init>(Lcom/android/quickstep/interaction/AllSetActivity;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    .line 201
    .line 202
    const v1, 0x7f0b02d6

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    check-cast v1, Landroid/widget/TextView;

    .line 210
    .line 211
    iput-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mHintView:Landroid/widget/TextView;

    .line 212
    .line 213
    new-instance v2, Lcom/android/quickstep/interaction/AllSetActivity$SkipButtonAccessibilityDelegate;

    .line 214
    .line 215
    invoke-direct {v2, p0, v7}, Lcom/android/quickstep/interaction/AllSetActivity$SkipButtonAccessibilityDelegate;-><init>(Lcom/android/quickstep/interaction/AllSetActivity;Lcom/android/quickstep/interaction/j;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 219
    .line 220
    .line 221
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->updateHint()V

    .line 222
    .line 223
    .line 224
    new-instance v1, Lcom/android/quickstep/util/TISBindHelper;

    .line 225
    .line 226
    new-instance v2, Lcom/android/quickstep/interaction/f;

    .line 227
    .line 228
    invoke-direct {v2, p0}, Lcom/android/quickstep/interaction/f;-><init>(Lcom/android/quickstep/interaction/AllSetActivity;)V

    .line 229
    .line 230
    .line 231
    invoke-direct {v1, p0, v2}, Lcom/android/quickstep/util/TISBindHelper;-><init>(Landroid/content/Context;Ljava/util/function/Consumer;)V

    .line 232
    .line 233
    .line 234
    iput-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 235
    .line 236
    const-class v1, Landroid/os/Vibrator;

    .line 237
    .line 238
    invoke-virtual {p0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    check-cast v1, Landroid/os/Vibrator;

    .line 243
    .line 244
    iput-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mVibrator:Landroid/os/Vibrator;

    .line 245
    .line 246
    const v1, 0x7f0b00d1

    .line 247
    .line 248
    .line 249
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    check-cast v1, Lcom/airbnb/lottie/LottieAnimationView;

    .line 254
    .line 255
    iput-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mAnimatedBackground:Lcom/airbnb/lottie/LottieAnimationView;

    .line 256
    .line 257
    const/high16 v2, 0x7f130000

    .line 258
    .line 259
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    invoke-virtual {v1, v0, v7}, Lcom/airbnb/lottie/LottieAnimationView;->y(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mAnimatedBackground:Lcom/airbnb/lottie/LottieAnimationView;

    .line 267
    .line 268
    const v1, 0x7f060052

    .line 269
    .line 270
    .line 271
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    const v2, 0x7f060053

    .line 276
    .line 277
    .line 278
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    const-string v5, ".primary"

    .line 283
    .line 284
    const-string v6, ".tertiary"

    .line 285
    .line 286
    invoke-static {v5, v1, v6, v2}, Ljava/util/Map;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    invoke-virtual {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    invoke-static {v0, v1, v2}, Lcom/android/quickstep/util/LottieAnimationColorUtils;->updateToColorResources(Lcom/airbnb/lottie/LottieAnimationView;Ljava/util/Map;Landroid/content/res/Resources$Theme;)V

    .line 295
    .line 296
    .line 297
    if-eqz p1, :cond_7

    .line 298
    .line 299
    const-string v0, "background_animation_toggled_on"

    .line 300
    .line 301
    invoke-virtual {p1, v0, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 302
    .line 303
    .line 304
    move-result p1

    .line 305
    if-eqz p1, :cond_8

    .line 306
    .line 307
    :cond_7
    move v3, v4

    .line 308
    :cond_8
    iput-boolean v3, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackgroundAnimationToggledOn:Z

    .line 309
    .line 310
    const p1, 0x7f0b018d

    .line 311
    .line 312
    .line 313
    invoke-virtual {p0, p1}, Landroid/app/Activity;->requireViewById(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    new-instance v0, Lcom/android/quickstep/interaction/g;

    .line 318
    .line 319
    invoke-direct {v0, p0}, Lcom/android/quickstep/interaction/g;-><init>(Lcom/android/quickstep/interaction/AllSetActivity;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 323
    .line 324
    .line 325
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->getDP()Lcom/android/launcher3/h0;

    .line 326
    .line 327
    .line 328
    move-result-object p1

    .line 329
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 330
    .line 331
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/AllSetActivity;->setUpBackgroundAnimation(Z)V

    .line 332
    .line 333
    .line 334
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->getIDP()Lcom/android/launcher3/F1;

    .line 335
    .line 336
    .line 337
    move-result-object p1

    .line 338
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mOnIDPChangeListener:Lcom/android/launcher3/F1$d;

    .line 339
    .line 340
    invoke-virtual {p1, v0}, Lcom/android/launcher3/F1;->j0(Lcom/android/launcher3/F1$d;)V

    .line 341
    .line 342
    .line 343
    sget-object p1, Lcom/android/quickstep/OverviewComponentObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 344
    .line 345
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    move-result-object p1

    .line 349
    check-cast p1, Lcom/android/quickstep/OverviewComponentObserver;

    .line 350
    .line 351
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mOverviewChangeListener:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

    .line 352
    .line 353
    invoke-virtual {p1, v0}, Lcom/android/quickstep/OverviewComponentObserver;->addOverviewChangeListener(Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;)V

    .line 354
    .line 355
    .line 356
    invoke-static {p0}, Lcom/android/quickstep/util/ActivityPreloadUtil;->preloadOverviewForSUWAllSet(Landroid/content/Context;)V

    .line 357
    .line 358
    .line 359
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->getIDP()Lcom/android/launcher3/F1;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mOnIDPChangeListener:Lcom/android/launcher3/F1$d;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/F1;->O0(Lcom/android/launcher3/F1$d;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/quickstep/util/TISBindHelper;->onDestroy()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->clearBinderOverride()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackgroundAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mAnimatedBackground:Lcom/airbnb/lottie/LottieAnimationView;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->w(Landroid/animation/Animator$AnimatorListener;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->dispatchLauncherAnimStartEnd()V

    .line 37
    .line 38
    .line 39
    :cond_1
    sget-object v0, Lcom/android/quickstep/OverviewComponentObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/android/quickstep/OverviewComponentObserver;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mOverviewChangeListener:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Lcom/android/quickstep/OverviewComponentObserver;->removeOverviewChangeListener(Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->clearBinderOverride()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->maybeResumeOrPauseBackgroundAnimation()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mSwipeProgress:Lcom/android/launcher3/anim/d;

    .line 11
    .line 12
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 13
    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    cmpl-float v0, v0, v1

    .line 17
    .line 18
    if-ltz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->dispatchLauncherAnimStartEnd()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/interaction/AllSetActivity;->maybeResumeOrPauseBackgroundAnimation()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/util/TISBindHelper;->getBinder()Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-direct {p0, v1}, Lcom/android/quickstep/interaction/AllSetActivity;->setSetupUIVisible(Z)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lcom/android/quickstep/interaction/d;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/android/quickstep/interaction/d;-><init>(Lcom/android/quickstep/interaction/AllSetActivity;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->setSwipeUpProxy(Ljava/util/function/Function;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "background_animation_toggled_on"

    .line 5
    .line 6
    iget-boolean p0, p0, Lcom/android/quickstep/interaction/AllSetActivity;->mBackgroundAnimationToggledOn:Z

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
