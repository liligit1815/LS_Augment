.class Lcom/android/quickstep/interaction/AnimatedTaskView$1;
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

.field final synthetic val$outlineStartRadius:F

.field final synthetic val$outlineStartRect:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/AnimatedTaskView;Landroid/graphics/Rect;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$1;->this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$1;->val$outlineStartRect:Landroid/graphics/Rect;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$1;->val$outlineStartRadius:F

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
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
    iget-object p1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$1;->this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/quickstep/interaction/AnimatedTaskView;->i(Lcom/android/quickstep/interaction/AnimatedTaskView;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$1;->this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/android/quickstep/interaction/AnimatedTaskView;->l(Lcom/android/quickstep/interaction/AnimatedTaskView;)Landroid/view/ViewOutlineProvider;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$1;->this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/quickstep/interaction/AnimatedTaskView;->i(Lcom/android/quickstep/interaction/AnimatedTaskView;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$1;->this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/android/quickstep/interaction/AnimatedTaskView;->l(Lcom/android/quickstep/interaction/AnimatedTaskView;)Landroid/view/ViewOutlineProvider;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$1;->this$0:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/quickstep/interaction/AnimatedTaskView;->i(Lcom/android/quickstep/interaction/AnimatedTaskView;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$1;->val$outlineStartRect:Landroid/graphics/Rect;

    .line 11
    .line 12
    iget p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView$1;->val$outlineStartRadius:F

    .line 13
    .line 14
    invoke-static {p1, v0, v1, p0}, Lcom/android/quickstep/interaction/AnimatedTaskView;->m(Lcom/android/quickstep/interaction/AnimatedTaskView;Landroid/view/View;Landroid/graphics/Rect;F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
