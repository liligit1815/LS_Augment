.class Lcom/android/quickstep/interaction/EdgeBackGestureHandler$1;
.super Ljava/lang/Object;
.source "EdgeBackGestureHandler.java"

# interfaces
.implements Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/interaction/EdgeBackGestureHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/interaction/EdgeBackGestureHandler;


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/EdgeBackGestureHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$1;->this$0:Lcom/android/quickstep/interaction/EdgeBackGestureHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public cancelBack()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$1;->this$0:Lcom/android/quickstep/interaction/EdgeBackGestureHandler;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->b(Lcom/android/quickstep/interaction/EdgeBackGestureHandler;)Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$1;->this$0:Lcom/android/quickstep/interaction/EdgeBackGestureHandler;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->b(Lcom/android/quickstep/interaction/EdgeBackGestureHandler;)Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$1;->this$0:Lcom/android/quickstep/interaction/EdgeBackGestureHandler;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->a(Lcom/android/quickstep/interaction/EdgeBackGestureHandler;)Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->getIsLeftPanel()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    sget-object p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;->BACK_CANCELLED_FROM_LEFT:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;->BACK_CANCELLED_FROM_RIGHT:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 31
    .line 32
    :goto_0
    invoke-interface {v0, p0}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;->onBackGestureAttempted(Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public triggerBack()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$1;->this$0:Lcom/android/quickstep/interaction/EdgeBackGestureHandler;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->b(Lcom/android/quickstep/interaction/EdgeBackGestureHandler;)Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$1;->this$0:Lcom/android/quickstep/interaction/EdgeBackGestureHandler;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->b(Lcom/android/quickstep/interaction/EdgeBackGestureHandler;)Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$1;->this$0:Lcom/android/quickstep/interaction/EdgeBackGestureHandler;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->a(Lcom/android/quickstep/interaction/EdgeBackGestureHandler;)Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->getIsLeftPanel()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    sget-object p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;->BACK_COMPLETED_FROM_LEFT:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;->BACK_COMPLETED_FROM_RIGHT:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 31
    .line 32
    :goto_0
    invoke-interface {v0, p0}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;->onBackGestureAttempted(Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method
