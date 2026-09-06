.class Lcom/android/quickstep/views/RecentsView$18;
.super Landroid/animation/AnimatorListenerAdapter;
.source "RecentsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/RecentsView;->launchSideTaskInLiveTileMode(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/window/TransitionInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$apps:[Landroid/view/RemoteAnimationTarget;

.field final synthetic val$surfaceApplier:Lcom/android/quickstep/util/SurfaceTransactionApplier;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;[Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/views/RecentsView$18;->val$apps:[Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/quickstep/views/RecentsView$18;->val$surfaceApplier:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$18;->val$apps:[Landroid/view/RemoteAnimationTarget;

    .line 10
    .line 11
    array-length v0, v0

    .line 12
    add-int/lit8 v0, v0, -0x1

    .line 13
    .line 14
    :goto_0
    if-ltz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/quickstep/util/SurfaceTransaction;->getTransaction()Landroid/view/SurfaceControl$Transaction;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$18;->val$apps:[Landroid/view/RemoteAnimationTarget;

    .line 21
    .line 22
    aget-object v2, v2, v0

    .line 23
    .line 24
    iget-object v2, v2, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$18;->val$apps:[Landroid/view/RemoteAnimationTarget;

    .line 30
    .line 31
    aget-object v1, v1, v0

    .line 32
    .line 33
    iget-object v1, v1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsView$18;->val$apps:[Landroid/view/RemoteAnimationTarget;

    .line 40
    .line 41
    aget-object v2, v2, v0

    .line 42
    .line 43
    iget v2, v2, Landroid/view/RemoteAnimationTarget;->prefixOrderIndex:I

    .line 44
    .line 45
    const v3, 0x7ffffc17

    .line 46
    .line 47
    .line 48
    add-int/2addr v2, v3

    .line 49
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setLayer(I)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 50
    .line 51
    .line 52
    add-int/lit8 v0, v0, -0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$18;->val$surfaceApplier:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method
