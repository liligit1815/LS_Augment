.class public Lcom/android/quickstep/util/AnimUtils;
.super Ljava/lang/Object;
.source "AnimUtils.java"


# static fields
.field private static final DURATION_DEFAULT_SPLIT_DISMISS:I = 0x15e


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

.method public static synthetic a(Lcom/android/launcher3/views/k;LW/b;)V
    .locals 0

    .line 1
    invoke-interface {p0}, LW/d;->getLifecycle()Landroidx/lifecycle/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroidx/lifecycle/g;->c(LW/c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/views/k;LW/b;)V
    .locals 0

    .line 1
    invoke-interface {p0}, LW/d;->getLifecycle()Landroidx/lifecycle/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroidx/lifecycle/g;->a(LW/c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    div-float v0, p1, p3

    .line 2
    .line 3
    add-float/2addr p1, p2

    .line 4
    div-float/2addr p1, p3

    .line 5
    invoke-static {p0, v0, p1}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static completeRunnableListCallback(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/views/k;)Landroid/os/IRemoteCallback;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/util/AnimUtils$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/AnimUtils$1;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    new-instance v2, Lcom/android/quickstep/util/f;

    .line 9
    .line 10
    invoke-direct {v2, p1, v0}, Lcom/android/quickstep/util/f;-><init>(Lcom/android/launcher3/views/k;LW/b;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/android/quickstep/util/g;

    .line 17
    .line 18
    invoke-direct {v1, p1, v0}, Lcom/android/quickstep/util/g;-><init>(Lcom/android/launcher3/views/k;LW/b;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Lcom/android/quickstep/util/AnimUtils$2;

    .line 25
    .line 26
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/util/AnimUtils$2;-><init>(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/views/k;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public static getDeviceAppPairLaunchTimings(Z)Lcom/android/quickstep/util/SplitAnimationTimings;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_APP_PAIR_LAUNCH:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object p0, Lcom/android/quickstep/util/SplitAnimationTimings;->PHONE_APP_PAIR_LAUNCH:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 7
    .line 8
    return-object p0
.end method

.method public static getDeviceOverviewToSplitTimings(Z)Lcom/android/quickstep/util/SplitAnimationTimings;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_OVERVIEW_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object p0, Lcom/android/quickstep/util/SplitAnimationTimings;->PHONE_OVERVIEW_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 7
    .line 8
    return-object p0
.end method

.method public static getDeviceSplitToConfirmTimings(Z)Lcom/android/quickstep/util/SplitAnimationTimings;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_SPLIT_TO_CONFIRM:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object p0, Lcom/android/quickstep/util/SplitAnimationTimings;->PHONE_SPLIT_TO_CONFIRM:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 7
    .line 8
    return-object p0
.end method

.method public static goToNormalStateWithSplitDismissal(Lcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$e;Lcom/android/quickstep/util/SplitAnimationController;)V
    .locals 6

    .line 1
    new-instance v0, LQ1/f;

    .line 2
    .line 3
    invoke-direct {v0}, LQ1/f;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-interface {v1, p1, v2}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-long v2, v2

    .line 16
    const-wide/16 v4, 0x0

    .line 17
    .line 18
    cmp-long v4, v2, v4

    .line 19
    .line 20
    if-nez v4, :cond_0

    .line 21
    .line 22
    const-wide/16 v2, 0x15e

    .line 23
    .line 24
    :cond_0
    iput-wide v2, v0, LQ1/f;->g:J

    .line 25
    .line 26
    sget-object v4, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 27
    .line 28
    invoke-virtual {p0, v1, v4, v0}, Lcom/android/launcher3/statemanager/d;->r(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)Landroid/animation/AnimatorSet;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p3, p1, p2, v1}, Lcom/android/quickstep/util/SplitAnimationController;->createPlaceholderDismissAnim(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$d;Ljava/lang/Long;)Landroid/animation/AnimatorSet;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0, v4}, Lcom/android/launcher3/statemanager/d;->c0(Landroid/animation/AnimatorSet;Lcom/android/launcher3/statemanager/a;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 47
    .line 48
    .line 49
    return-void
.end method
