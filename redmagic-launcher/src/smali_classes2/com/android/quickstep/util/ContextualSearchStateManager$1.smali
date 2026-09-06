.class Lcom/android/quickstep/util/ContextualSearchStateManager$1;
.super Landroid/content/IIntentSender$Stub;
.source "ContextualSearchStateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/ContextualSearchStateManager;->registerSearchScreenSystemAction()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/ContextualSearchStateManager;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/ContextualSearchStateManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/ContextualSearchStateManager$1;->this$0:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/IIntentSender$Stub;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$send$0()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/ContextualSearchStateManager$1;->this$0:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/ContextualSearchInvoker;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/16 v1, 0x9

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/ContextualSearchInvoker;->show(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager$1;->this$0:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mTopTaskTracker:Lcom/android/quickstep/TopTaskTracker;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getPackageName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager$1;->this$0:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContext:Landroid/content/Context;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withPackageName(Ljava/lang/String;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->J3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 49
    .line 50
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/util/ContextualSearchStateManager$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager$1;->lambda$send$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public send(ILandroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Landroid/content/IIntentReceiver;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance p2, Lcom/android/quickstep/util/T;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Lcom/android/quickstep/util/T;-><init>(Lcom/android/quickstep/util/ContextualSearchStateManager$1;)V

    .line 10
    .line 11
    .line 12
    const-wide/16 p3, 0xc8

    .line 13
    .line 14
    invoke-virtual {p1, p2, p3, p4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method
