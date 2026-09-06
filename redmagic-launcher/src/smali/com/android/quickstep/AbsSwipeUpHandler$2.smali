.class Lcom/android/quickstep/AbsSwipeUpHandler$2;
.super Ljava/lang/Object;
.source "AbsSwipeUpHandler.java"

# interfaces
.implements Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;->getMotionPauseListener()Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler;


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onMotionPauseChanged(ZLcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 4
    .line 5
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "AbsSwipeUpHandler"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string p0, "onMotionPauseChanged: STATE_HANDLER_INVALIDATED pause change."

    .line 16
    .line 17
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 28
    .line 29
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 38
    .line 39
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 40
    .line 41
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->O0:Z

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    sget-object v0, LF1/b;->n:Lcom/android/launcher3/util/I;

    .line 50
    .line 51
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 52
    .line 53
    iget-object v2, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 54
    .line 55
    check-cast v2, Lcom/android/launcher3/views/k;

    .line 56
    .line 57
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, LF1/b;

    .line 66
    .line 67
    invoke-virtual {v0}, LF1/b;->d()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    const-string p0, "onMotionPauseChanged: InNewSplitMode ignore pause change."

    .line 74
    .line 75
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    invoke-virtual {p2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->getShelfPeekState()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-ne v0, p1, :cond_2

    .line 84
    .line 85
    const-string p0, "onMotionPauseChanged: ignore change, because status not change "

    .line 86
    .line 87
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    invoke-virtual {p2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->isPassedRecentSlop()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    const/4 v2, 0x0

    .line 96
    const/4 v3, 0x1

    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    if-eqz p1, :cond_3

    .line 100
    .line 101
    move v0, v3

    .line 102
    goto :goto_0

    .line 103
    :cond_3
    move v0, v2

    .line 104
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    const-string v5, "onMotionPauseChanged: "

    .line 110
    .line 111
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v5, " , isPaused: "

    .line 118
    .line 119
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v5, " , "

    .line 126
    .line 127
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    if-nez v0, :cond_4

    .line 141
    .line 142
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 143
    .line 144
    invoke-static {v1, v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->o0(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V

    .line 145
    .line 146
    .line 147
    :cond_4
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 148
    .line 149
    iget-boolean v2, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mNeedShowPeekStatus:Z

    .line 150
    .line 151
    iput-boolean v0, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mNeedShowPeekStatus:Z

    .line 152
    .line 153
    if-eqz v0, :cond_5

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->performHapticFeedback()V

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 159
    .line 160
    invoke-virtual {v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->showMiniWindowTipsView()V

    .line 161
    .line 162
    .line 163
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 164
    .line 165
    invoke-virtual {v1, v3}, Lcom/android/quickstep/AbsSwipeUpHandler;->setMiniWindowWeaken(Z)V

    .line 166
    .line 167
    .line 168
    :cond_5
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 169
    .line 170
    iget-boolean v1, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mNeedShowPeekStatus:Z

    .line 171
    .line 172
    if-eq v2, v1, :cond_6

    .line 173
    .line 174
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->setShelfPeekState(Z)V

    .line 175
    .line 176
    .line 177
    iget-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 178
    .line 179
    invoke-virtual {p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeUpdateRecentsAttachedState()V

    .line 180
    .line 181
    .line 182
    :cond_6
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 183
    .line 184
    invoke-static {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->p0(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public onMotionPauseDetected()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 4
    .line 5
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p0, "AbsSwipeUpHandler"

    .line 14
    .line 15
    const-string v0, "onMotionPauseChanged: STATE_HANDLER_INVALIDATED pause change."

    .line 16
    .line 17
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-static {v0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->n0(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->t0(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$2;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->playBackGroundAnim()V

    .line 35
    .line 36
    .line 37
    return-void
.end method
