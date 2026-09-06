.class public final Lcom/android/quickstep/utils/AnimationSeqHelper;
.super Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;
.source "AnimationSeqHelper.java"


# static fields
.field private static final KEY_INTERRUPT_TRANSITION_START_ACTIVITY_SEQ_ID:Ljava/lang/String; = "interrupt.transition.startActivity.seqId"

.field private static final MAX_DELAY_TIME:J = 0x1f4L

.field public static final MAX_INTERCEPT_GESTURE_DELAY_TIME:J = 0x12cL

.field private static final MSG_EXC_RUNNABLE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AnimationSeqHelper"

.field private static final USE_SEQ:Z = true


# instance fields
.field private delayRunnable:Ljava/lang/Runnable;

.field private final handler:Landroid/os/Handler;

.field private nextFinishSeqId:Lcom/android/quickstep/util/anim/CustomPair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/util/anim/CustomPair<",
            "+",
            "Lcom/android/quickstep/RecentsAnimationController;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private seqId:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    new-instance v2, Lcom/android/quickstep/utils/AnimationSeqHelper$1;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Lcom/android/quickstep/utils/AnimationSeqHelper$1;-><init>(Lcom/android/quickstep/utils/AnimationSeqHelper;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->handler:Landroid/os/Handler;

    .line 19
    .line 20
    return-void
.end method

.method public static final handler$lambda$0(Lcom/android/quickstep/utils/AnimationSeqHelper;Landroid/os/Message;)Z
    .locals 3

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "it"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p1, p1, Landroid/os/Message;->what:I

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    const-string p1, "exc delayRunnable"

    .line 17
    .line 18
    const-wide/16 v1, 0x8

    .line 19
    .line 20
    invoke-static {v1, v2, p1}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->delayRunnable:Ljava/lang/Runnable;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 p1, 0x0

    .line 31
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->delayRunnable:Ljava/lang/Runnable;

    .line 32
    .line 33
    invoke-static {v1, v2}, Landroid/os/Trace;->traceEnd(J)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return v0
.end method

.method private final updateSeqId()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->seqId:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->seqId:J

    .line 7
    .line 8
    return-wide v0
.end method


# virtual methods
.method public addSeqId(Landroid/app/ActivityOptions;)V
    .locals 4

    .line 1
    const-string v0, "activityOption"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const-string v0, "AnimationSeqHelper"

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    const-string p0, "addSeqId, return directly due to fail to support multi apps interruption"

    .line 17
    .line 18
    invoke-static {v0, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance p1, Landroid/os/Bundle;

    .line 23
    .line 24
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationSeqHelper;->updateSeqId()J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    new-instance p0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v3, "add start activity seqId: "

    .line 37
    .line 38
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {v0, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const-string p0, "interrupt.transition.startActivity.seqId"

    .line 52
    .line 53
    invoke-virtual {p1, p0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public canFinishRecent()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public canInterceptGesture()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public clearFinishRecentsRunnable()V
    .locals 4

    .line 1
    const-string v0, "clearFinishRecentsRunnable"

    .line 2
    .line 3
    const-wide/16 v1, 0x8

    .line 4
    .line 5
    invoke-static {v1, v2, v0}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->handler:Landroid/os/Handler;

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->delayRunnable:Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-static {v1, v2}, Landroid/os/Trace;->traceEnd(J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public delayFinishRecents(Ljava/lang/Runnable;)Z
    .locals 7

    .line 1
    const-string v0, "runnable"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/utils/AnimationSeqHelper;->canFinishRecent()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    const-string v0, "delayFinishRecents"

    .line 18
    .line 19
    const-wide/16 v1, 0x8

    .line 20
    .line 21
    invoke-static {v1, v2, v0}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/quickstep/utils/AnimationSeqHelper;->clearFinishRecentsRunnable()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->delayRunnable:Ljava/lang/Runnable;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->handler:Landroid/os/Handler;

    .line 30
    .line 31
    const-wide/16 v3, 0x1f4

    .line 32
    .line 33
    invoke-static {}, Lu2/d;->a()J

    .line 34
    .line 35
    .line 36
    move-result-wide v5

    .line 37
    sub-long/2addr v3, v5

    .line 38
    const/4 p1, 0x1

    .line 39
    invoke-virtual {p0, p1, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Landroid/os/Trace;->traceEnd(J)V

    .line 43
    .line 44
    .line 45
    return p1
.end method

.method public getNextFinishSeqId(Lcom/android/quickstep/RecentsAnimationController;)J
    .locals 1

    .line 1
    const-string v0, "recentsAnimationController"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->nextFinishSeqId:Lcom/android/quickstep/util/anim/CustomPair;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/util/anim/CustomPair;->first:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-static {v0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/anim/CustomPair;->second:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide p0

    .line 27
    return-wide p0

    .line 28
    :cond_1
    :goto_0
    const-wide/16 p0, 0x0

    .line 29
    .line 30
    return-wide p0
.end method

.method public resetInterceptState()V
    .locals 0

    .line 1
    invoke-static {}, Lu2/d;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public updateNextFinishSeqIdIfNeed(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 5

    .line 1
    const-string v0, "recentsAnimationController"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-string v1, "AnimationSeqHelper"

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const-string p0, "update finish recents return directly due to fail to support multi apps interruption"

    .line 17
    .line 18
    invoke-static {v1, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->nextFinishSeqId:Lcom/android/quickstep/util/anim/CustomPair;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-object v0, v0, Lcom/android/quickstep/util/anim/CustomPair;->first:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void

    .line 36
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/android/quickstep/utils/AnimationSeqHelper;->updateSeqId()J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v4, "update finish recents seqId: "

    .line 46
    .line 47
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Lcom/android/quickstep/util/anim/CustomPair;

    .line 61
    .line 62
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-direct {v0, p1, v1}, Lcom/android/quickstep/util/anim/CustomPair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lcom/android/quickstep/utils/AnimationSeqHelper;->nextFinishSeqId:Lcom/android/quickstep/util/anim/CustomPair;

    .line 70
    .line 71
    return-void
.end method
