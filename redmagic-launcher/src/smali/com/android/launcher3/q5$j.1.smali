.class Lcom/android/launcher3/q5$j;
.super Lcom/android/launcher3/anim/g;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->m0(I)Lcom/android/launcher3/anim/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Lcom/android/launcher3/q5;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$j;->h:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/q5$j;->g:I

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/g;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/android/launcher3/q5$j;->g:I

    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5$j;->h:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lcom/android/launcher3/q5$j$a;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lcom/android/launcher3/q5$j$a;-><init>(Lcom/android/launcher3/q5$j;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 15
    .line 16
    .line 17
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/U;->onAnimationStart(Landroid/animation/Animator;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/q5$j;->g:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
