.class Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$1;
.super Ljava/lang/Object;
.source "GestureCourseInputConsumer.java"

# interfaces
.implements Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->onMotionEvent(Landroid/view/MotionEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;


# direct methods
.method constructor <init>(Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;

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
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onMotionPauseChanged: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v2, " , "

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v2, "GestureCourseInputConsumer"

    .line 27
    .line 28
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->getShelfPeekState()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-ne v0, p1, :cond_0

    .line 36
    .line 37
    const-string p0, "onMotionPauseChanged: ignore change, because status not change "

    .line 38
    .line 39
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->getShelfPeekState()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->isDirectionUp()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-virtual {p2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->getPauseChangeReason()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/4 v3, 0x3

    .line 60
    if-eq v0, v3, :cond_1

    .line 61
    .line 62
    const-string p0, "onMotionPauseChanged: ignore change, because still gesture & distance small than threshold "

    .line 63
    .line 64
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-virtual {p2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->getShelfPeekState()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    invoke-virtual {p2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->isDirectionUp()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_2

    .line 79
    .line 80
    invoke-virtual {p2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->isPassedRecentSlop()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    new-instance p0, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .line 90
    .line 91
    const-string p1, "onMotionPauseChanged: ignore change, because still in peek & in active zone "

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->getCurPoint()Landroid/graphics/PointF;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_2
    invoke-virtual {p2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->isPassedRecentSlop()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_3

    .line 118
    .line 119
    if-eqz p1, :cond_3

    .line 120
    .line 121
    const/4 v0, 0x1

    .line 122
    goto :goto_0

    .line 123
    :cond_3
    const/4 v0, 0x0

    .line 124
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v1, " , isPaused: "

    .line 136
    .line 137
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    .line 149
    .line 150
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;

    .line 151
    .line 152
    invoke-static {v1}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->a(Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;)Z

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;

    .line 157
    .line 158
    invoke-static {v2, v0}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->c(Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;Z)V

    .line 159
    .line 160
    .line 161
    if-eqz v0, :cond_4

    .line 162
    .line 163
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;

    .line 164
    .line 165
    invoke-virtual {v2}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->performHapticFeedback()V

    .line 166
    .line 167
    .line 168
    :cond_4
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;

    .line 169
    .line 170
    invoke-static {v2}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->a(Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;)Z

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    if-eq v1, v2, :cond_5

    .line 175
    .line 176
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->setShelfPeekState(Z)V

    .line 177
    .line 178
    .line 179
    :cond_5
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;

    .line 180
    .line 181
    invoke-static {p2, p1}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->b(Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;Z)V

    .line 182
    .line 183
    .line 184
    invoke-static {}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->d()Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;

    .line 189
    .line 190
    if-eqz v0, :cond_6

    .line 191
    .line 192
    const/16 p2, 0xa

    .line 193
    .line 194
    goto :goto_1

    .line 195
    :cond_6
    const/16 p2, 0xb

    .line 196
    .line 197
    :goto_1
    invoke-virtual {p1, p0, p2}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureState(Landroid/content/Context;I)V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public onMotionPauseDetected()V
    .locals 0

    .line 1
    return-void
.end method
