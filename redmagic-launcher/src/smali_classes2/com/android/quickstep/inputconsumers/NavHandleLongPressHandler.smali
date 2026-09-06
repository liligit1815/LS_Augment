.class public Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;
.super Ljava/lang/Object;
.source "NavHandleLongPressHandler.java"

# interfaces
.implements Lcom/android/launcher3/util/V1;


# static fields
.field private static final TAG:Ljava/lang/String; = "NavHandleLongPressHandler"


# instance fields
.field protected final mContext:Landroid/content/Context;

.field protected final mContextualSearchHapticManager:Lcom/android/quickstep/util/ContextualSearchHapticManager;

.field protected final mContextualSearchInvoker:Lcom/android/quickstep/util/ContextualSearchInvoker;

.field private mPendingInvocation:Z

.field protected final mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

.field protected final mVibratorWrapper:Lcom/android/launcher3/util/V2;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mContext:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 11
    .line 12
    sget-object v0, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/android/launcher3/util/V2;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mVibratorWrapper:Lcom/android/launcher3/util/V2;

    .line 21
    .line 22
    sget-object v0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/android/quickstep/util/ContextualSearchHapticManager;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mContextualSearchHapticManager:Lcom/android/quickstep/util/ContextualSearchHapticManager;

    .line 31
    .line 32
    new-instance v0, Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Lcom/android/quickstep/util/ContextualSearchInvoker;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mContextualSearchInvoker:Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 38
    .line 39
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;Lcom/android/launcher3/logging/d;JILcom/android/quickstep/NavHandle;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->lambda$getLongPressRunnable$0(Lcom/android/launcher3/logging/d;JILcom/android/quickstep/NavHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$getLongPressRunnable$0(Lcom/android/launcher3/logging/d;JILcom/android/quickstep/NavHandle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->latencyLogger()Lcom/android/launcher3/logging/StatsLogManager$h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Lcom/android/launcher3/logging/StatsLogManager$h;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$h;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    sub-long/2addr v0, p2

    .line 16
    invoke-interface {p1, v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$h;->withLatency(J)Lcom/android/launcher3/logging/StatsLogManager$h;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget-object p2, Lcom/android/launcher3/logging/StatsLogManager$f;->l:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 21
    .line 22
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$h;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mContextualSearchInvoker:Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 26
    .line 27
    const/4 p2, 0x1

    .line 28
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/ContextualSearchInvoker;->invokeContextualSearchUncheckedWithHaptic(I)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    const-string p1, "NavHandleLongPressHandler"

    .line 35
    .line 36
    const-string p3, "Contextual Search invocation successful"

    .line 37
    .line 38
    invoke-static {p1, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    sget-object p1, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 42
    .line 43
    iget-object p3, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mContext:Landroid/content/Context;

    .line 44
    .line 45
    invoke-virtual {p1, p3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/android/quickstep/TopTaskTracker;

    .line 50
    .line 51
    invoke-virtual {p1, p2, p4}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getPackageName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withPackageName(Ljava/lang/String;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->F3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 70
    .line 71
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mVibratorWrapper:Lcom/android/launcher3/util/V2;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/android/launcher3/util/V2;->f()V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Lcom/android/quickstep/DeviceConfigWrapper;->getAnimateLpnh()Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-eqz p0, :cond_1

    .line 89
    .line 90
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Lcom/android/quickstep/DeviceConfigWrapper;->getShrinkNavHandleOnPress()Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    if-nez p0, :cond_1

    .line 99
    .line 100
    const-wide/16 p0, 0xa0

    .line 101
    .line 102
    const/4 p2, 0x0

    .line 103
    invoke-interface {p5, p2, p2, p0, p1}, Lcom/android/quickstep/NavHandle;->animateNavBarLongPress(ZZJ)V

    .line 104
    .line 105
    .line 106
    :cond_1
    return-void
.end method

.method public static newInstance(Landroid/content/Context;)Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;
    .locals 2

    .line 1
    const-class v0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;

    .line 2
    .line 3
    const v1, 0x7f1402bf

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p0, v1}, Lcom/android/launcher3/util/V1$a;->a(Ljava/lang/Class;Landroid/content/Context;I)Lcom/android/launcher3/util/V1;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method final getLongPressRunnable(Lcom/android/quickstep/NavHandle;I)Ljava/lang/Runnable;
    .locals 8

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->isContextualSearchEntrypointEnabled(Lcom/android/quickstep/NavHandle;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "NavHandleLongPressHandler"

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string p1, "Contextual Search invocation failed: entry point disabled"

    .line 11
    .line 12
    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mVibratorWrapper:Lcom/android/launcher3/util/V2;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/util/V2;->f()V

    .line 18
    .line 19
    .line 20
    return-object v1

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mContextualSearchInvoker:Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->runContextualSearchInvocationChecksAndLogFailures()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    const-string p1, "Contextual Search invocation failed: precondition not satisfied"

    .line 30
    .line 31
    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mVibratorWrapper:Lcom/android/launcher3/util/V2;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/util/V2;->f()V

    .line 37
    .line 38
    .line 39
    return-object v1

    .line 40
    :cond_1
    const/4 v0, 0x1

    .line 41
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mPendingInvocation:Z

    .line 42
    .line 43
    const-string v0, "Contextual Search invocation: invocation runnable created"

    .line 44
    .line 45
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    new-instance v0, Lcom/android/launcher3/logging/f;

    .line 49
    .line 50
    invoke-direct {v0}, Lcom/android/launcher3/logging/f;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/logging/f;->a()Lcom/android/launcher3/logging/d;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {v0, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->P3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 68
    .line 69
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 73
    .line 74
    .line 75
    move-result-wide v4

    .line 76
    new-instance v1, Lcom/android/quickstep/inputconsumers/h;

    .line 77
    .line 78
    move-object v2, p0

    .line 79
    move-object v7, p1

    .line 80
    move v6, p2

    .line 81
    invoke-direct/range {v1 .. v7}, Lcom/android/quickstep/inputconsumers/h;-><init>(Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;Lcom/android/launcher3/logging/d;JILcom/android/quickstep/NavHandle;)V

    .line 82
    .line 83
    .line 84
    return-object v1
.end method

.method protected isContextualSearchEntrypointEnabled(Lcom/android/quickstep/NavHandle;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/DeviceConfigWrapper;->getEnableLongPressNavHandle()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method final onTouchFinished(Lcom/android/quickstep/NavHandle;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Contextual Search invocation: touch finished with reason: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    const-string v0, "NavHandleLongPressHandler"

    .line 19
    .line 20
    invoke-static {v0, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2}, Lcom/android/quickstep/DeviceConfigWrapper;->getShrinkNavHandleOnPress()Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    iget-boolean p2, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mPendingInvocation:Z

    .line 34
    .line 35
    if-nez p2, :cond_1

    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mVibratorWrapper:Lcom/android/launcher3/util/V2;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/util/V2;->f()V

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/android/quickstep/DeviceConfigWrapper;->getAnimateLpnh()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_3

    .line 51
    .line 52
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/android/quickstep/DeviceConfigWrapper;->getShrinkNavHandleOnPress()Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    const/4 p2, 0x0

    .line 61
    if-eqz p0, :cond_2

    .line 62
    .line 63
    const/4 p0, 0x1

    .line 64
    const-wide/16 v0, 0xc8

    .line 65
    .line 66
    invoke-interface {p1, p2, p0, v0, v1}, Lcom/android/quickstep/NavHandle;->animateNavBarLongPress(ZZJ)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    const-wide/16 v0, 0xa0

    .line 71
    .line 72
    invoke-interface {p1, p2, p2, v0, v1}, Lcom/android/quickstep/NavHandle;->animateNavBarLongPress(ZZJ)V

    .line 73
    .line 74
    .line 75
    :cond_3
    return-void
.end method

.method final onTouchStarted(Lcom/android/quickstep/NavHandle;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mPendingInvocation:Z

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->isContextualSearchEntrypointEnabled(Lcom/android/quickstep/NavHandle;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mContextualSearchInvoker:Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->runContextualSearchInvocationChecksAndLogFailures()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const-string v0, "NavHandleLongPressHandler"

    .line 19
    .line 20
    const-string v1, "Contextual Search invocation: touch started"

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->startNavBarAnimation(Lcom/android/quickstep/NavHandle;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method final startNavBarAnimation(Lcom/android/quickstep/NavHandle;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mContextualSearchHapticManager:Lcom/android/quickstep/util/ContextualSearchHapticManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/ContextualSearchHapticManager;->vibrateForSearchHint()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper;->getAnimateLpnh()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper;->getShrinkNavHandleOnPress()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x1

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-wide/16 v2, 0xc8

    .line 28
    .line 29
    invoke-interface {p1, v1, v1, v2, v3}, Lcom/android/quickstep/NavHandle;->animateNavBarLongPress(ZZJ)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    sget-object v0, Lcom/android/quickstep/util/ContextualSearchStateManager;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/NavHandleLongPressHandler;->mContext:Landroid/content/Context;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getLPNHDurationMillis()Ljava/util/Optional;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getLPNHDurationMillis()Ljava/util/Optional;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Ljava/lang/Long;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/Long;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    :goto_0
    int-to-long v2, p0

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    goto :goto_0

    .line 74
    :goto_1
    const/4 p0, 0x0

    .line 75
    invoke-interface {p1, v1, p0, v2, v3}, Lcom/android/quickstep/NavHandle;->animateNavBarLongPress(ZZJ)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method
