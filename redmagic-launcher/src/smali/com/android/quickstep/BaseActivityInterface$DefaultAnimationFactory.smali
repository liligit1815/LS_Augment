.class Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;
.super Ljava/lang/Object;
.source "BaseActivityInterface.java"

# interfaces
.implements Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/BaseActivityInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DefaultAnimationFactory"
.end annotation


# instance fields
.field protected final mActivity:Lcom/android/launcher3/statemanager/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TACTIVITY_TYPE;"
        }
    .end annotation
.end field

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

.field private final mStartState:Lcom/android/launcher3/statemanager/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TSTATE_TYPE;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/quickstep/BaseActivityInterface;


# direct methods
.method constructor <init>(Lcom/android/quickstep/BaseActivityInterface;Ljava/util/function/Consumer;)V
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
    iput-object p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseActivityInterface;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mCallback:Ljava/util/function/Consumer;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/quickstep/BaseActivityInterface;->getCreatedContainer()Lcom/android/launcher3/statemanager/h;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 13
    .line 14
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

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
    iput-object p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mStartState:Lcom/android/launcher3/statemanager/a;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;Lcom/android/launcher3/anim/q;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->lambda$createContainerInterface$0(Lcom/android/launcher3/anim/q;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mHasEverAttachedToWindow:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mIsAttachedToWindow:Z

    .line 2
    .line 3
    return-void
.end method

.method private synthetic lambda$createContainerInterface$0(Lcom/android/launcher3/anim/q;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getActivityFlags()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    and-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseActivityInterface;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/android/quickstep/BaseActivityInterface;->b(Lcom/android/quickstep/BaseActivityInterface;)Lcom/android/launcher3/statemanager/a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseActivityInterface;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/android/quickstep/BaseActivityInterface;->b(Lcom/android/quickstep/BaseActivityInterface;)Lcom/android/launcher3/statemanager/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->o()F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    float-to-double v1, p1

    .line 37
    const-wide v3, 0x3fd3333333333333L    # 0.3

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    cmpl-double p1, v1, v3

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseActivityInterface;

    .line 45
    .line 46
    if-lez p1, :cond_1

    .line 47
    .line 48
    invoke-static {p0}, Lcom/android/quickstep/BaseActivityInterface;->a(Lcom/android/quickstep/BaseActivityInterface;)Lcom/android/launcher3/statemanager/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/BaseContainerInterface;->mBackgroundState:Lcom/android/launcher3/statemanager/a;

    .line 54
    .line 55
    :goto_0
    const/4 p1, 0x0

    .line 56
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method protected createBackgroundToOverviewAnim(Lcom/android/launcher3/statemanager/h;Lcom/android/launcher3/anim/V;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TACTIVITY_TYPE;",
            "Lcom/android/launcher3/anim/V;",
            ")V"
        }
    .end annotation

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 3
    .line 4
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    move-object v2, v0

    .line 9
    check-cast v2, Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, v0}, Lcom/android/quickstep/views/RecentsView;->getTaskSize(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    sget-object v3, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY_PIVOT:Landroid/util/FloatProperty;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getMaxScaleForFullScreen()F

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    sget-object v6, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    const/high16 v5, 0x3f800000    # 1.0f

    .line 31
    .line 32
    move-object v1, p2

    .line 33
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 34
    .line 35
    .line 36
    sget-object v3, Lcom/android/quickstep/views/RecentsView;->FULLSCREEN_PROGRESS:Landroid/util/FloatProperty;

    .line 37
    .line 38
    const/high16 v4, 0x3f800000    # 1.0f

    .line 39
    .line 40
    const/4 v5, 0x0

    .line 41
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 42
    .line 43
    .line 44
    new-instance p1, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory$2;

    .line 45
    .line 46
    invoke-direct {p1, p0}, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory$2;-><init>(Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, p1}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 50
    .line 51
    .line 52
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
    iget-object p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->createBackgroundToOverviewAnim(Lcom/android/launcher3/statemanager/h;Lcom/android/launcher3/anim/V;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 19
    .line 20
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, v1}, Lcom/android/launcher3/statemanager/d;->g0(Lcom/android/launcher3/anim/q;)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Lcom/android/quickstep/H0;

    .line 28
    .line 29
    invoke-direct {p1, p0, v1}, Lcom/android/quickstep/H0;-><init>(Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;Lcom/android/launcher3/anim/q;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p1}, Lcom/android/launcher3/anim/q;->v(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 36
    .line 37
    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 38
    .line 39
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    move-object v5, p1

    .line 44
    check-cast v5, Lcom/android/quickstep/views/RecentsView;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 47
    .line 48
    invoke-virtual {v5}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iget-object p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    sget-object v6, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 59
    .line 60
    sget-object v8, Lcom/android/quickstep/views/RecentsView;->TASK_SECONDARY_TRANSLATION:Landroid/util/FloatProperty;

    .line 61
    .line 62
    move-object v7, v5

    .line 63
    invoke-static/range {v1 .. v8}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->createForRecents(Lcom/android/launcher3/anim/q;Landroid/content/Context;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/launcher3/h0;Ljava/lang/Object;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/util/FloatProperty;)Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object p2, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mCallback:Ljava/util/function/Consumer;

    .line 68
    .line 69
    invoke-interface {p2, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 73
    .line 74
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    sget-object p2, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 79
    .line 80
    if-ne p1, p2, :cond_0

    .line 81
    .line 82
    iget-boolean p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mIsAttachedToWindow:Z

    .line 83
    .line 84
    const/4 p2, 0x0

    .line 85
    invoke-virtual {v5}, Lcom/android/quickstep/views/RecentsView;->shouldUpdateRunningTaskAlpha()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->setRecentsAttachedToAppWindow(ZZZ)V

    .line 90
    .line 91
    .line 92
    :cond_0
    return-void
.end method

.method public hasRecentsEverAttachedToAppWindow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mHasEverAttachedToWindow:Z

    .line 2
    .line 3
    return p0
.end method

.method protected initBackgroundStateUI()Lcom/android/launcher3/statemanager/h;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TACTIVITY_TYPE;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mStartState:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/statemanager/a;->shouldDisableRestore()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

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
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 20
    .line 21
    invoke-interface {v1}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1, v0}, Lcom/android/launcher3/statemanager/d;->i0(Lcom/android/launcher3/statemanager/a;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 29
    .line 30
    invoke-interface {v0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseActivityInterface;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/android/quickstep/BaseContainerInterface;->mBackgroundState:Lcom/android/launcher3/statemanager/a;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseActivityInterface;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->onInitBackgroundStateUI()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 48
    .line 49
    return-object p0
.end method

.method public isRecentsAttachedToAppWindow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mIsAttachedToWindow:Z

    .line 2
    .line 3
    return p0
.end method

.method public setEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseActivityInterface;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/quickstep/BaseContainerInterface;->stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/statemanager/a;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Lcom/android/quickstep/BaseActivityInterface;->c(Lcom/android/quickstep/BaseActivityInterface;Lcom/android/launcher3/statemanager/a;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseActivityInterface;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/android/quickstep/BaseActivityInterface;->stateFromGestureEndTargetCanceled(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/statemanager/a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p0, p1}, Lcom/android/quickstep/BaseActivityInterface;->d(Lcom/android/quickstep/BaseActivityInterface;Lcom/android/launcher3/statemanager/a;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setRecentsAttachedToAppWindow(ZZZ)V
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    new-instance v3, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v4, "setRecentsAttachedToAppWindow "

    .line 10
    .line 11
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v4, " "

    .line 18
    .line 19
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v4, ", state = "

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v4, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 31
    .line 32
    invoke-interface {v4}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const-string v4, "BaseContainerInterface"

    .line 48
    .line 49
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    iget-boolean v3, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mIsAttachedToWindow:Z

    .line 53
    .line 54
    if-ne v3, p1, :cond_0

    .line 55
    .line 56
    if-eqz p2, :cond_0

    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    if-nez p1, :cond_1

    .line 60
    .line 61
    if-nez p2, :cond_1

    .line 62
    .line 63
    iget-object v3, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 64
    .line 65
    invoke-interface {v3}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v3}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    sget-object v5, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 74
    .line 75
    if-ne v3, v5, :cond_1

    .line 76
    .line 77
    iget-object v3, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 78
    .line 79
    check-cast v3, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 80
    .line 81
    invoke-interface {v3}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    instance-of v3, v3, Lcom/android/quickstep/views/RecentsView;

    .line 86
    .line 87
    if-eqz v3, :cond_1

    .line 88
    .line 89
    const-string p0, "setRecentsAttachedToAppWindow: still overview state , return !!"

    .line 90
    .line 91
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    iget-object v3, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 96
    .line 97
    invoke-interface {v3}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v3, v2}, Lcom/android/launcher3/statemanager/d;->l(I)V

    .line 102
    .line 103
    .line 104
    iget-object v3, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 105
    .line 106
    invoke-interface {v3}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {v3, v1}, Lcom/android/launcher3/statemanager/d;->l(I)V

    .line 111
    .line 112
    .line 113
    if-eqz p3, :cond_2

    .line 114
    .line 115
    iget-object v3, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 116
    .line 117
    invoke-interface {v3}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-virtual {v3, v0}, Lcom/android/launcher3/statemanager/d;->l(I)V

    .line 122
    .line 123
    .line 124
    :cond_2
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 125
    .line 126
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 127
    .line 128
    .line 129
    new-instance v4, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory$1;

    .line 130
    .line 131
    invoke-direct {v4, p0, p1}, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory$1;-><init>(Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;Z)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 135
    .line 136
    .line 137
    if-eqz p2, :cond_3

    .line 138
    .line 139
    const-wide/16 v4, 0x12c

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_3
    const-wide/16 v4, 0x0

    .line 143
    .line 144
    :goto_0
    iget-object p2, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 145
    .line 146
    invoke-interface {p2}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    const/4 v6, 0x0

    .line 151
    const/high16 v7, 0x3f800000    # 1.0f

    .line 152
    .line 153
    if-eqz p1, :cond_4

    .line 154
    .line 155
    move v8, v7

    .line 156
    goto :goto_1

    .line 157
    :cond_4
    move v8, v6

    .line 158
    :goto_1
    new-array v9, v1, [F

    .line 159
    .line 160
    aput v8, v9, v2

    .line 161
    .line 162
    invoke-virtual {p2, v2, v9}, Lcom/android/launcher3/statemanager/d;->t(I[F)Landroid/animation/Animator;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    if-eqz p1, :cond_5

    .line 167
    .line 168
    sget-object v8, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_5
    sget-object v8, LJ0/h;->G:Landroid/view/animation/Interpolator;

    .line 172
    .line 173
    :goto_2
    invoke-virtual {p2, v8}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p2, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v3, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 180
    .line 181
    .line 182
    sget-object p2, Lcom/android/quickstep/views/RecentsView;->ADJACENT_PAGE_HORIZONTAL_OFFSET:Landroid/util/FloatProperty;

    .line 183
    .line 184
    iget-object v8, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 185
    .line 186
    check-cast v8, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 187
    .line 188
    invoke-interface {v8}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v8

    .line 192
    check-cast v8, Lcom/android/quickstep/views/RecentsView;

    .line 193
    .line 194
    invoke-virtual {p2, v8}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object p2

    .line 198
    check-cast p2, Ljava/lang/Float;

    .line 199
    .line 200
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 201
    .line 202
    .line 203
    move-result p2

    .line 204
    if-eqz p1, :cond_6

    .line 205
    .line 206
    move v8, v6

    .line 207
    goto :goto_3

    .line 208
    :cond_6
    move v8, v7

    .line 209
    :goto_3
    iget-object v9, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 210
    .line 211
    invoke-interface {v9}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 212
    .line 213
    .line 214
    move-result-object v9

    .line 215
    new-array v10, v0, [F

    .line 216
    .line 217
    aput p2, v10, v2

    .line 218
    .line 219
    aput v8, v10, v1

    .line 220
    .line 221
    invoke-virtual {v9, v1, v10}, Lcom/android/launcher3/statemanager/d;->t(I[F)Landroid/animation/Animator;

    .line 222
    .line 223
    .line 224
    move-result-object p2

    .line 225
    invoke-virtual {p2, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v3, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 229
    .line 230
    .line 231
    if-eqz p3, :cond_8

    .line 232
    .line 233
    sget-object p2, Lcom/android/quickstep/views/RecentsView;->RUNNING_TASK_ATTACH_ALPHA:Landroid/util/FloatProperty;

    .line 234
    .line 235
    iget-object p3, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 236
    .line 237
    check-cast p3, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 238
    .line 239
    invoke-interface {p3}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 240
    .line 241
    .line 242
    move-result-object p3

    .line 243
    check-cast p3, Lcom/android/quickstep/views/RecentsView;

    .line 244
    .line 245
    invoke-virtual {p2, p3}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object p2

    .line 249
    check-cast p2, Ljava/lang/Float;

    .line 250
    .line 251
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 252
    .line 253
    .line 254
    move-result p2

    .line 255
    if-eqz p1, :cond_7

    .line 256
    .line 257
    move v6, v7

    .line 258
    :cond_7
    iget-object p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 259
    .line 260
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    new-array p3, v0, [F

    .line 265
    .line 266
    aput p2, p3, v2

    .line 267
    .line 268
    aput v6, p3, v1

    .line 269
    .line 270
    invoke-virtual {p1, v0, p3}, Lcom/android/launcher3/statemanager/d;->t(I[F)Landroid/animation/Animator;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    invoke-virtual {p1, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v3, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 278
    .line 279
    .line 280
    :cond_8
    iget-object p1, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 281
    .line 282
    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 283
    .line 284
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    instance-of p1, p1, Lcom/android/quickstep/views/RecentsView;

    .line 289
    .line 290
    if-eqz p1, :cond_9

    .line 291
    .line 292
    iget-object p0, p0, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->mActivity:Lcom/android/launcher3/statemanager/h;

    .line 293
    .line 294
    check-cast p0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 295
    .line 296
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 301
    .line 302
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setRunningTaskHidden(Z)V

    .line 303
    .line 304
    .line 305
    :cond_9
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 306
    .line 307
    .line 308
    return-void
.end method
