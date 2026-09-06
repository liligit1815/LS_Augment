.class public Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;
.super Ljava/lang/Object;
.source "BubbleBarInputConsumer.java"

# interfaces
.implements Lcom/android/quickstep/InputConsumer;


# static fields
.field private static final TAG:Ljava/lang/String; = "BubbleBarInputConsumer"


# instance fields
.field private mActivePointerId:I

.field private final mBubbleBarSwipeController:Lcom/android/launcher3/taskbar/bubbles/B;

.field private final mBubbleBarViewController:Lcom/android/launcher3/taskbar/bubbles/g0;

.field private final mBubbleStashController:LX1/b;

.field private final mDisplayId:I

.field private final mDownPos:Landroid/graphics/PointF;

.field private mDownTime:J

.field private final mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

.field private final mLastPos:Landroid/graphics/PointF;

.field private mPassedTouchSlop:Z

.field private mPilfered:Z

.field private mStashedOrCollapsedOnDown:Z

.field private final mTimeForLongPress:J

.field private final mTouchSlop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/android/launcher3/taskbar/bubbles/m0;Lcom/android/systemui/shared/system/InputMonitorCompat;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mActivePointerId:I

    .line 20
    .line 21
    iput p2, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mDisplayId:I

    .line 22
    .line 23
    iget-object p2, p3, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 24
    .line 25
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleStashController:LX1/b;

    .line 26
    .line 27
    iget-object p2, p3, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 28
    .line 29
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleBarViewController:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 30
    .line 31
    iget-object p2, p3, Lcom/android/launcher3/taskbar/bubbles/m0;->i:Ljava/util/Optional;

    .line 32
    .line 33
    const/4 p3, 0x0

    .line 34
    invoke-virtual {p2, p3}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    check-cast p2, Lcom/android/launcher3/taskbar/bubbles/B;

    .line 39
    .line 40
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleBarSwipeController:Lcom/android/launcher3/taskbar/bubbles/B;

    .line 41
    .line 42
    iput-object p4, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 43
    .line 44
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iput p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mTouchSlop:I

    .line 53
    .line 54
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    int-to-long p1, p1

    .line 59
    iput-wide p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mTimeForLongPress:J

    .line 60
    .line 61
    return-void
.end method

.method private cleanupAfterMotionEvent()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "cleaning up passedSlop="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mPassedTouchSlop:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " pilfered="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mPilfered:Z

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "BubbleBarInputConsumer"

    .line 31
    .line 32
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleBarSwipeController:Lcom/android/launcher3/taskbar/bubbles/B;

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/B;->f()V

    .line 40
    .line 41
    .line 42
    :cond_0
    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mPassedTouchSlop:Z

    .line 44
    .line 45
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mPilfered:Z

    .line 46
    .line 47
    const-wide/16 v0, 0x0

    .line 48
    .line 49
    iput-wide v0, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mDownTime:J

    .line 50
    .line 51
    return-void
.end method

.method private isCollapsed()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleStashController:LX1/b;

    .line 2
    .line 3
    invoke-interface {v0}, LX1/b;->v()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleBarViewController:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->D0()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static isEventOnBubbles(Lcom/android/launcher3/taskbar/I1;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->isBubbleBarEnabled()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->q0()Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_3

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 27
    .line 28
    invoke-interface {v1}, LX1/b;->c()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->d:Ljava/util/Optional;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/util/Optional;->isPresent()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->d:Ljava/util/Optional;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/A0;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/A0;->p(Landroid/view/MotionEvent;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    return p0

    .line 55
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->A0()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->C0(Landroid/view/MotionEvent;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0

    .line 70
    :cond_3
    :goto_0
    return v0
.end method


# virtual methods
.method public getDisplayId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mDisplayId:I

    .line 2
    .line 3
    return p0
.end method

.method public getType()I
    .locals 0

    .line 1
    const/high16 p0, 0x10000

    .line 2
    .line 3
    return p0
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    const/4 v2, 0x0

    .line 7
    const-string v3, "BubbleBarInputConsumer"

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    if-eqz v0, :cond_a

    .line 11
    .line 12
    if-eq v0, v4, :cond_6

    .line 13
    .line 14
    const/4 v5, 0x2

    .line 15
    if-eq v0, v5, :cond_1

    .line 16
    .line 17
    if-eq v0, v1, :cond_0

    .line 18
    .line 19
    goto/16 :goto_1

    .line 20
    .line 21
    :cond_0
    const-string p1, "ACTION_CANCEL"

    .line 22
    .line 23
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_1
    iget v5, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mActivePointerId:I

    .line 29
    .line 30
    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    const/4 v6, -0x1

    .line 35
    if-ne v5, v6, :cond_2

    .line 36
    .line 37
    const-string p1, "ACTION_MOVE skip, invalid pointer id"

    .line 38
    .line 39
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    goto/16 :goto_1

    .line 43
    .line 44
    :cond_2
    iget-object v6, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 45
    .line 46
    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getX(I)F

    .line 47
    .line 48
    .line 49
    move-result v7

    .line 50
    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getY(I)F

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    invoke-virtual {v6, v7, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 58
    .line 59
    iget v5, p1, Landroid/graphics/PointF;->x:F

    .line 60
    .line 61
    iget-object v6, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 62
    .line 63
    iget v7, v6, Landroid/graphics/PointF;->x:F

    .line 64
    .line 65
    sub-float/2addr v5, v7

    .line 66
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 67
    .line 68
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 69
    .line 70
    sub-float/2addr p1, v6

    .line 71
    iget-boolean v6, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mPassedTouchSlop:Z

    .line 72
    .line 73
    if-nez v6, :cond_5

    .line 74
    .line 75
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    iget v7, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mTouchSlop:I

    .line 80
    .line 81
    int-to-float v7, v7

    .line 82
    cmpl-float v6, v6, v7

    .line 83
    .line 84
    if-gtz v6, :cond_3

    .line 85
    .line 86
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    iget v6, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mTouchSlop:I

    .line 91
    .line 92
    int-to-float v6, v6

    .line 93
    cmpl-float v5, v5, v6

    .line 94
    .line 95
    if-lez v5, :cond_4

    .line 96
    .line 97
    :cond_3
    move v2, v4

    .line 98
    :cond_4
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mPassedTouchSlop:Z

    .line 99
    .line 100
    if-eqz v2, :cond_5

    .line 101
    .line 102
    new-instance v2, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string v5, "ACTION_MOVE passed touch slop pos="

    .line 108
    .line 109
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 113
    .line 114
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    :cond_5
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleBarSwipeController:Lcom/android/launcher3/taskbar/bubbles/B;

    .line 125
    .line 126
    if-eqz v2, :cond_d

    .line 127
    .line 128
    invoke-virtual {v2, p1}, Lcom/android/launcher3/taskbar/bubbles/B;->n(F)V

    .line 129
    .line 130
    .line 131
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mPilfered:Z

    .line 132
    .line 133
    if-nez p1, :cond_d

    .line 134
    .line 135
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleBarSwipeController:Lcom/android/launcher3/taskbar/bubbles/B;

    .line 136
    .line 137
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/B;->h()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_d

    .line 142
    .line 143
    const-string p1, "ACTION_MOVE swipe gesture, pilfering"

    .line 144
    .line 145
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    iput-boolean v4, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mPilfered:Z

    .line 149
    .line 150
    const-string p1, "Pilfer"

    .line 151
    .line 152
    const-string v2, "pilferPointers"

    .line 153
    .line 154
    invoke-static {p1, v2}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/android/systemui/shared/system/InputMonitorCompat;->pilferPointers()V

    .line 160
    .line 161
    .line 162
    goto/16 :goto_1

    .line 163
    .line 164
    :cond_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 165
    .line 166
    .line 167
    move-result-wide v5

    .line 168
    iget-wide v7, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mDownTime:J

    .line 169
    .line 170
    sub-long/2addr v5, v7

    .line 171
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleBarSwipeController:Lcom/android/launcher3/taskbar/bubbles/B;

    .line 172
    .line 173
    if-eqz p1, :cond_7

    .line 174
    .line 175
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/B;->h()Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-eqz p1, :cond_7

    .line 180
    .line 181
    move p1, v4

    .line 182
    goto :goto_0

    .line 183
    :cond_7
    move p1, v2

    .line 184
    :goto_0
    iget-wide v7, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mTimeForLongPress:J

    .line 185
    .line 186
    cmp-long v7, v5, v7

    .line 187
    .line 188
    if-gtz v7, :cond_8

    .line 189
    .line 190
    move v2, v4

    .line 191
    :cond_8
    new-instance v7, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 194
    .line 195
    .line 196
    const-string v8, "ACTION_UP swipeUp="

    .line 197
    .line 198
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    const-string v8, " isInTapTime="

    .line 205
    .line 206
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string v8, " tapTime="

    .line 213
    .line 214
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v7, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    const-string v5, " passedTouchSlop="

    .line 221
    .line 222
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    iget-boolean v5, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mPassedTouchSlop:Z

    .line 226
    .line 227
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    const-string v5, " stashedOrCollapsedOnDown="

    .line 231
    .line 232
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    iget-boolean v5, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mStashedOrCollapsedOnDown:Z

    .line 236
    .line 237
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v5

    .line 244
    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    if-eqz v2, :cond_9

    .line 248
    .line 249
    if-nez p1, :cond_9

    .line 250
    .line 251
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mPassedTouchSlop:Z

    .line 252
    .line 253
    if-nez p1, :cond_9

    .line 254
    .line 255
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mStashedOrCollapsedOnDown:Z

    .line 256
    .line 257
    if-eqz p1, :cond_9

    .line 258
    .line 259
    const-string p1, "ACTION_UP showing bubble bar"

    .line 260
    .line 261
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    .line 263
    .line 264
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleStashController:LX1/b;

    .line 265
    .line 266
    invoke-interface {p1, v4, v4}, LX1/b;->m(ZZ)V

    .line 267
    .line 268
    .line 269
    goto :goto_1

    .line 270
    :cond_9
    const-string p1, "ACTION_UP nothing to do"

    .line 271
    .line 272
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    goto :goto_1

    .line 276
    :cond_a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 277
    .line 278
    .line 279
    move-result-wide v5

    .line 280
    iput-wide v5, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mDownTime:J

    .line 281
    .line 282
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 283
    .line 284
    .line 285
    move-result v5

    .line 286
    iput v5, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mActivePointerId:I

    .line 287
    .line 288
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 289
    .line 290
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 291
    .line 292
    .line 293
    move-result v6

    .line 294
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 295
    .line 296
    .line 297
    move-result p1

    .line 298
    invoke-virtual {v5, v6, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 299
    .line 300
    .line 301
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 302
    .line 303
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 304
    .line 305
    invoke-virtual {p1, v5}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 306
    .line 307
    .line 308
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleStashController:LX1/b;

    .line 309
    .line 310
    invoke-interface {p1}, LX1/b;->c()Z

    .line 311
    .line 312
    .line 313
    move-result p1

    .line 314
    if-nez p1, :cond_b

    .line 315
    .line 316
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->isCollapsed()Z

    .line 317
    .line 318
    .line 319
    move-result p1

    .line 320
    if-eqz p1, :cond_c

    .line 321
    .line 322
    :cond_b
    move v2, v4

    .line 323
    :cond_c
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mStashedOrCollapsedOnDown:Z

    .line 324
    .line 325
    new-instance p1, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 328
    .line 329
    .line 330
    const-string v2, "ACTION_DOWN stashedOrCollapsed="

    .line 331
    .line 332
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    iget-boolean v2, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mStashedOrCollapsedOnDown:Z

    .line 336
    .line 337
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    const-string v2, " downPos="

    .line 341
    .line 342
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 346
    .line 347
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p1

    .line 354
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    .line 356
    .line 357
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->mBubbleBarSwipeController:Lcom/android/launcher3/taskbar/bubbles/B;

    .line 358
    .line 359
    if-eqz p1, :cond_d

    .line 360
    .line 361
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/B;->m()V

    .line 362
    .line 363
    .line 364
    :cond_d
    :goto_1
    if-eq v0, v4, :cond_f

    .line 365
    .line 366
    if-ne v0, v1, :cond_e

    .line 367
    .line 368
    goto :goto_2

    .line 369
    :cond_e
    return-void

    .line 370
    :cond_f
    :goto_2
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/BubbleBarInputConsumer;->cleanupAfterMotionEvent()V

    .line 371
    .line 372
    .line 373
    return-void
.end method
