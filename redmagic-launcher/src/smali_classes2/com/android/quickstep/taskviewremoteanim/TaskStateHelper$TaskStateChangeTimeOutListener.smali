.class public final Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;
.super Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$BaseTaskStateChangeListener;
.source "TaskStateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TaskStateChangeTimeOutListener"
.end annotation


# instance fields
.field private handler:Landroid/os/Handler;

.field private final option:Ljava/lang/Runnable;

.field private final timeOutDuration:J

.field private final timeOutOption:Ljava/lang/Runnable;

.field private final type:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;JLjava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$BaseTaskStateChangeListener;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "type"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "option"

    .line 10
    .line 11
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->type:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;

    .line 15
    .line 16
    iput-wide p2, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->timeOutDuration:J

    .line 17
    .line 18
    iput-object p4, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->option:Ljava/lang/Runnable;

    .line 19
    .line 20
    sget-object p4, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 21
    .line 22
    invoke-virtual {p4}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 23
    .line 24
    .line 25
    move-result-object p4

    .line 26
    iput-object p4, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->handler:Landroid/os/Handler;

    .line 27
    .line 28
    new-instance p4, Ls2/a;

    .line 29
    .line 30
    invoke-direct {p4, p0}, Ls2/a;-><init>(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;)V

    .line 31
    .line 32
    .line 33
    iput-object p4, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->timeOutOption:Ljava/lang/Runnable;

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v1, "TaskStateChangeTimeOutListener["

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p1, "]: init."

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v0, "TaskStateHelper"

    .line 58
    .line 59
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->handler:Landroid/os/Handler;

    .line 63
    .line 64
    if-eqz p0, :cond_0

    .line 65
    .line 66
    invoke-virtual {p0, p4, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->lambda$new$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$0()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->timeOutOption$lambda$0(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final timeOutOption$lambda$0(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;)V
    .locals 2

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "TaskStateChangeTimeOutListener["

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->type:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, "]: Time Out."

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "TaskStateHelper"

    .line 31
    .line 32
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->dispose()V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->option:Ljava/lang/Runnable;

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public final dispose()V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper;->removeGlobalTaskStateChangeListener(Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeListener;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->handler:Landroid/os/Handler;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->timeOutOption:Ljava/lang/Runnable;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->handler:Landroid/os/Handler;

    .line 15
    .line 16
    return-void
.end method

.method public final getHandler()Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOption()Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->option:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTimeOutDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->timeOutDuration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final getTimeOutOption()Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->timeOutOption:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getType()Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->type:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;

    .line 2
    .line 3
    return-object p0
.end method

.method public onLandScapeSceneExit(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->type:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;->ON_LAND_SCAPE_SCENE_EXIT:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "TaskStateChangeTimeOutListener["

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, "]: "

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "TaskStateHelper"

    .line 33
    .line 34
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->dispose()V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->option:Ljava/lang/Runnable;

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public onTransitionFinish(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->type:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;->ON_TRANSITION_FINISH:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v1, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;->ON_TO_HOME_TRANSITION_FINISH:Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeType;

    .line 8
    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    :cond_0
    if-eqz p1, :cond_1

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v2, "TaskStateChangeTimeOutListener["

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v0, "]: "

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v0, "TaskStateHelper"

    .line 39
    .line 40
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->dispose()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->option:Ljava/lang/Runnable;

    .line 47
    .line 48
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public final setHandler(Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/taskviewremoteanim/TaskStateHelper$TaskStateChangeTimeOutListener;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-void
.end method
