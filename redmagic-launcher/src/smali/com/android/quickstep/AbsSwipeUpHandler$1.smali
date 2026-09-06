.class Lcom/android/quickstep/AbsSwipeUpHandler$1;
.super Ljava/lang/Object;
.source "AbsSwipeUpHandler.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;->onLauncherStart()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mHandled:Z

.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic val$container:Landroid/content/Context;

.field final synthetic val$dragLayer:Landroid/view/View;

.field final synthetic val$traceToken:Lcom/android/launcher3/util/a2;


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/launcher3/util/a2;Landroid/view/View;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$1;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$1;->val$traceToken:Lcom/android/launcher3/util/a2;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/AbsSwipeUpHandler$1;->val$dragLayer:Landroid/view/View;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/AbsSwipeUpHandler$1;->val$container:Landroid/content/Context;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$1;->mHandled:Z

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/AbsSwipeUpHandler$1;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler$1;->lambda$onDraw$0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onDraw$0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onDraw()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$1;->mHandled:Z

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
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$1;->mHandled:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$1;->val$traceToken:Lcom/android/launcher3/util/a2;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/android/launcher3/util/a2;->close()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$1;->val$dragLayer:Landroid/view/View;

    .line 15
    .line 16
    new-instance v1, Lcom/android/quickstep/s0;

    .line 17
    .line 18
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/s0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler$1;Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$1;->val$container:Landroid/content/Context;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$1;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 29
    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    :goto_0
    return-void

    .line 33
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 34
    .line 35
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_DRAWN:I

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
