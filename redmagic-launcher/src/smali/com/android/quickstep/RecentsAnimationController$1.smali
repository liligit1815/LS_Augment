.class Lcom/android/quickstep/RecentsAnimationController$1;
.super Lcom/android/internal/os/IResultReceiver$Stub;
.source "RecentsAnimationController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/RecentsAnimationController;->finishController(ZZLjava/lang/Runnable;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/RecentsAnimationController;


# direct methods
.method constructor <init>(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/RecentsAnimationController$1;->this$0:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/internal/os/IResultReceiver$Stub;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$send$0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationController$1;->this$0:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/RecentsAnimationController;->i(Lcom/android/quickstep/RecentsAnimationController;)Lcom/android/launcher3/util/Y1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->c()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/RecentsAnimationController$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsAnimationController$1;->lambda$send$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public send(ILandroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logFinishRecentsAnimationCallback()V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 5
    .line 6
    new-instance p2, Lcom/android/quickstep/d3;

    .line 7
    .line 8
    invoke-direct {p2, p0}, Lcom/android/quickstep/d3;-><init>(Lcom/android/quickstep/RecentsAnimationController$1;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
