.class public Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;
.super Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;
.source "AccessibilityInputConsumer.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "A11yInputConsumer"


# instance fields
.field private mActivePointerId:I

.field private final mContext:Landroid/content/Context;

.field private final mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

.field private mDownY:F

.field private final mMinFlingVelocity:F

.field private final mMinGestureDistance:F

.field private final mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

.field private final mRotationHelper:Lcom/android/quickstep/RotationTouchHelper;

.field private mTotalY:F

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p4, p5}, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;-><init>(ILcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, -0x1

    .line 5
    iput p2, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mActivePointerId:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mContext:Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const p4, 0x7f07006c

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iput p2, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mMinGestureDistance:F

    .line 27
    .line 28
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    int-to-float p2, p2

    .line 37
    iput p2, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mMinFlingVelocity:F

    .line 38
    .line 39
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 40
    .line 41
    sget-object p2, Lcom/android/quickstep/RotationTouchHelper;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 42
    .line 43
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    check-cast p2, Lcom/android/quickstep/RotationTouchHelper;

    .line 48
    .line 49
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mRotationHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 50
    .line 51
    new-instance p2, Lcom/android/quickstep/util/MotionPauseDetector;

    .line 52
    .line 53
    const/4 p3, 0x0

    .line 54
    invoke-direct {p2, p1, p3}, Lcom/android/quickstep/util/MotionPauseDetector;-><init>(Landroid/content/Context;Z)V

    .line 55
    .line 56
    .line 57
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 58
    .line 59
    return-void
.end method

.method private cleanupAfterGesture()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method protected getDelegatorName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "AccessibilityInputConsumer"

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/InputConsumer;->getType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    or-int/lit8 p0, p0, 0x20

    .line 8
    .line 9
    return p0
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x1

    .line 19
    if-eq v0, v3, :cond_7

    .line 20
    .line 21
    if-eq v0, v1, :cond_5

    .line 22
    .line 23
    const/4 v4, 0x3

    .line 24
    if-eq v0, v4, :cond_b

    .line 25
    .line 26
    const/4 v4, 0x5

    .line 27
    if-eq v0, v4, :cond_3

    .line 28
    .line 29
    const/4 v1, 0x6

    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    goto/16 :goto_1

    .line 33
    .line 34
    :cond_1
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 35
    .line 36
    if-ne v0, v3, :cond_c

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget v4, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mActivePointerId:I

    .line 47
    .line 48
    if-ne v1, v4, :cond_c

    .line 49
    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    move v2, v3

    .line 53
    :cond_2
    iget v1, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mTotalY:F

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget v4, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mDownY:F

    .line 60
    .line 61
    sub-float/2addr v0, v4

    .line 62
    add-float/2addr v1, v0

    .line 63
    iput v1, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mTotalY:F

    .line 64
    .line 65
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iput v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mDownY:F

    .line 70
    .line 71
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iput v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mActivePointerId:I

    .line 76
    .line 77
    goto/16 :goto_1

    .line 78
    .line 79
    :cond_3
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 80
    .line 81
    if-nez v0, :cond_c

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mRotationHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 88
    .line 89
    invoke-virtual {v2, p1, v0}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;I)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_4

    .line 94
    .line 95
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 96
    .line 97
    invoke-interface {v2}, Lcom/android/quickstep/InputConsumer;->allowInterceptByParent()Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eqz v2, :cond_4

    .line 102
    .line 103
    invoke-virtual {p0, p1}, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->setActive(Landroid/view/MotionEvent;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    iput v1, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mActivePointerId:I

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    iput v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mDownY:F

    .line 117
    .line 118
    goto/16 :goto_1

    .line 119
    .line 120
    :cond_4
    iput v1, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 121
    .line 122
    goto/16 :goto_1

    .line 123
    .line 124
    :cond_5
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 125
    .line 126
    if-ne v0, v3, :cond_c

    .line 127
    .line 128
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 129
    .line 130
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isAccessibilityMenuShortcutAvailable()Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-eqz v0, :cond_c

    .line 135
    .line 136
    iget v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mActivePointerId:I

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    const/4 v1, -0x1

    .line 143
    if-ne v0, v1, :cond_6

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_6
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 147
    .line 148
    invoke-virtual {v1, p1, v0}, Lcom/android/quickstep/util/MotionPauseDetector;->addPosition(Landroid/view/MotionEvent;I)V

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_7
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 153
    .line 154
    if-ne v0, v3, :cond_b

    .line 155
    .line 156
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isAccessibilityMenuShortcutAvailable()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_8

    .line 163
    .line 164
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/android/quickstep/util/MotionPauseDetector;->isPaused()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_8

    .line 171
    .line 172
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 173
    .line 174
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mContext:Landroid/content/Context;

    .line 175
    .line 176
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 181
    .line 182
    invoke-virtual {v0}, Lcom/android/quickstep/SystemUiProxy;->notifyAccessibilityButtonLongClicked()V

    .line 183
    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_8
    iget v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mTotalY:F

    .line 187
    .line 188
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    iget v4, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mDownY:F

    .line 193
    .line 194
    sub-float/2addr v1, v4

    .line 195
    add-float/2addr v0, v1

    .line 196
    iput v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mTotalY:F

    .line 197
    .line 198
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 199
    .line 200
    if-eqz v0, :cond_9

    .line 201
    .line 202
    const/16 v1, 0x3e8

    .line 203
    .line 204
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 205
    .line 206
    .line 207
    :cond_9
    iget v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mTotalY:F

    .line 208
    .line 209
    neg-float v0, v0

    .line 210
    iget v1, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mMinGestureDistance:F

    .line 211
    .line 212
    cmpl-float v0, v0, v1

    .line 213
    .line 214
    if-gtz v0, :cond_a

    .line 215
    .line 216
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 217
    .line 218
    if-eqz v0, :cond_b

    .line 219
    .line 220
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    neg-float v0, v0

    .line 225
    iget v1, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mMinFlingVelocity:F

    .line 226
    .line 227
    cmpl-float v0, v0, v1

    .line 228
    .line 229
    if-lez v0, :cond_b

    .line 230
    .line 231
    :cond_a
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 232
    .line 233
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->mContext:Landroid/content/Context;

    .line 234
    .line 235
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 240
    .line 241
    invoke-virtual {v0, v2}, Lcom/android/quickstep/SystemUiProxy;->notifyAccessibilityButtonClicked(I)V

    .line 242
    .line 243
    .line 244
    :cond_b
    :goto_0
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/AccessibilityInputConsumer;->cleanupAfterGesture()V

    .line 245
    .line 246
    .line 247
    :cond_c
    :goto_1
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 248
    .line 249
    if-eq v0, v3, :cond_d

    .line 250
    .line 251
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 252
    .line 253
    invoke-interface {p0, p1}, Lcom/android/quickstep/InputConsumer;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 254
    .line 255
    .line 256
    :cond_d
    return-void
.end method
