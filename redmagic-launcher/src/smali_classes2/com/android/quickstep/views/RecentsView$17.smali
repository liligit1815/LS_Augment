.class Lcom/android/quickstep/views/RecentsView$17;
.super Landroid/animation/AnimatorListenerAdapter;
.source "RecentsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/RecentsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/RecentsView;

.field final synthetic val$animatorAppear:Landroid/animation/Animator;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsView$17;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/views/RecentsView$17;->val$animatorAppear:Landroid/animation/Animator;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Landroid/animation/Animator;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$17;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsView;->Q1(Lcom/android/quickstep/views/RecentsView;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$17;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->updateClearAllFunction()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$17;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->reloadIfNeeded()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$17;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsView;->v1(Lcom/android/quickstep/views/RecentsView;)Lcom/android/launcher3/anim/V;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView$17;->this$0:Lcom/android/quickstep/views/RecentsView;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsView;->v1(Lcom/android/quickstep/views/RecentsView;)Lcom/android/launcher3/anim/V;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$17;->val$animatorAppear:Landroid/animation/Animator;

    .line 31
    .line 32
    new-instance v0, Lcom/android/quickstep/views/z1;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Lcom/android/quickstep/views/z1;-><init>(Landroid/animation/Animator;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/f;->f(Ljava/util/function/Consumer;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView$17;->val$animatorAppear:Landroid/animation/Animator;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 44
    .line 45
    .line 46
    return-void
.end method
