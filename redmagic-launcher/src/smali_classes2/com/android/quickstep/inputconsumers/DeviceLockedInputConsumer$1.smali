.class Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DeviceLockedInputConsumer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->finishTouchTracking(Landroid/view/MotionEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

.field final synthetic val$dismissTask:Z


# direct methods
.method constructor <init>(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->val$dismissTask:Z

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->val$dismissTask:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->e(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->f(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)Lcom/android/quickstep/GestureState;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->getHomeIntent()Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x0

    .line 23
    const-string v3, "DeviceLockedInputConsumer"

    .line 24
    .line 25
    invoke-static {p1, v1, v2, v3}, Lcom/android/quickstep/OverviewComponentObserver;->startHomeIntentSafely(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

    .line 29
    .line 30
    invoke-static {p1, v0}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->l(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;Z)V

    .line 31
    .line 32
    .line 33
    new-instance p1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v0, "finishTouchTracking "

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    new-instance v0, Ljava/lang/Throwable;

    .line 44
    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v2, "start home activity state:"

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->n()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-direct {v0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

    .line 85
    .line 86
    invoke-static {p1}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->i(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)Lcom/android/quickstep/TaskAnimationManager;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Lcom/android/quickstep/TaskAnimationManager;->getCurrentCallbacks()Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    if-eqz p1, :cond_2

    .line 95
    .line 96
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

    .line 97
    .line 98
    invoke-static {p1}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->g(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)Lcom/android/quickstep/RecentsAnimationController;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    if-eqz p1, :cond_1

    .line 103
    .line 104
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

    .line 105
    .line 106
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->val$dismissTask:Z

    .line 107
    .line 108
    invoke-static {p1, v0}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->m(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;Z)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

    .line 113
    .line 114
    invoke-static {p1, v0}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->j(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;Z)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

    .line 118
    .line 119
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->val$dismissTask:Z

    .line 120
    .line 121
    invoke-static {p1, v0}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->k(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;Z)V

    .line 122
    .line 123
    .line 124
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;

    .line 125
    .line 126
    invoke-static {p0}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->h(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)Lcom/android/quickstep/MultiStateCallback;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->n()I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    invoke-virtual {p0, p1}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 135
    .line 136
    .line 137
    return-void
.end method
