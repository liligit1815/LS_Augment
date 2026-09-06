.class public Lcom/android/quickstep/interaction/GestureSandboxActivity;
.super Landroidx/fragment/app/s;
.source "GestureSandboxActivity.java"


# static fields
.field private static final KEY_CURRENT_STEP:Ljava/lang/String; = "current_step"

.field static final KEY_GESTURE_COMPLETE:Ljava/lang/String; = "gesture_complete"

.field private static final KEY_TUTORIAL_STEPS:Ljava/lang/String; = "tutorial_steps"

.field static final KEY_TUTORIAL_TYPE:Ljava/lang/String; = "tutorial_type"

.field static final KEY_USE_TUTORIAL_MENU:Ljava/lang/String; = "use_tutorial_menu"

.field protected static final TAG:Ljava/lang/String; = "GestureSandboxActivity"


# instance fields
.field private mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

.field private mCurrentStep:I

.field private mNumSteps:I

.field private mPendingFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

.field private mSharedPrefs:Landroid/content/SharedPreferences;

.field private mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

.field private mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

.field private mTutorialSteps:[Lcom/android/quickstep/interaction/TutorialController$TutorialType;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/s;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private correctUserOrientation()V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/F1;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v1, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-eqz v1, :cond_4

    .line 21
    .line 22
    iget v0, v0, Lcom/android/launcher3/h0;->Y0:F

    .line 23
    .line 24
    invoke-static {v0}, Lcom/android/quickstep/util/LayoutUtils;->isAspectRatioSquare(F)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    .line 39
    .line 40
    if-ne v0, v2, :cond_0

    .line 41
    .line 42
    new-instance v0, Lcom/android/quickstep/interaction/RotationPromptFragment;

    .line 43
    .line 44
    invoke-direct {v0}, Lcom/android/quickstep/interaction/RotationPromptFragment;-><init>()V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/GestureSandboxFragment;->canRecreateFragment()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mPendingFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 57
    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/GestureSandboxFragment;->recreateFragment()Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    goto :goto_1

    .line 66
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/GestureSandboxFragment;->recreateFragment()Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    :goto_1
    if-nez v0, :cond_3

    .line 73
    .line 74
    iget-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 75
    .line 76
    :cond_3
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->showFragment(Lcom/android/quickstep/interaction/GestureSandboxFragment;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_4
    invoke-virtual {p0, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method private disableSystemGestures()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Landroid/graphics/Rect;

    .line 20
    .line 21
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 22
    .line 23
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-direct {v0, v3, v3, v2, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 27
    .line 28
    .line 29
    filled-new-array {v0}, [Landroid/graphics/Rect;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Landroid/view/Window;->setSystemGestureExclusionRects(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method private getTutorialStepNames()[Ljava/lang/String;
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mTutorialSteps:[Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    new-array p0, v0, [Ljava/lang/String;

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    array-length v1, p0

    .line 10
    new-array v1, v1, [Ljava/lang/String;

    .line 11
    .line 12
    array-length v2, p0

    .line 13
    move v3, v0

    .line 14
    :goto_0
    if-ge v0, v2, :cond_1

    .line 15
    .line 16
    aget-object v4, p0, v0

    .line 17
    .line 18
    add-int/lit8 v5, v3, 0x1

    .line 19
    .line 20
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    aput-object v4, v1, v3

    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    move v3, v5

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-object v1
.end method

.method private getTutorialSteps(Landroid/os/Bundle;)[Lcom/android/quickstep/interaction/TutorialController$TutorialType;
    .locals 6

    .line 1
    sget-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->HOME_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->BACK_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 4
    .line 5
    sget-object v2, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->OVERVIEW_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    iput v1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentStep:I

    .line 13
    .line 14
    const/4 v2, 0x3

    .line 15
    iput v2, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mNumSteps:I

    .line 16
    .line 17
    if-eqz p1, :cond_5

    .line 18
    .line 19
    const-string v2, "tutorial_steps"

    .line 20
    .line 21
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-nez v3, :cond_0

    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_0
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    instance-of v3, v2, Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v3, :cond_2

    .line 35
    .line 36
    check-cast v2, Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_1

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const-string v3, ","

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    goto :goto_0

    .line 53
    :cond_2
    instance-of v3, v2, [Ljava/lang/String;

    .line 54
    .line 55
    if-eqz v3, :cond_5

    .line 56
    .line 57
    check-cast v2, [Ljava/lang/String;

    .line 58
    .line 59
    :goto_0
    if-eqz v2, :cond_5

    .line 60
    .line 61
    array-length v3, v2

    .line 62
    if-nez v3, :cond_3

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_3
    array-length v0, v2

    .line 66
    new-array v3, v0, [Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 67
    .line 68
    const/4 v4, 0x0

    .line 69
    :goto_1
    array-length v5, v2

    .line 70
    if-ge v4, v5, :cond_4

    .line 71
    .line 72
    aget-object v5, v2, v4

    .line 73
    .line 74
    invoke-static {v5}, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->valueOf(Ljava/lang/String;)Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    aput-object v5, v3, v4

    .line 79
    .line 80
    add-int/lit8 v4, v4, 0x1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_4
    const-string v2, "current_step"

    .line 84
    .line 85
    const/4 v4, -0x1

    .line 86
    invoke-virtual {p1, v2, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    iput p1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentStep:I

    .line 95
    .line 96
    iput v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mNumSteps:I

    .line 97
    .line 98
    return-object v3

    .line 99
    :cond_5
    :goto_2
    return-object v0
.end method

.method private hideSystemUI()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/16 v1, 0x1706

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 20
    .line 21
    .line 22
    const-string p0, "GestureSandboxActivity"

    .line 23
    .line 24
    const-string v0, "hideSystemUI setSystemUiVisibility:5894"

    .line 25
    .line 26
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private initWindowInsets()V
    .locals 2

    .line 1
    const v0, 0x1020002

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Lcom/android/quickstep/interaction/q;

    .line 9
    .line 10
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/interaction/q;-><init>(Lcom/android/quickstep/interaction/GestureSandboxActivity;Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Lcom/android/quickstep/interaction/r;

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/quickstep/interaction/r;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic lambda$initWindowInsets$0(Landroid/view/View;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->updateExclusionRects(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$showFragment$2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/GestureSandboxFragment;->onAttachedToWindow()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private makeTutorialFragment(Lcom/android/quickstep/interaction/TutorialController$TutorialType;ZZ)Lcom/android/quickstep/interaction/TutorialFragment;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/android/quickstep/interaction/TutorialFragment;->newInstance(Lcom/android/quickstep/interaction/TutorialController$TutorialType;ZZ)Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic o(Lcom/android/quickstep/interaction/GestureSandboxActivity;Landroid/view/View;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p10}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->lambda$initWindowInsets$0(Landroid/view/View;Landroid/view/View;IIIIIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private onTISConnected(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->isResumed()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->updateServiceState(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic p(Lcom/android/quickstep/interaction/GestureSandboxActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->lambda$showFragment$2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Lcom/android/quickstep/interaction/GestureSandboxActivity;Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->onTISConnected(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 0

    .line 1
    sget-object p0, Landroid/view/WindowInsets;->CONSUMED:Landroid/view/WindowInsets;

    .line 2
    .line 3
    return-object p0
.end method

.method private showFragment(Lcom/android/quickstep/interaction/GestureSandboxFragment;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/GestureSandboxFragment;->canRecreateFragment()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mPendingFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mPendingFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 16
    .line 17
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/fragment/app/s;->getSupportFragmentManager()Landroidx/fragment/app/F;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Landroidx/fragment/app/F;->o()Landroidx/fragment/app/N;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const v0, 0x7f0b029f

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Landroidx/fragment/app/N;->o(ILandroidx/fragment/app/n;)Landroidx/fragment/app/N;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Lcom/android/quickstep/interaction/o;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Lcom/android/quickstep/interaction/o;-><init>(Lcom/android/quickstep/interaction/GestureSandboxActivity;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroidx/fragment/app/N;->q(Ljava/lang/Runnable;)Landroidx/fragment/app/N;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Landroidx/fragment/app/N;->h()I

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private updateExclusionRects(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemGestures()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v1, Landroid/graphics/Rect;

    .line 19
    .line 20
    iget v2, p0, Landroid/graphics/Insets;->left:I

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const/4 v4, 0x0

    .line 27
    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    new-instance v1, Landroid/graphics/Rect;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iget p0, p0, Landroid/graphics/Insets;->right:I

    .line 40
    .line 41
    sub-int/2addr v2, p0

    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    invoke-direct {v1, v2, v4, p0, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemGestureExclusionRects(Ljava/util/List;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method private updateServiceState(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/TISBindHelper;->getBinder()Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, -0x1

    .line 17
    :goto_0
    invoke-virtual {v0, p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->setGestureBlockedTaskId(I)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method


# virtual methods
.method public continueTutorial()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->isTutorialComplete()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mTutorialSteps:[Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentStep:I

    .line 13
    .line 14
    aget-object v0, v0, v1

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->launchTutorialStep(Lcom/android/quickstep/interaction/TutorialController$TutorialType;Z)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentStep:I

    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    iput v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentStep:I

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/GestureSandboxFragment;->close()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public getCurrentStep()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentStep:I

    .line 2
    .line 3
    return p0
.end method

.method public getNumSteps()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mNumSteps:I

    .line 2
    .line 3
    return p0
.end method

.method protected getSharedPrefs()Landroid/content/SharedPreferences;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public isTutorialComplete()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentStep:I

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mNumSteps:I

    .line 4
    .line 5
    if-lt v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public launchTutorialMenu()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/interaction/MenuFragment;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/interaction/MenuFragment;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->showFragment(Lcom/android/quickstep/interaction/GestureSandboxFragment;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public launchTutorialStep(Lcom/android/quickstep/interaction/TutorialController$TutorialType;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0, p2}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->makeTutorialFragment(Lcom/android/quickstep/interaction/TutorialController$TutorialType;ZZ)Lcom/android/quickstep/interaction/TutorialFragment;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->showFragment(Lcom/android/quickstep/interaction/GestureSandboxFragment;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/GestureSandboxFragment;->shouldDisableSystemGestures()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->disableSystemGestures()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/GestureSandboxFragment;->onAttachedToWindow()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/activity/h;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->correctUserOrientation()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/s;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Landroid/app/Activity;->requestWindowFeature(I)Z

    .line 6
    .line 7
    .line 8
    const v1, 0x7f0e00e2

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroidx/activity/h;->setContentView(I)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    :cond_0
    const/4 v1, 0x0

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    const-string v2, "gesture_complete"

    .line 44
    .line 45
    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    move v2, v0

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    move v2, v1

    .line 54
    :goto_0
    if-eqz p1, :cond_3

    .line 55
    .line 56
    const-string v3, "use_tutorial_menu"

    .line 57
    .line 58
    invoke-virtual {p1, v3, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_3

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    iput-object v1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mTutorialSteps:[Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 66
    .line 67
    const-string v1, "tutorial_type"

    .line 68
    .line 69
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 74
    .line 75
    if-nez p1, :cond_2

    .line 76
    .line 77
    new-instance p1, Lcom/android/quickstep/interaction/MenuFragment;

    .line 78
    .line 79
    invoke-direct {p1}, Lcom/android/quickstep/interaction/MenuFragment;-><init>()V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    invoke-direct {p0, p1, v2, v0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->makeTutorialFragment(Lcom/android/quickstep/interaction/TutorialController$TutorialType;ZZ)Lcom/android/quickstep/interaction/TutorialFragment;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    :goto_1
    iput-object p1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->getTutorialSteps(Landroid/os/Bundle;)[Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mTutorialSteps:[Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 95
    .line 96
    iget v3, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentStep:I

    .line 97
    .line 98
    sub-int/2addr v3, v0

    .line 99
    aget-object p1, p1, v3

    .line 100
    .line 101
    invoke-direct {p0, p1, v2, v1}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->makeTutorialFragment(Lcom/android/quickstep/interaction/TutorialController$TutorialType;ZZ)Lcom/android/quickstep/interaction/TutorialFragment;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    iput-object p1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 106
    .line 107
    :goto_2
    invoke-virtual {p0}, Landroidx/fragment/app/s;->getSupportFragmentManager()Landroidx/fragment/app/F;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Landroidx/fragment/app/F;->o()Landroidx/fragment/app/N;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    const v0, 0x7f0b029f

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 119
    .line 120
    invoke-virtual {p1, v0, v1}, Landroidx/fragment/app/N;->b(ILandroidx/fragment/app/n;)Landroidx/fragment/app/N;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Landroidx/fragment/app/N;->h()I

    .line 125
    .line 126
    .line 127
    invoke-direct {p0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->correctUserOrientation()V

    .line 128
    .line 129
    .line 130
    new-instance p1, Lcom/android/quickstep/util/TISBindHelper;

    .line 131
    .line 132
    new-instance v0, Lcom/android/quickstep/interaction/p;

    .line 133
    .line 134
    invoke-direct {v0, p0}, Lcom/android/quickstep/interaction/p;-><init>(Lcom/android/quickstep/interaction/GestureSandboxActivity;)V

    .line 135
    .line 136
    .line 137
    invoke-direct {p1, p0, v0}, Lcom/android/quickstep/util/TISBindHelper;-><init>(Landroid/content/Context;Ljava/util/function/Consumer;)V

    .line 138
    .line 139
    .line 140
    iput-object p1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 141
    .line 142
    invoke-direct {p0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->initWindowInsets()V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/s;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/quickstep/util/TISBindHelper;->onDestroy()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->updateServiceState(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/GestureSandboxFragment;->onDetachedFromWindow()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/s;->onPause()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->updateServiceState(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/s;->onResume()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->updateServiceState(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    const-string v0, "tutorial_steps"

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->getTutorialStepNames()[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "current_step"

    .line 11
    .line 12
    iget v1, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentStep:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/interaction/GestureSandboxActivity;->mCurrentFragment:Lcom/android/quickstep/interaction/GestureSandboxFragment;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroidx/fragment/app/n;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 20
    .line 21
    .line 22
    invoke-super {p0, p1}, Landroidx/activity/h;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/quickstep/interaction/GestureSandboxActivity;->hideSystemUI()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method
