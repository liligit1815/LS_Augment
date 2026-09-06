.class Lcom/android/quickstep/views/SplitInstructionsView$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SplitInstructionsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/SplitInstructionsView;->goBoing()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/SplitInstructionsView;

.field final synthetic val$bounceToY:F

.field final synthetic val$restingY:F


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/SplitInstructionsView;FF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/SplitInstructionsView$3;->this$0:Lcom/android/quickstep/views/SplitInstructionsView;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/views/SplitInstructionsView$3;->val$restingY:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/quickstep/views/SplitInstructionsView$3;->val$bounceToY:F

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/SplitInstructionsView$3;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/views/SplitInstructionsView$3;->lambda$onAnimationEnd$0(Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onAnimationEnd$0(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/SplitInstructionsView$3;->this$0:Lcom/android/quickstep/views/SplitInstructionsView;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/android/quickstep/views/SplitInstructionsView;->mIsCurrentlyAnimating:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    new-instance p1, Landroidx/dynamicanimation/animation/k;

    .line 2
    .line 3
    iget v0, p0, Lcom/android/quickstep/views/SplitInstructionsView$3;->val$restingY:F

    .line 4
    .line 5
    invoke-direct {p1, v0}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    .line 6
    .line 7
    .line 8
    const/high16 v0, 0x3f000000    # 0.5f

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/high16 v0, 0x43480000    # 200.0f

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Landroidx/dynamicanimation/animation/j;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/quickstep/views/SplitInstructionsView$3;->this$0:Lcom/android/quickstep/views/SplitInstructionsView;

    .line 23
    .line 24
    sget-object v2, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 25
    .line 26
    invoke-direct {v0, v1, v2}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget v0, p0, Lcom/android/quickstep/views/SplitInstructionsView$3;->val$bounceToY:F

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/e;->q(F)Landroidx/dynamicanimation/animation/e;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Landroidx/dynamicanimation/animation/j;

    .line 40
    .line 41
    new-instance v0, Lcom/android/quickstep/views/L1;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Lcom/android/quickstep/views/L1;-><init>(Lcom/android/quickstep/views/SplitInstructionsView$3;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/j;->t()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/SplitInstructionsView$3;->this$0:Lcom/android/quickstep/views/SplitInstructionsView;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/android/quickstep/views/SplitInstructionsView;->mIsCurrentlyAnimating:Z

    .line 5
    .line 6
    return-void
.end method
