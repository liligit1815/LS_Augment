.class Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim$2;
.super Ljava/lang/Object;
.source "SwipeUpAnimationLogic.java"

# interfaces
.implements Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;->wrap(Lcom/android/quickstep/util/RectFSpringAnim;)Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$rectFSpringAnim:Lcom/android/quickstep/util/RectFSpringAnim;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim$2;->val$rectFSpringAnim:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim$2;->val$rectFSpringAnim:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public end()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim$2;->val$rectFSpringAnim:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->end()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
