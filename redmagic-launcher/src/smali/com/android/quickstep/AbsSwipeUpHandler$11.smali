.class Lcom/android/quickstep/AbsSwipeUpHandler$11;
.super Ljava/lang/Object;
.source "AbsSwipeUpHandler.java"

# interfaces
.implements Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;


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
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$11;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$11;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    new-instance v1, Lcom/android/quickstep/t0;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Lcom/android/quickstep/t0;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$11;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeUpdateRecentsAttachedState(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$11;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->onSwipeUpToHomeComplete()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$11;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 34
    .line 35
    sget v0, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 38
    .line 39
    .line 40
    const-string p0, "AbsSwipeUpHandler"

    .line 41
    .line 42
    const-string v0, "setupWindowAnimation RectFSpringAnim onCancel,STATE_END_TARGET_ANIMATION_FINISHED"

    .line 43
    .line 44
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onUpdate(Landroid/graphics/RectF;F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$11;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget p1, p1, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateSysUiFlags(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
