.class Lcom/android/quickstep/AbsSwipeUpHandler$3;
.super Ljava/lang/Object;
.source "AbsSwipeUpHandler.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;->onGestureStarted(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mHandled:Z

.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic val$rv:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$3;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$3;->val$rv:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$3;->mHandled:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/AbsSwipeUpHandler$3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler$3;->lambda$onDraw$0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onDraw$0(Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public onDraw()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$3;->mHandled:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$3;->mHandled:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$3;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    :goto_0
    return-void

    .line 16
    :cond_1
    const/16 v1, 0xb

    .line 17
    .line 18
    const-wide/16 v2, 0x7d0

    .line 19
    .line 20
    invoke-static {v0, v1, v2, v3}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;IJ)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$3;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 26
    .line 27
    const/16 v1, 0x9

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$3;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 35
    .line 36
    const/16 v1, 0x42

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$3;->val$rv:Landroid/view/View;

    .line 42
    .line 43
    new-instance v1, Lcom/android/quickstep/w0;

    .line 44
    .line 45
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/w0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler$3;Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 49
    .line 50
    .line 51
    return-void
.end method
