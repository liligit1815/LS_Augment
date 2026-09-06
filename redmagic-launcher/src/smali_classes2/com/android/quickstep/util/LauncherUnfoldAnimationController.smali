.class public Lcom/android/quickstep/util/LauncherUnfoldAnimationController;
.super Ljava/lang/Object;
.source "LauncherUnfoldAnimationController.java"

# interfaces
.implements Lcom/android/launcher3/X3$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;,
        Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;,
        Lcom/android/quickstep/util/LauncherUnfoldAnimationController$QsbAnimationListener;
    }
.end annotation


# static fields
.field private static final HOTSEAT_SCALE_PROPERTY:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/Hotseat;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_WIDTH_INSET_FRACTION:F = 0.04f

.field private static final TRACE_WAIT_TO_HANDLE_UNFOLD_TRANSITION:Ljava/lang/String; = "LauncherUnfoldAnimationController#waitingForTheNextFrame"

.field private static final WORKSPACE_SCALE_PROPERTY:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/Workspace<",
            "*>;>;"
        }
    .end annotation
.end field


# instance fields
.field private final mExternalTransitionStatusProvider:Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;

.field private mIsTablet:Ljava/lang/Boolean;

.field private final mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private final mNaturalOrientationProgressProvider:LF2/f;

.field private mPreemptiveProgressProvider:Lcom/android/quickstep/util/unfold/PreemptiveUnfoldTransitionProgressProvider;

.field private final mProgressProvider:LF2/i;

.field private mQsbInsettable:Lcom/android/launcher3/util/u0;

.field private final mUnfoldMoveFromCenterHotseatAnimator:Lcom/android/quickstep/util/UnfoldMoveFromCenterHotseatAnimator;

.field private final mUnfoldMoveFromCenterWorkspaceAnimator:Lcom/android/quickstep/util/UnfoldMoveFromCenterWorkspaceAnimator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/G2;->c:Lcom/android/launcher3/util/y1;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->WORKSPACE_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 13
    .line 14
    sget-object v0, Lcom/android/launcher3/G2;->d:Lcom/android/launcher3/util/y1;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->HOTSEAT_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Landroid/view/WindowManager;LC2/i;LE2/c;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;-><init>(Lcom/android/quickstep/util/p0;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mExternalTransitionStatusProvider:Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;

    .line 11
    .line 12
    iput-object v1, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mPreemptiveProgressProvider:Lcom/android/quickstep/util/unfold/PreemptiveUnfoldTransitionProgressProvider;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mIsTablet:Ljava/lang/Boolean;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    new-instance v2, Lcom/android/quickstep/util/unfold/PreemptiveUnfoldTransitionProgressProvider;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/app/Activity;->getMainThreadHandler()Landroid/os/Handler;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-direct {v2, p3, v3}, Lcom/android/quickstep/util/unfold/PreemptiveUnfoldTransitionProgressProvider;-><init>(LC2/i;Landroid/os/Handler;)V

    .line 25
    .line 26
    .line 27
    iput-object v2, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mPreemptiveProgressProvider:Lcom/android/quickstep/util/unfold/PreemptiveUnfoldTransitionProgressProvider;

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/android/quickstep/util/unfold/PreemptiveUnfoldTransitionProgressProvider;->init()V

    .line 30
    .line 31
    .line 32
    new-instance v2, LF2/i;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mPreemptiveProgressProvider:Lcom/android/quickstep/util/unfold/PreemptiveUnfoldTransitionProgressProvider;

    .line 35
    .line 36
    invoke-direct {v2, v3}, LF2/i;-><init>(LC2/i;)V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mProgressProvider:LF2/i;

    .line 40
    .line 41
    invoke-interface {p3, v0}, LF2/d;->addCallback(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    new-instance v0, Lcom/android/quickstep/util/unfold/LauncherJankMonitorTransitionProgressListener;

    .line 45
    .line 46
    new-instance v3, Lcom/android/quickstep/util/o0;

    .line 47
    .line 48
    invoke-direct {v3, p1}, Lcom/android/quickstep/util/o0;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 49
    .line 50
    .line 51
    invoke-direct {v0, v3}, Lcom/android/quickstep/util/unfold/LauncherJankMonitorTransitionProgressListener;-><init>(Ljava/util/function/Supplier;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {p3, v0}, LF2/d;->addCallback(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    new-instance p3, Lcom/android/quickstep/util/UnfoldMoveFromCenterHotseatAnimator;

    .line 58
    .line 59
    invoke-direct {p3, p1, p2, p4}, Lcom/android/quickstep/util/UnfoldMoveFromCenterHotseatAnimator;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Landroid/view/WindowManager;LE2/c;)V

    .line 60
    .line 61
    .line 62
    iput-object p3, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mUnfoldMoveFromCenterHotseatAnimator:Lcom/android/quickstep/util/UnfoldMoveFromCenterHotseatAnimator;

    .line 63
    .line 64
    new-instance v0, Lcom/android/quickstep/util/UnfoldMoveFromCenterWorkspaceAnimator;

    .line 65
    .line 66
    invoke-direct {v0, p1, p2, p4}, Lcom/android/quickstep/util/UnfoldMoveFromCenterWorkspaceAnimator;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Landroid/view/WindowManager;LE2/c;)V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mUnfoldMoveFromCenterWorkspaceAnimator:Lcom/android/quickstep/util/UnfoldMoveFromCenterWorkspaceAnimator;

    .line 70
    .line 71
    new-instance p2, LF2/f;

    .line 72
    .line 73
    invoke-direct {p2, p1, p4, v2}, LF2/f;-><init>(Landroid/content/Context;LE2/c;LC2/i;)V

    .line 74
    .line 75
    .line 76
    iput-object p2, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mNaturalOrientationProgressProvider:LF2/f;

    .line 77
    .line 78
    invoke-virtual {p2}, LF2/f;->c()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2, v0}, LF2/i;->c(LC2/i$a;)V

    .line 82
    .line 83
    .line 84
    new-instance p4, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;

    .line 85
    .line 86
    invoke-direct {p4, p0, v1}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$LauncherScaleAnimationListener;-><init>(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;Lcom/android/quickstep/util/p0;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2, p4}, LF2/i;->c(LC2/i$a;)V

    .line 90
    .line 91
    .line 92
    new-instance p4, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$QsbAnimationListener;

    .line 93
    .line 94
    invoke-direct {p4, p0, v1}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$QsbAnimationListener;-><init>(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;Lcom/android/quickstep/util/p0;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p2, p4}, LF2/f;->b(LC2/i$a;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p2, p3}, LF2/f;->b(LC2/i$a;)V

    .line 101
    .line 102
    .line 103
    invoke-interface {p1, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->lambda$preemptivelyStartAnimationOnNextFrame$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)Lcom/android/launcher3/util/u0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mQsbInsettable:Lcom/android/launcher3/util/u0;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d()Landroid/util/FloatProperty;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->HOTSEAT_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic e()Landroid/util/FloatProperty;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->WORKSPACE_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 2
    .line 3
    return-object v0
.end method

.method private synthetic lambda$preemptivelyStartAnimationOnNextFrame$0()V
    .locals 4

    .line 1
    const-string v0, "LauncherUnfoldAnimationController#waitingForTheNextFrame"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-wide/16 v2, 0x1000

    .line 5
    .line 6
    invoke-static {v2, v3, v0, v1}, Landroid/os/Trace;->asyncTraceEnd(JLjava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mPreemptiveProgressProvider:Lcom/android/quickstep/util/unfold/PreemptiveUnfoldTransitionProgressProvider;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/unfold/PreemptiveUnfoldTransitionProgressProvider;->preemptivelyStartTransition(Ljava/lang/Float;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private preemptivelyStartAnimationOnNextFrame()V
    .locals 4

    .line 1
    const-string v0, "LauncherUnfoldAnimationController#waitingForTheNextFrame"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-wide/16 v2, 0x1000

    .line 5
    .line 6
    invoke-static {v2, v3, v0, v1}, Landroid/os/Trace;->asyncTraceBegin(JLjava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Lcom/android/quickstep/util/n0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/n0;-><init>(Lcom/android/quickstep/util/LauncherUnfoldAnimationController;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, LJ/z;->a(Landroid/view/View;Ljava/lang/Runnable;)LJ/z;

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public onDestroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mProgressProvider:LF2/i;

    .line 2
    .line 3
    invoke-virtual {v0}, LF2/i;->destroy()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mNaturalOrientationProgressProvider:LF2/f;

    .line 7
    .line 8
    invoke-virtual {v0}, LF2/f;->destroy()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    invoke-interface {v0, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mIsTablet:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eq v1, v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/quickstep/SystemUiProxy;->isActive()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mExternalTransitionStatusProvider:Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;->hasRun()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->preemptivelyStartAnimationOnNextFrame()V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 45
    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mExternalTransitionStatusProvider:Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController$TransitionStatusProvider;->onFolded()V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 54
    .line 55
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mIsTablet:Ljava/lang/Boolean;

    .line 60
    .line 61
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mProgressProvider:LF2/i;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, LF2/i;->i(Z)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mQsbInsettable:Lcom/android/launcher3/util/u0;

    .line 9
    .line 10
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->getQsb()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    instance-of v1, v1, Lcom/android/launcher3/util/u0;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->getQsb()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/launcher3/util/u0;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mQsbInsettable:Lcom/android/launcher3/util/u0;

    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mProgressProvider:LF2/i;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p0, v0}, LF2/i;->i(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public updateRegisteredViewsIfNeeded()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mUnfoldMoveFromCenterHotseatAnimator:Lcom/android/quickstep/util/UnfoldMoveFromCenterHotseatAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->updateRegisteredViewsIfNeeded()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->mUnfoldMoveFromCenterWorkspaceAnimator:Lcom/android/quickstep/util/UnfoldMoveFromCenterWorkspaceAnimator;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->updateRegisteredViewsIfNeeded()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
