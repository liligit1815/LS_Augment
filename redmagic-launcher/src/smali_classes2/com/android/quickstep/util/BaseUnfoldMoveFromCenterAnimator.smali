.class public abstract Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;
.super Ljava/lang/Object;
.source "BaseUnfoldMoveFromCenterAnimator.java"

# interfaces
.implements LC2/i$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;
    }
.end annotation


# instance fields
.field private mAnimationInProgress:Z

.field private mLastTransitionProgress:Ljava/lang/Float;

.field private final mMoveFromCenterAnimation:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

.field private final mOriginalClipChildren:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/ViewGroup;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final mOriginalClipToPadding:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/ViewGroup;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final mRotationChangeProvider:LE2/c;

.field private final mRotationListener:Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;


# direct methods
.method public constructor <init>(Landroid/view/WindowManager;LE2/c;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mOriginalClipToPadding:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mOriginalClipChildren:Ljava/util/Map;

    .line 17
    .line 18
    new-instance v0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-direct {v0, p0, v1}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;-><init>(Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;Lcom/android/quickstep/util/G;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mRotationListener:Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mAnimationInProgress:Z

    .line 28
    .line 29
    iput-object v1, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mLastTransitionProgress:Ljava/lang/Float;

    .line 30
    .line 31
    new-instance v0, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 32
    .line 33
    new-instance v1, Lcom/android/quickstep/util/LauncherViewsMoveFromCenterTranslationApplier;

    .line 34
    .line 35
    invoke-direct {v1}, Lcom/android/quickstep/util/LauncherViewsMoveFromCenterTranslationApplier;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-direct {v0, p1, v1}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;-><init>(Landroid/view/WindowManager;Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator$TranslationApplier;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mMoveFromCenterAnimation:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 42
    .line 43
    iput-object p2, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mRotationChangeProvider:LE2/c;

    .line 44
    .line 45
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;)Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mMoveFromCenterAnimation:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method private clearRegisteredViews()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->restoreClippings()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mMoveFromCenterAnimation:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->clearRegisteredViews()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mOriginalClipChildren:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mOriginalClipToPadding:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method protected onPrepareViewsForAnimation()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mLastTransitionProgress:Ljava/lang/Float;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mMoveFromCenterAnimation:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->onTransitionProgress(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onTransitionFinished()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mLastTransitionProgress:Ljava/lang/Float;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mAnimationInProgress:Z

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mRotationChangeProvider:LE2/c;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mRotationListener:Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, LE2/c;->h(LE2/c$c;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mMoveFromCenterAnimation:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->onTransitionFinished()V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->clearRegisteredViews()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bridge synthetic onTransitionFinishing()V
    .locals 0

    .line 1
    invoke-super {p0}, LC2/i$a;->onTransitionFinishing()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTransitionProgress(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mMoveFromCenterAnimation:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->onTransitionProgress(F)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mLastTransitionProgress:Ljava/lang/Float;

    .line 11
    .line 12
    return-void
.end method

.method public onTransitionStarted()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mAnimationInProgress:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mMoveFromCenterAnimation:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->updateDisplayProperties()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->onPrepareViewsForAnimation()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mRotationChangeProvider:LE2/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mRotationListener:Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator$UnfoldMoveFromCenterRotationListener;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, LE2/c;->f(LE2/c$c;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method protected registerViewForAnimation(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mMoveFromCenterAnimation:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;->registerViewForAnimation(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected restoreClippings()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mOriginalClipToPadding:Ljava/util/Map;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/E;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/quickstep/util/E;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mOriginalClipChildren:Ljava/util/Map;

    .line 12
    .line 13
    new-instance v0, Lcom/android/quickstep/util/F;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/android/quickstep/util/F;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {p0, v0}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method protected setClipChildren(Landroid/view/ViewGroup;Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mOriginalClipChildren:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipChildren()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected setClipToPadding(Landroid/view/ViewGroup;Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mOriginalClipToPadding:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public updateRegisteredViewsIfNeeded()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->mAnimationInProgress:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->clearRegisteredViews()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseUnfoldMoveFromCenterAnimator;->onPrepareViewsForAnimation()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
