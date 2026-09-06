.class Lcom/android/quickstep/util/RecentsOrientedState$1;
.super Landroid/view/OrientationEventListener;
.source "RecentsOrientedState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/RecentsOrientedState;-><init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;Ljava/util/function/IntConsumer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/RecentsOrientedState;

.field final synthetic val$rotationChangeListener:Ljava/util/function/IntConsumer;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/RecentsOrientedState;Landroid/content/Context;Ljava/util/function/IntConsumer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/RecentsOrientedState$1;->this$0:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/quickstep/util/RecentsOrientedState$1;->val$rotationChangeListener:Ljava/util/function/IntConsumer;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState$1;->this$0:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 3
    .line 4
    invoke-static {v0}, Lcom/android/quickstep/util/RecentsOrientedState;->c(Lcom/android/quickstep/util/RecentsOrientedState;)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-static {p1, v0}, Lcom/android/quickstep/util/RecentsOrientedState;->getRotationForUserDegreesRotated(FI)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState$1;->this$0:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/android/quickstep/util/RecentsOrientedState;->c(Lcom/android/quickstep/util/RecentsOrientedState;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eq p1, v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsOrientedState$1;->this$0:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 21
    .line 22
    invoke-static {v0, p1}, Lcom/android/quickstep/util/RecentsOrientedState;->d(Lcom/android/quickstep/util/RecentsOrientedState;I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsOrientedState$1;->val$rotationChangeListener:Ljava/util/function/IntConsumer;

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ljava/util/function/IntConsumer;->accept(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
