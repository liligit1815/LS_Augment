.class Lcom/android/quickstep/AbsSwipeUpHandler$6;
.super Ljava/lang/Object;
.source "AbsSwipeUpHandler.java"

# interfaces
.implements Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;->animateToProgressInternal(FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field isSmallWindowLaunched:Z

.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/view/RemoteAnimationTarget;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$6;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$6;->val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$6;->isSmallWindowLaunched:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onUpdate(Landroid/graphics/RectF;F)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$6;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowLeft:Z

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const/high16 v0, 0x3f000000    # 0.5f

    .line 8
    .line 9
    cmpl-float p2, p2, v0

    .line 10
    .line 11
    if-lez p2, :cond_1

    .line 12
    .line 13
    iget-boolean p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$6;->isSmallWindowLaunched:Z

    .line 14
    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    iget-object p2, p1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$6;->val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;

    .line 20
    .line 21
    iget v0, v0, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 22
    .line 23
    iget-boolean p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 p1, 0x2

    .line 30
    :goto_0
    invoke-static {p2, v0, p1}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->startActivityFromRecentsMiniWindowMode(Landroid/content/Context;II)V

    .line 31
    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$6;->isSmallWindowLaunched:Z

    .line 35
    .line 36
    :cond_1
    return-void
.end method
