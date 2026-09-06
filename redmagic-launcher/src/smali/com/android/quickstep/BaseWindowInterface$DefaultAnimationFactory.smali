.class Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;
.super Ljava/lang/Object;
.source "BaseWindowInterface.java"

# interfaces
.implements Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/BaseWindowInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DefaultAnimationFactory"
.end annotation


# instance fields
.field private final mCallback:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/util/AnimatorControllerWithResistance;",
            ">;"
        }
    .end annotation
.end field

.field private mHasEverAttachedToWindow:Z

.field private mIsAttachedToWindow:Z

.field protected final mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

.field private final mStartState:Lcom/android/quickstep/fallback/RecentsState;

.field final synthetic this$0:Lcom/android/quickstep/BaseWindowInterface;


# direct methods
.method constructor <init>(Lcom/android/quickstep/BaseWindowInterface;Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/util/AnimatorControllerWithResistance;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseWindowInterface;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mCallback:Ljava/util/function/Consumer;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/quickstep/BaseWindowInterface;->getCreatedContainer()Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mStartState:Lcom/android/quickstep/fallback/RecentsState;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;Lcom/android/launcher3/anim/q;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->lambda$createContainerInterface$0(Lcom/android/launcher3/anim/q;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mHasEverAttachedToWindow:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mIsAttachedToWindow:Z

    .line 2
    .line 3
    return-void
.end method

.method private synthetic lambda$createContainerInterface$0(Lcom/android/launcher3/anim/q;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->o()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    float-to-double v1, p1

    .line 12
    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    .line 13
    .line 14
    cmpl-double p1, v1, v3

    .line 15
    .line 16
    if-lez p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseWindowInterface;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/android/quickstep/BaseWindowInterface;->a(Lcom/android/quickstep/BaseWindowInterface;)Lcom/android/quickstep/fallback/RecentsState;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseWindowInterface;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/quickstep/BaseContainerInterface;->mBackgroundState:Lcom/android/launcher3/statemanager/a;

    .line 28
    .line 29
    check-cast p0, Lcom/android/quickstep/fallback/RecentsState;

    .line 30
    .line 31
    :goto_0
    const/4 p1, 0x0

    .line 32
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method protected createBackgroundToOverviewAnim(Lcom/android/quickstep/fallback/window/RecentsWindowManager;Lcom/android/launcher3/anim/V;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getOverviewPanel()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    move-object v1, p1

    .line 6
    check-cast v1, Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getMaxScaleForFullScreen()F

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    const/high16 v4, 0x3f800000    # 1.0f

    .line 17
    .line 18
    move-object v0, p2

    .line 19
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 20
    .line 21
    .line 22
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->FULLSCREEN_PROGRESS:Landroid/util/FloatProperty;

    .line 23
    .line 24
    const/high16 v3, 0x3f800000    # 1.0f

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$2;

    .line 31
    .line 32
    invoke-direct {p1, p0}, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$2;-><init>(Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p1}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public createContainerInterface(J)V
    .locals 9

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/V;

    .line 2
    .line 3
    const-wide/16 v1, 0x2

    .line 4
    .line 5
    mul-long/2addr p1, v1

    .line 6
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->createBackgroundToOverviewAnim(Lcom/android/quickstep/fallback/window/RecentsWindowManager;Lcom/android/launcher3/anim/V;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, v1}, Lcom/android/launcher3/statemanager/d;->g0(Lcom/android/launcher3/anim/q;)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Lcom/android/quickstep/I0;

    .line 28
    .line 29
    invoke-direct {p1, p0, v1}, Lcom/android/quickstep/I0;-><init>(Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;Lcom/android/launcher3/anim/q;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p1}, Lcom/android/launcher3/anim/q;->v(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getOverviewPanel()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    move-object v5, p1

    .line 42
    check-cast v5, Lcom/android/quickstep/views/RecentsView;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 45
    .line 46
    invoke-virtual {v5}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iget-object p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    sget-object v6, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 57
    .line 58
    sget-object v8, Lcom/android/quickstep/views/RecentsView;->TASK_SECONDARY_TRANSLATION:Landroid/util/FloatProperty;

    .line 59
    .line 60
    move-object v7, v5

    .line 61
    invoke-static/range {v1 .. v8}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->createForRecents(Lcom/android/launcher3/anim/q;Landroid/content/Context;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/launcher3/h0;Ljava/lang/Object;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/util/FloatProperty;)Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object p2, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mCallback:Ljava/util/function/Consumer;

    .line 66
    .line 67
    invoke-interface {p2, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 71
    .line 72
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    sget-object p2, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 77
    .line 78
    if-ne p1, p2, :cond_0

    .line 79
    .line 80
    iget-boolean p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mIsAttachedToWindow:Z

    .line 81
    .line 82
    const/4 p2, 0x0

    .line 83
    invoke-virtual {p0, p1, p2, p2}, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->setRecentsAttachedToAppWindow(ZZZ)V

    .line 84
    .line 85
    .line 86
    :cond_0
    return-void
.end method

.method public hasRecentsEverAttachedToAppWindow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mHasEverAttachedToWindow:Z

    .line 2
    .line 3
    return p0
.end method

.method protected initBackgroundStateUI()Lcom/android/quickstep/fallback/window/RecentsWindowManager;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mStartState:Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/RecentsState;->shouldDisableRestore()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->B()Lcom/android/launcher3/statemanager/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/quickstep/fallback/RecentsState;

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v0}, Lcom/android/launcher3/statemanager/d;->i0(Lcom/android/launcher3/statemanager/a;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseWindowInterface;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/android/quickstep/BaseContainerInterface;->mBackgroundState:Lcom/android/launcher3/statemanager/a;

    .line 39
    .line 40
    check-cast v1, Lcom/android/quickstep/fallback/RecentsState;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseWindowInterface;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->onInitBackgroundStateUI()V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 52
    .line 53
    return-object p0
.end method

.method public isRecentsAttachedToAppWindow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mIsAttachedToWindow:Z

    .line 2
    .line 3
    return p0
.end method

.method public setEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseWindowInterface;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/BaseContainerInterface;->stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/statemanager/a;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/android/quickstep/BaseWindowInterface;->b(Lcom/android/quickstep/BaseWindowInterface;Lcom/android/quickstep/fallback/RecentsState;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setRecentsAttachedToAppWindow(ZZZ)V
    .locals 8

    .line 1
    const/4 p3, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mIsAttachedToWindow:Z

    .line 4
    .line 5
    if-ne v1, p1, :cond_0

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1, v0}, Lcom/android/launcher3/statemanager/d;->l(I)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1, p3}, Lcom/android/launcher3/statemanager/d;->l(I)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 29
    .line 30
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v2, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$1;

    .line 34
    .line 35
    invoke-direct {v2, p0, p1}, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$1;-><init>(Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 39
    .line 40
    .line 41
    if-eqz p2, :cond_1

    .line 42
    .line 43
    const-wide/16 v2, 0x12c

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const-wide/16 v2, 0x0

    .line 47
    .line 48
    :goto_0
    iget-object p2, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 49
    .line 50
    invoke-virtual {p2}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    const/4 v4, 0x0

    .line 55
    const/high16 v5, 0x3f800000    # 1.0f

    .line 56
    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    move v6, v5

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    move v6, v4

    .line 62
    :goto_1
    new-array v7, p3, [F

    .line 63
    .line 64
    aput v6, v7, v0

    .line 65
    .line 66
    invoke-virtual {p2, v0, v7}, Lcom/android/launcher3/statemanager/d;->t(I[F)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    sget-object v6, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_3
    sget-object v6, LJ0/h;->G:Landroid/view/animation/Interpolator;

    .line 76
    .line 77
    :goto_2
    invoke-virtual {p2, v6}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p2, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 84
    .line 85
    .line 86
    sget-object p2, Lcom/android/quickstep/views/RecentsView;->ADJACENT_PAGE_HORIZONTAL_OFFSET:Landroid/util/FloatProperty;

    .line 87
    .line 88
    iget-object v6, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 89
    .line 90
    invoke-virtual {v6}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getOverviewPanel()Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    check-cast v6, Lcom/android/quickstep/views/RecentsView;

    .line 95
    .line 96
    invoke-virtual {p2, v6}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    check-cast p2, Ljava/lang/Float;

    .line 101
    .line 102
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-eqz p1, :cond_4

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_4
    move v4, v5

    .line 110
    :goto_3
    iget-object p0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->mRecentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    const/4 p1, 0x2

    .line 117
    new-array p1, p1, [F

    .line 118
    .line 119
    aput p2, p1, v0

    .line 120
    .line 121
    aput v4, p1, p3

    .line 122
    .line 123
    invoke-virtual {p0, p3, p1}, Lcom/android/launcher3/statemanager/d;->t(I[F)Landroid/animation/Animator;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 134
    .line 135
    .line 136
    return-void
.end method
