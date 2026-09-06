.class public final Lcom/android/quickstep/RecentsActivity;
.super Lcom/android/launcher3/statemanager/h;
.source "RecentsActivity.java"

# interfaces
.implements Lcom/android/quickstep/views/RecentsViewContainer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/statemanager/h<",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;",
        "Lcom/android/quickstep/views/RecentsViewContainer;"
    }
.end annotation


# static fields
.field public static final ACTIVITY_TRACKER:Lcom/android/launcher3/util/H$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/H$a<",
            "Lcom/android/quickstep/RecentsActivity;",
            ">;"
        }
    .end annotation
.end field

.field private static final HOME_APPEAR_DURATION:J = 0xfaL

.field private static final RECENTS_ANIMATION_TIMEOUT:J = 0x3e8L

.field private static final TAG:Ljava/lang/String; = "RecentsActivity"


# instance fields
.field private mActionsView:Lcom/android/quickstep/views/OverviewActionsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/OverviewActionsView<",
            "*>;"
        }
    .end annotation
.end field

.field private mActivityLaunchAnimationRunner:Lcom/android/launcher3/M2$b;

.field private final mAnimationStartTimeoutRunnable:Ljava/lang/Runnable;

.field private final mAnimationToHomeFactory:Lcom/android/launcher3/M2$b;

.field private mDesktopRecentsTransitionController:Lj1/k;

.field private mDragLayer:Lcom/android/quickstep/fallback/RecentsDragLayer;

.field private mFallbackRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

.field private mScrimView:Lcom/android/launcher3/views/ScrimView;

.field private mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

.field private mStateManager:Lcom/android/launcher3/statemanager/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/statemanager/d<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            "Lcom/android/quickstep/RecentsActivity;",
            ">;"
        }
    .end annotation
.end field

.field private mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

.field private mTaskbarUIController:Lcom/android/launcher3/taskbar/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/taskbar/e<",
            "Lcom/android/quickstep/RecentsActivity;",
            ">;"
        }
    .end annotation
.end field

.field private mUiHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/H$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/H$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/RecentsActivity;->ACTIVITY_TRACKER:Lcom/android/launcher3/util/H$a;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/statemanager/h;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mUiHandler:Landroid/os/Handler;

    .line 14
    .line 15
    new-instance v0, Lcom/android/quickstep/H2;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/android/quickstep/H2;-><init>(Lcom/android/quickstep/RecentsActivity;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mAnimationStartTimeoutRunnable:Ljava/lang/Runnable;

    .line 21
    .line 22
    new-instance v0, Lcom/android/quickstep/I2;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/android/quickstep/I2;-><init>(Lcom/android/quickstep/RecentsActivity;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mAnimationToHomeFactory:Lcom/android/launcher3/M2$b;

    .line 28
    .line 29
    return-void
.end method

.method private composeRecentsLaunchAnimator(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)Landroid/animation/AnimatorSet;
    .locals 14

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    move-object/from16 v6, p3

    .line 12
    .line 13
    invoke-static {v6, v1, v2}, Lcom/android/quickstep/TaskUtils;->taskIsATargetWithMode([Landroid/view/RemoteAnimationTarget;II)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    new-instance v11, Lcom/android/launcher3/anim/V;

    .line 18
    .line 19
    const-wide/16 v12, 0x150

    .line 20
    .line 21
    invoke-direct {v11, v12, v13}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 22
    .line 23
    .line 24
    xor-int/lit8 v5, v1, 0x1

    .line 25
    .line 26
    const/4 v9, 0x0

    .line 27
    const/4 v10, 0x0

    .line 28
    move-object v3, p1

    .line 29
    move-object/from16 v4, p2

    .line 30
    .line 31
    move-object/from16 v7, p4

    .line 32
    .line 33
    move-object/from16 v8, p5

    .line 34
    .line 35
    invoke-static/range {v3 .. v11}, Lcom/android/quickstep/TaskViewUtils;->createRecentsWindowAnimator(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Z[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;LP1/h;Landroid/window/TransitionInfo;Lcom/android/launcher3/anim/V;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v11}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 43
    .line 44
    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Lcom/android/quickstep/RecentsActivity;->mFallbackRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 48
    .line 49
    move-object/from16 v4, p2

    .line 50
    .line 51
    invoke-virtual {p1, v4}, Lcom/android/quickstep/views/RecentsView;->createAdjacentPageAnimForTaskLaunch(Lcom/android/quickstep/views/TaskView;)Landroid/animation/AnimatorSet;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget-object v1, LJ0/h;->U:Landroid/view/animation/Interpolator;

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v12, v13}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    invoke-direct {p0}, Lcom/android/quickstep/RecentsActivity;->resetStateListener()Landroid/animation/AnimatorListenerAdapter;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 71
    .line 72
    .line 73
    :cond_0
    return-object v0
.end method

.method public static synthetic d0(Lcom/android/quickstep/RecentsActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsActivity;->lambda$new$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Lcom/android/quickstep/RecentsActivity;Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsActivity;->lambda$startHome$0(Lcom/android/quickstep/views/RecentsView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f0(Lcom/android/quickstep/RecentsActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsActivity;->onAnimationStartTimeout()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g0(Lcom/android/quickstep/RecentsActivity;Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsActivity;->onTISConnected(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Lcom/android/quickstep/RecentsActivity;I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/quickstep/RecentsActivity;->lambda$new$2(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Lcom/android/quickstep/RecentsActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsActivity;->startHomeInternal()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private initDeviceProfile()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->createDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 6
    .line 7
    return-void
.end method

.method static bridge synthetic j0(Lcom/android/quickstep/RecentsActivity;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mAnimationStartTimeoutRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic k0(Lcom/android/quickstep/RecentsActivity;)Lcom/android/quickstep/fallback/FallbackRecentsView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mFallbackRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic l0(Lcom/android/quickstep/RecentsActivity;)Lcom/android/launcher3/statemanager/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mStateManager:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic lambda$new$1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->HOME:Lcom/android/quickstep/fallback/RecentsState;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic lambda$new$2(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->BG_LAUNCHER:Lcom/android/quickstep/fallback/RecentsState;

    .line 6
    .line 7
    const-wide/16 v1, 0xfa

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1, v2}, Lcom/android/launcher3/statemanager/d;->n(Lcom/android/launcher3/statemanager/a;J)Lcom/android/launcher3/anim/q;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 14
    .line 15
    .line 16
    new-instance v0, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-direct {v0, p2, p3, p4, v3}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;I)V

    .line 20
    .line 21
    .line 22
    iget-object p2, v0, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 23
    .line 24
    array-length p3, p2

    .line 25
    :goto_0
    if-ge v3, p3, :cond_0

    .line 26
    .line 27
    aget-object p4, p2, v3

    .line 28
    .line 29
    new-instance v0, Landroid/view/SurfaceControl$Transaction;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object p4, p4, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 35
    .line 36
    const/high16 v4, 0x3f800000    # 1.0f

    .line 37
    .line 38
    invoke-virtual {v0, p4, v4}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 39
    .line 40
    .line 41
    move-result-object p4

    .line 42
    invoke-virtual {p4}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 43
    .line 44
    .line 45
    add-int/lit8 v3, v3, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    new-instance p2, Landroid/animation/AnimatorSet;

    .line 49
    .line 50
    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p2, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 61
    .line 62
    .line 63
    new-instance p1, Lcom/android/quickstep/K2;

    .line 64
    .line 65
    invoke-direct {p1, p0}, Lcom/android/quickstep/K2;-><init>(Lcom/android/quickstep/RecentsActivity;)V

    .line 66
    .line 67
    .line 68
    const/4 p3, 0x1

    .line 69
    invoke-virtual {p5, p2, p0, p1, p3}, Lcom/android/launcher3/M2$a;->u2(Landroid/animation/AnimatorSet;Landroid/content/Context;Ljava/lang/Runnable;Z)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method private synthetic lambda$startHome$0(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/M2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/M2;-><init>(Lcom/android/quickstep/RecentsActivity;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    invoke-virtual {p1, p0, v0}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZLjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method static bridge synthetic m0(Lcom/android/quickstep/RecentsActivity;Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/quickstep/RecentsActivity;->composeRecentsLaunchAnimator(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic n0(Lcom/android/quickstep/RecentsActivity;)Landroid/animation/AnimatorListenerAdapter;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsActivity;->resetStateListener()Landroid/animation/AnimatorListenerAdapter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private onAnimationStartTimeout()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mActivityLaunchAnimationRunner:Lcom/android/launcher3/M2$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/M2$b;->onAnimationCancelled()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private onTISConnected(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/g3;->N0(Lcom/android/launcher3/statemanager/h;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private resetStateListener()Landroid/animation/AnimatorListenerAdapter;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/RecentsActivity$2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/RecentsActivity$2;-><init>(Lcom/android/quickstep/RecentsActivity;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private restoreState(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-string v0, "launcher.recreate_to_update_theme"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->DEFAULT:Lcom/android/quickstep/fallback/RecentsState;

    .line 13
    .line 14
    iget v0, v0, Lcom/android/quickstep/fallback/RecentsState;->ordinal:I

    .line 15
    .line 16
    const-string v1, "launcher.state"

    .line 17
    .line 18
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-static {p1}, Lcom/android/quickstep/fallback/RecentsState;->stateFromOrdinal(I)Lcom/android/quickstep/fallback/RecentsState;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mStateManager:Lcom/android/launcher3/statemanager/d;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method private startHomeInternal()V
    .locals 8

    .line 1
    const-string v1, "RecentsActivity"

    .line 2
    .line 3
    new-instance v3, Lcom/android/launcher3/M2;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getMainThreadHandler()Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v2, p0, Lcom/android/quickstep/RecentsActivity;->mAnimationToHomeFactory:Lcom/android/launcher3/M2$b;

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    invoke-direct {v3, v0, v2, v4}, Lcom/android/launcher3/M2;-><init>(Landroid/os/Handler;Lcom/android/launcher3/M2$b;Z)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Landroid/view/RemoteAnimationAdapter;

    .line 16
    .line 17
    const-wide/16 v4, 0xfa

    .line 18
    .line 19
    const-wide/16 v6, 0x0

    .line 20
    .line 21
    invoke-direct/range {v2 .. v7}, Landroid/view/RemoteAnimationAdapter;-><init>(Landroid/view/IRemoteAnimationRunner;JJ)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Landroid/window/RemoteTransition;

    .line 25
    .line 26
    invoke-virtual {v3}, Lu2/p;->y2()Landroid/window/IRemoteTransition;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getIApplicationThread()Landroid/app/IApplicationThread;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    const-string v5, "StartHomeFromRecents"

    .line 35
    .line 36
    invoke-direct {v0, v3, v4, v5}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Landroid/app/IApplicationThread;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v2, v0}, Landroid/app/ActivityOptions;->makeRemoteAnimation(Landroid/view/RemoteAnimationAdapter;Landroid/window/RemoteTransition;)Landroid/app/ActivityOptions;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :try_start_0
    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p0, v0, v1}, Lcom/android/quickstep/OverviewComponentObserver;->startHomeIntentSafely(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const v2, 0x7f140047

    .line 57
    .line 58
    .line 59
    const/4 v3, 0x0

    .line 60
    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 65
    .line 66
    .line 67
    const-string p0, "startHomeInternal fail"

    .line 68
    .line 69
    invoke-static {v1, p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 70
    .line 71
    .line 72
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v0, "startHomeInternal "

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    new-instance v0, Ljava/lang/Throwable;

    .line 83
    .line 84
    const-string v2, "start home activity"

    .line 85
    .line 86
    invoke-direct {v0, v2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    return-void
.end method


# virtual methods
.method public bridge synthetic addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic asContext()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public canStartHomeSafely()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/TISBindHelper;->getOverviewCommandHelper()Lcom/android/quickstep/OverviewCommandHelper;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewCommandHelper;->canStartHomeSafely()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public bridge synthetic canUseMultipleShadesForPopup()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->canUseMultipleShadesForPopup()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public collectStateHandlers(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/statemanager/d$f<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/fallback/FallbackRecentsStateController;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/fallback/FallbackRecentsStateController;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public createAtomicAnimationFactory()Lcom/android/launcher3/statemanager/d$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/statemanager/d$d<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method protected createDeviceProfile()Lcom/android/launcher3/h0;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/F1;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/android/quickstep/RecentsActivity;->mDragLayer:Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Activity;->isInMultiWindowMode()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getMultiWindowDisplaySize()Lcom/android/launcher3/util/p3;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/h0;->A0(Landroid/content/Context;Lcom/android/launcher3/util/p3;)Lcom/android/launcher3/h0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    invoke-virtual {v0, p0}, Lcom/android/launcher3/h0;->S(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public dispatchDeviceProfileChanged()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->dispatchDeviceProfileChanged()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->g1()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-wide/16 v0, 0x1000

    .line 13
    .line 14
    const-string v2, "RecentsActivity#DeviceProfileChanged"

    .line 15
    .line 16
    invoke-static {v0, v1, v2, p0}, Landroid/os/Trace;->instantForTrack(JLjava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/app/Activity;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    const-string p4, "Misc:"

    .line 13
    .line 14
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance p2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p1, "\t"

    .line 33
    .line 34
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/v;->dumpMisc(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public bridge synthetic findFolderIcon(I)Lcom/android/launcher3/folder/FolderIcon;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->findFolderIcon(I)Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic finishAppClosingAnim(ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/views/k;->finishAppClosingAnim(ZLjava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic finishFolderAnim()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->finishFolderAnim()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getActionsView()Lcom/android/quickstep/views/OverviewActionsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/views/OverviewActionsView<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mActionsView:Lcom/android/quickstep/views/OverviewActionsView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;
    .locals 9

    .line 1
    instance-of v0, p1, Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-static {}, Lx1/O;->Y2()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    move-object v0, p1

    .line 13
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/v;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_1
    new-instance p2, Lcom/android/launcher3/util/Y1;

    .line 27
    .line 28
    invoke-direct {p2}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v2, Lcom/android/quickstep/RecentsActivity$1;

    .line 32
    .line 33
    invoke-direct {v2, p0, v1, v0, p2}, Lcom/android/quickstep/RecentsActivity$1;-><init>(Lcom/android/quickstep/RecentsActivity;Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Lcom/android/launcher3/util/Y1;)V

    .line 34
    .line 35
    .line 36
    iput-object v2, p0, Lcom/android/quickstep/RecentsActivity;->mActivityLaunchAnimationRunner:Lcom/android/launcher3/M2$b;

    .line 37
    .line 38
    new-instance v4, Lcom/android/launcher3/M2;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mUiHandler:Landroid/os/Handler;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/quickstep/RecentsActivity;->mActivityLaunchAnimationRunner:Lcom/android/launcher3/M2$b;

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    invoke-direct {v4, v0, v1, v2}, Lcom/android/launcher3/M2;-><init>(Landroid/os/Handler;Lcom/android/launcher3/M2$b;Z)V

    .line 46
    .line 47
    .line 48
    new-instance v3, Landroid/view/RemoteAnimationAdapter;

    .line 49
    .line 50
    const-wide/16 v5, 0x150

    .line 51
    .line 52
    const-wide/16 v7, 0x78

    .line 53
    .line 54
    invoke-direct/range {v3 .. v8}, Landroid/view/RemoteAnimationAdapter;-><init>(Landroid/view/IRemoteAnimationRunner;JJ)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Landroid/window/RemoteTransition;

    .line 58
    .line 59
    invoke-virtual {v4}, Lu2/p;->y2()Landroid/window/IRemoteTransition;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {p0}, Landroid/app/Activity;->getIApplicationThread()Landroid/app/IApplicationThread;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    const-string v5, "LaunchFromRecents"

    .line 68
    .line 69
    invoke-direct {v0, v1, v4, v5}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Landroid/app/IApplicationThread;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v3, v0}, Landroid/app/ActivityOptions;->makeRemoteAnimation(Landroid/view/RemoteAnimationAdapter;Landroid/window/RemoteTransition;)Landroid/app/ActivityOptions;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Lcom/android/launcher3/util/b;

    .line 77
    .line 78
    invoke-direct {v1, v0, p2}, Lcom/android/launcher3/util/b;-><init>(Landroid/app/ActivityOptions;Lcom/android/launcher3/util/Y1;)V

    .line 79
    .line 80
    .line 81
    iget-object p2, v1, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 82
    .line 83
    invoke-virtual {p2, v2}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 84
    .line 85
    .line 86
    iget-object p2, v1, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 87
    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    if-eqz v0, :cond_2

    .line 95
    .line 96
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    goto :goto_0

    .line 105
    :cond_2
    const/4 p1, 0x0

    .line 106
    :goto_0
    invoke-virtual {p2, p1}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;

    .line 107
    .line 108
    .line 109
    iget-object p1, v1, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 110
    .line 111
    invoke-virtual {p1, v2}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/android/launcher3/statemanager/h;->mHandler:Landroid/os/Handler;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mAnimationStartTimeoutRunnable:Ljava/lang/Runnable;

    .line 117
    .line 118
    const-wide/16 v2, 0x3e8

    .line 119
    .line 120
    invoke-virtual {p1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 121
    .line 122
    .line 123
    return-object v1

    .line 124
    :cond_3
    :goto_1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/v;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    return-object p0
.end method

.method public bridge synthetic getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getAppsView()Lcom/android/launcher3/allapps/r;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getCellPosMapper()Lc1/c;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getCellPosMapper()Lc1/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getContent()Lcom/android/launcher3/util/Y0;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getContent()Lcom/android/launcher3/util/Y0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getDragController()Lcom/android/launcher3/dragndrop/j;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mDragLayer:Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getDropTargetHandler()Lcom/android/launcher3/q0;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getDropTargetHandler()Lcom/android/launcher3/q0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getFolderBoundingBox()Landroid/graphics/Rect;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getFolderBoundingBox()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getIfIgnorestylusGesture()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getIfIgnorestylusGesture()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic getItemOnClickListener()Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getOverviewPanel()Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->getOverviewPanel()Lcom/android/quickstep/fallback/FallbackRecentsView;

    move-result-object p0

    return-object p0
.end method

.method public getOverviewPanel()Lcom/android/quickstep/fallback/FallbackRecentsView;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mFallbackRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    return-object p0
.end method

.method public bridge synthetic getPopupDataProvider()Lcom/android/launcher3/popup/n;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getScrimView()Lcom/android/launcher3/views/ScrimView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mScrimView:Lcom/android/launcher3/views/ScrimView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStateManager()Lcom/android/launcher3/statemanager/d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/statemanager/d<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            "Lcom/android/quickstep/RecentsActivity;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mStateManager:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getStringCache()Lz1/G4;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getTaskbarUIController()Lcom/android/launcher3/taskbar/e;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/taskbar/e<",
            "Lcom/android/quickstep/RecentsActivity;",
            ">;"
        }
    .end annotation

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mTaskbarUIController:Lcom/android/launcher3/taskbar/e;

    return-object p0
.end method

.method public bridge synthetic getTaskbarUIController()Lcom/android/launcher3/taskbar/o4;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->getTaskbarUIController()Lcom/android/launcher3/taskbar/e;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getWidgetPickerDataProvider()Ln2/c;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic handleIncorrectSplitTargetSelection()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->handleIncorrectSplitTargetSelection()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic hasBubbles()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->hasBubbles()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic hideKeyboard()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->hideKeyboard()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic isBubbleBarEnabled()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isBubbleBarEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isHardwareKeyboard()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isHardwareKeyboard()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isInState(Lcom/android/launcher3/statemanager/a;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public isRecentsViewVisible()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/quickstep/fallback/RecentsState;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/RecentsState;->isRecentsViewVisible()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public bridge synthetic isSoftwareKeyboardHidden()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isSoftwareKeyboardHidden()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isSplitSelectionActive()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isSplitSelectionActive()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/k;->logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->startHome()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/statemanager/h;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/android/launcher3/util/m3;->b(Landroid/app/Activity;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/statemanager/d;

    .line 8
    .line 9
    sget-object v1, Lcom/android/quickstep/fallback/RecentsState;->BG_LAUNCHER:Lcom/android/quickstep/fallback/RecentsState;

    .line 10
    .line 11
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/statemanager/d;-><init>(Lcom/android/launcher3/statemanager/i;Lcom/android/launcher3/statemanager/a;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mStateManager:Lcom/android/launcher3/statemanager/d;

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/quickstep/RecentsActivity;->initDeviceProfile()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->setupViews()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const v1, 0x7f04038d

    .line 27
    .line 28
    .line 29
    invoke-static {p0, v1}, Lcom/android/launcher3/util/F2;->c(Landroid/content/Context;I)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/util/E2;->c(IZ)V

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/android/quickstep/RecentsActivity;->ACTIVITY_TRACKER:Lcom/android/launcher3/util/H$a;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/H;->handleCreate(Lcom/android/launcher3/views/k;)Z

    .line 40
    .line 41
    .line 42
    const v0, 0x7f140033

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(I)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsActivity;->restoreState(Landroid/os/Bundle;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->getOverviewPanel()Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->destroy()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/v;->onDestroy()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/android/quickstep/RecentsActivity;->ACTIVITY_TRACKER:Lcom/android/launcher3/util/H$a;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/H;->onContextDestroyed(Lcom/android/launcher3/views/k;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mActivityLaunchAnimationRunner:Lcom/android/launcher3/M2$b;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->onDestroy()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/quickstep/util/TISBindHelper;->onDestroy()V

    .line 29
    .line 30
    .line 31
    const-string v0, "RecentsActivity"

    .line 32
    .line 33
    const-string v1, "onDestroy"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mFallbackRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->clearRecentsAnimationTargetsMFV()V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mFallbackRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->clearOnScrollChangedListener()V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public onEnterAnimationComplete()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onEnterAnimationComplete()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/quickstep/RecentsModel;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsModel;->getThumbnailCache()Lcom/android/quickstep/TaskThumbnailCache;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/TaskThumbnailCache;->getHighResLoadingState()Lcom/android/quickstep/HighResLoadingState;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p0, v0}, Lcom/android/quickstep/HighResLoadingState;->setVisible(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onHandleConfigurationChanged(ZZZZ)V
    .locals 0

    .line 1
    const-wide/16 p1, 0x1000

    .line 2
    .line 3
    const-string p3, "recentsActivity_onHandleConfigurationChanged"

    .line 4
    .line 5
    invoke-static {p1, p2, p3}, Landroid/os/Trace;->instant(JLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/RecentsActivity;->initDeviceProfile()V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    const p2, 0xf289d8b

    .line 13
    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->dispatchDeviceProfileChanged()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/h;->reapplyUi()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mDragLayer:Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/RecentsDragLayer;->recreateControllers()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onMultiWindowModeChanged(ZLandroid/content/res/Configuration;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/android/quickstep/RecentsActivity;->onHandleConfigurationChanged(ZZZZ)V

    .line 3
    .line 4
    .line 5
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/v;->onMultiWindowModeChanged(ZLandroid/content/res/Configuration;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/android/quickstep/RecentsActivity;->ACTIVITY_TRACKER:Lcom/android/launcher3/util/H$a;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/H;->handleNewIntent(Lcom/android/launcher3/views/k;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/statemanager/h;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x2

    .line 9
    invoke-static {p0, v0}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendStateEventToTest(Landroid/content/Context;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mStateManager:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/fallback/RecentsState;

    .line 8
    .line 9
    iget v0, v0, Lcom/android/quickstep/fallback/RecentsState;->ordinal:I

    .line 10
    .line 11
    const-string v1, "launcher.state"

    .line 12
    .line 13
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mFallbackRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->setContentAlpha(F)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Lcom/android/launcher3/v;->onStart()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mFallbackRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->updateLocusId()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public bridge synthetic onStateSetEnd(Lcom/android/launcher3/statemanager/a;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentsActivity;->onStateSetEnd(Lcom/android/quickstep/fallback/RecentsState;)V

    return-void
.end method

.method public onStateSetEnd(Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 1

    .line 2
    invoke-super {p0, p1}, Lcom/android/launcher3/statemanager/i;->onStateSetEnd(Lcom/android/launcher3/statemanager/a;)V

    .line 3
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->DEFAULT:Lcom/android/quickstep/fallback/RecentsState;

    if-ne p1, v0, :cond_0

    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    const/4 p1, 0x2

    invoke-static {p0, p1}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendStateEventToTest(Landroid/content/Context;I)V

    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/statemanager/h;->onStop()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x14

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/quickstep/RecentsActivity;->onTrimMemory(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/RecentsActivity;->mFallbackRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->updateLocusId()V

    .line 12
    .line 13
    .line 14
    const-string v0, "TAPL_LAUNCHER_ACTIVITY_STOPPED"

    .line 15
    .line 16
    invoke-static {p0, v0}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendTestProtocolEventToTest(Landroid/content/Context;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onTrimMemory(I)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/quickstep/RecentsModel;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentsModel;->onTrimMemory(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public bridge synthetic removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic resetDraglayer()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->resetDraglayer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public returnToHomescreen()V
    .locals 0

    .line 1
    return-void
.end method

.method public runOnBindToTouchInteractionService(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/TISBindHelper;->runOnBindToTouchInteractionService(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic sendPendingIntentWithAnimation(Landroid/view/View;Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/k;->sendPendingIntentWithAnimation(Landroid/view/View;Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public setTaskbarUIController(Lcom/android/launcher3/taskbar/o4;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/taskbar/e;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/quickstep/RecentsActivity;->mTaskbarUIController:Lcom/android/launcher3/taskbar/e;

    .line 4
    .line 5
    return-void
.end method

.method protected setupViews()V
    .locals 9

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v6, v0

    .line 8
    check-cast v6, Lcom/android/quickstep/SystemUiProxy;

    .line 9
    .line 10
    new-instance v1, Lcom/android/quickstep/util/SplitSelectStateController;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    move-object v7, v0

    .line 27
    check-cast v7, Lcom/android/quickstep/RecentsModel;

    .line 28
    .line 29
    const/4 v8, 0x0

    .line 30
    const/4 v4, 0x0

    .line 31
    move-object v2, p0

    .line 32
    invoke-direct/range {v1 .. v8}, Lcom/android/quickstep/util/SplitSelectStateController;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/statemanager/d;LP1/h;Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/RecentsModel;Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    iput-object v1, v2, Lcom/android/quickstep/RecentsActivity;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 36
    .line 37
    const p0, 0x7f0e00d2

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, p0}, Lcom/android/launcher3/statemanager/h;->inflateRootView(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const v0, 0x7f0b022d

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 55
    .line 56
    iput-object v0, v2, Lcom/android/quickstep/RecentsActivity;->mDragLayer:Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 57
    .line 58
    const v0, 0x7f0b050a

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/android/launcher3/views/ScrimView;

    .line 66
    .line 67
    iput-object v0, v2, Lcom/android/quickstep/RecentsActivity;->mScrimView:Lcom/android/launcher3/views/ScrimView;

    .line 68
    .line 69
    const v0, 0x7f0b045e

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 77
    .line 78
    iput-object v0, v2, Lcom/android/quickstep/RecentsActivity;->mFallbackRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 79
    .line 80
    const v0, 0x7f0b045d

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Lcom/android/quickstep/views/OverviewActionsView;

    .line 88
    .line 89
    iput-object v0, v2, Lcom/android/quickstep/RecentsActivity;->mActionsView:Lcom/android/quickstep/views/OverviewActionsView;

    .line 90
    .line 91
    invoke-static {v2}, LO2/d;->c(Landroid/content/Context;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_0

    .line 96
    .line 97
    new-instance v0, Lj1/k;

    .line 98
    .line 99
    invoke-virtual {v2}, Lcom/android/quickstep/RecentsActivity;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v2}, Landroid/app/Activity;->getIApplicationThread()Landroid/app/IApplicationThread;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    const/4 v4, 0x0

    .line 108
    invoke-direct {v0, v1, v6, v3, v4}, Lj1/k;-><init>(Lcom/android/launcher3/statemanager/d;Lcom/android/quickstep/SystemUiProxy;Landroid/app/IApplicationThread;LP1/h;)V

    .line 109
    .line 110
    .line 111
    iput-object v0, v2, Lcom/android/quickstep/RecentsActivity;->mDesktopRecentsTransitionController:Lj1/k;

    .line 112
    .line 113
    :cond_0
    iget-object v0, v2, Lcom/android/quickstep/RecentsActivity;->mFallbackRecentsView:Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 114
    .line 115
    iget-object v1, v2, Lcom/android/quickstep/RecentsActivity;->mActionsView:Lcom/android/quickstep/views/OverviewActionsView;

    .line 116
    .line 117
    iget-object v3, v2, Lcom/android/quickstep/RecentsActivity;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 118
    .line 119
    iget-object v4, v2, Lcom/android/quickstep/RecentsActivity;->mDesktopRecentsTransitionController:Lj1/k;

    .line 120
    .line 121
    invoke-virtual {v0, v1, v3, v4}, Lcom/android/quickstep/fallback/FallbackRecentsView;->init(Lcom/android/quickstep/views/OverviewActionsView;Lcom/android/quickstep/util/SplitSelectStateController;Lj1/k;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v2, p0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/android/launcher3/LauncherRootView;->getSysUiScrim()Ln1/x;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0}, Ln1/x;->f()Lcom/android/launcher3/anim/d;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    const/4 v0, 0x0

    .line 136
    invoke-virtual {p0, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 137
    .line 138
    .line 139
    iget-object p0, v2, Lcom/android/quickstep/RecentsActivity;->mDragLayer:Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/RecentsDragLayer;->recreateControllers()V

    .line 142
    .line 143
    .line 144
    new-instance p0, Lcom/android/quickstep/util/TISBindHelper;

    .line 145
    .line 146
    new-instance v0, Lcom/android/quickstep/J2;

    .line 147
    .line 148
    invoke-direct {v0, v2}, Lcom/android/quickstep/J2;-><init>(Lcom/android/quickstep/RecentsActivity;)V

    .line 149
    .line 150
    .line 151
    invoke-direct {p0, v2, v0}, Lcom/android/quickstep/util/TISBindHelper;-><init>(Landroid/content/Context;Ljava/util/function/Consumer;)V

    .line 152
    .line 153
    .line 154
    iput-object p0, v2, Lcom/android/quickstep/RecentsActivity;->mTISBindHelper:Lcom/android/quickstep/util/TISBindHelper;

    .line 155
    .line 156
    return-void
.end method

.method public shouldAnimateStateChange()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/k;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public startHome()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsActivity;->getOverviewPanel()Lcom/android/quickstep/fallback/FallbackRecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lf1/a;->J:Lf1/a$a;

    .line 6
    .line 7
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/RecentsActivity;->startHomeInternal()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance v1, Lcom/android/quickstep/L2;

    .line 18
    .line 19
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/L2;-><init>(Lcom/android/quickstep/RecentsActivity;Lcom/android/quickstep/views/RecentsView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    const/4 p0, 0x0

    .line 26
    invoke-virtual {v0, p0}, Lcom/android/quickstep/views/RecentsView;->setSwipeUpToRecnetLockedApp(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public bridge synthetic startSplitSelection(Lcom/android/launcher3/util/y2$c;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->startSplitSelection(Lcom/android/launcher3/util/y2$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic updateOpenFolderPosition([ILandroid/graphics/Rect;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/views/k;->updateOpenFolderPosition([ILandroid/graphics/Rect;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
