.class public final Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;
.super Ljava/lang/Object;
.source "BreakAppOpenAnimRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final this$0:Lcom/android/quickstep/AbsSwipeUpHandler;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 4
    .line 5
    iget-boolean v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->forceToHome:Z

    .line 6
    .line 7
    const-string v2, "BaseSwipeUpHandler"

    .line 8
    .line 9
    const-string v3, "QuickStep"

    .line 10
    .line 11
    if-nez v1, :cond_3

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getLastRunningAnimRecord(Z)Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    const-string p0, "Ignore break open anim as no opening anim"

    .line 21
    .line 22
    invoke-static {v3, v2, p0}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->createBreakAppOpenAnim(Lcom/android/quickstep/util/animation/AnimationRecord;)Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    const-string p0, "Fail to connect open anim"

    .line 35
    .line 36
    invoke-static {v3, v2, p0}, LM3/a;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v2, "createBreakAppOpenAnim "

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const-string v2, "RunnableC7366xc0b1744e"

    .line 58
    .line 59
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    new-instance v1, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable$1;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable$1;-><init>(Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->addListener(Lcom/android/launcher3/anim/T;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppTransitionManager:Lcom/android/launcher3/q5;

    .line 73
    .line 74
    if-eqz v1, :cond_2

    .line 75
    .line 76
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 77
    .line 78
    invoke-virtual {v1, p0}, Lcom/android/launcher3/q5;->W0(Lcom/android/quickstep/util/animation/AnimationRecord;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->start()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_3
    const-string p0, "Ignore break open anim as to home anim has running or back revert"

    .line 86
    .line 87
    invoke-static {v3, v2, p0}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method
