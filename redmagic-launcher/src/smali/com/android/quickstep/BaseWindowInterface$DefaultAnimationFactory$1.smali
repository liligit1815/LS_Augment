.class Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "BaseWindowInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->setRecentsAttachedToAppWindow(ZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;

.field final synthetic val$attached:Z


# direct methods
.method constructor <init>(Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$1;->this$1:Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$1;->val$attached:Z

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
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$1;->this$1:Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$1;->val$attached:Z

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->c(Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;Z)V

    .line 9
    .line 10
    .line 11
    iget-boolean p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$1;->val$attached:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$1;->this$1:Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-static {p0, p1}, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->b(Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
