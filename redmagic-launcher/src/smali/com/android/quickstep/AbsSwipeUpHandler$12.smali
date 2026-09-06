.class Lcom/android/quickstep/AbsSwipeUpHandler$12;
.super Lcom/android/launcher3/anim/g;
.source "AbsSwipeUpHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;->setupWindowAnimation([Lcom/android/quickstep/util/RectFSpringAnim;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler;


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$12;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$12;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/t0;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Lcom/android/quickstep/t0;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$12;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p1, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeUpdateRecentsAttachedState(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$12;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->onSwipeUpToHomeComplete()V

    .line 29
    .line 30
    .line 31
    return-void
.end method
