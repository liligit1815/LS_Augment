.class Lcom/android/quickstep/interaction/AnimatedTaskView$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AnimatedTaskView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/interaction/AnimatedTaskView;->createAnimationToMultiRowLayout()Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

.field final synthetic val$outlineStartRect:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/AnimatedTaskView;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$2;->this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$2;->val$outlineStartRect:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$2;->this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/AnimatedTaskView;->setToMultiRowLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$2;->this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/AnimatedTaskView;->setToMultiRowLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$2;->this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p1, v0}, Lcom/android/quickstep/interaction/AnimatedTaskView;->setToSingleRowLayout(Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$2;->this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$2;->val$outlineStartRect:Landroid/graphics/Rect;

    .line 13
    .line 14
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$2;->val$outlineStartRect:Landroid/graphics/Rect;

    .line 21
    .line 22
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 23
    .line 24
    sub-int/2addr v1, p0

    .line 25
    const/4 p0, 0x0

    .line 26
    invoke-virtual {p1, p0, v0, p0, v1}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
