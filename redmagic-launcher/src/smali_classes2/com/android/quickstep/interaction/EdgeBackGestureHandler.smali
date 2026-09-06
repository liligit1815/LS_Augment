.class public Lcom/android/quickstep/interaction/EdgeBackGestureHandler;
.super Ljava/lang/Object;
.source "EdgeBackGestureHandler.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;,
        Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;
    }
.end annotation


# static fields
.field private static final MAX_LONG_PRESS_TIMEOUT:I

.field private static final TAG:Ljava/lang/String; = "EdgeBackGestureHandler"


# instance fields
.field private mAllowGesture:Z

.field private final mBackCallback:Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;

.field private final mBottomGestureHeight:I

.field private final mContext:Landroid/content/Context;

.field private final mDeviceProfile:Lcom/android/launcher3/h0;

.field private mDisallowedGestureReason:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

.field private final mDisplaySize:Landroid/graphics/Point;

.field private final mDownPoint:Landroid/graphics/PointF;

.field private mEdgeBackPanel:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

.field private final mEdgeWidth:I

.field private mGestureCallback:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;

.field private mIsEnabled:Z

.field private mLeftInset:I

.field private final mLongPressTimeout:I

.field private mRightInset:I

.field private mThresholdCrossed:Z

.field private final mTouchSlop:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "gestures.back_timeout"

    .line 2
    .line 3
    const/16 v1, 0xfa

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sput v0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->MAX_LONG_PRESS_TIMEOUT:I

    .line 10
    .line 11
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/h0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Point;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDisplaySize:Landroid/graphics/Point;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDownPoint:Landroid/graphics/PointF;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mThresholdCrossed:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mAllowGesture:Z

    .line 22
    .line 23
    new-instance v0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$1;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$1;-><init>(Lcom/android/quickstep/interaction/EdgeBackGestureHandler;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mBackCallback:Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mContext:Landroid/content/Context;

    .line 35
    .line 36
    iput-object p2, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 37
    .line 38
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    int-to-float p1, p1

    .line 47
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mTouchSlop:F

    .line 48
    .line 49
    sget p1, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->MAX_LONG_PRESS_TIMEOUT:I

    .line 50
    .line 51
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mLongPressTimeout:I

    .line 60
    .line 61
    const-string p1, "navigation_bar_gesture_height"

    .line 62
    .line 63
    invoke-static {p1, v0}, Lc2/a;->d(Ljava/lang/String;Landroid/content/res/Resources;)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mBottomGestureHeight:I

    .line 68
    .line 69
    const-string p1, "config_backGestureInset"

    .line 70
    .line 71
    invoke-static {p1, v0}, Lc2/a;->d(Ljava/lang/String;Landroid/content/res/Resources;)I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_0

    .line 76
    .line 77
    const/high16 p1, 0x41900000    # 18.0f

    .line 78
    .line 79
    invoke-static {p1}, Lcom/android/launcher3/N5;->i(F)I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    :cond_0
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeWidth:I

    .line 84
    .line 85
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/interaction/EdgeBackGestureHandler;)Lcom/android/quickstep/interaction/EdgeBackGesturePanel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeBackPanel:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/interaction/EdgeBackGestureHandler;)Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method private cancelGesture(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mAllowGesture:Z

    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v0, 0x3

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeBackPanel:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private createLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    const-string v1, "navigation_edge_panel_width"

    .line 10
    .line 11
    invoke-static {v1, p0}, Lc2/a;->d(Ljava/lang/String;Landroid/content/res/Resources;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "navigation_edge_panel_height"

    .line 16
    .line 17
    invoke-static {v2, p0}, Lc2/a;->d(Ljava/lang/String;Landroid/content/res/Resources;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-direct {v0, v1, p0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method private isWithinTouchRegion(II)Z
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeWidth:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mLeftInset:I

    .line 4
    .line 5
    add-int/2addr v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    if-le p1, v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDisplaySize:Landroid/graphics/Point;

    .line 10
    .line 11
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 12
    .line 13
    sub-int/2addr v1, v0

    .line 14
    iget v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mRightInset:I

    .line 15
    .line 16
    sub-int/2addr v1, v0

    .line 17
    if-ge p1, v1, :cond_0

    .line 18
    .line 19
    sget-object p1, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;->BACK_NOT_STARTED_TOO_FAR_FROM_EDGE:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDisallowedGestureReason:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 22
    .line 23
    return v2

    .line 24
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDisplaySize:Landroid/graphics/Point;

    .line 25
    .line 26
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 27
    .line 28
    iget v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mBottomGestureHeight:I

    .line 29
    .line 30
    sub-int/2addr p1, v0

    .line 31
    if-lt p2, p1, :cond_1

    .line 32
    .line 33
    sget-object p1, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;->BACK_NOT_STARTED_IN_NAV_BAR_REGION:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDisallowedGestureReason:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 36
    .line 37
    return v2

    .line 38
    :cond_1
    const/4 p0, 0x1

    .line 39
    return p0
.end method

.method private onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    iget v3, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeWidth:I

    .line 13
    .line 14
    iget v4, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mLeftInset:I

    .line 15
    .line 16
    add-int/2addr v3, v4

    .line 17
    int-to-float v3, v3

    .line 18
    cmpg-float v2, v2, v3

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    if-gtz v2, :cond_0

    .line 22
    .line 23
    move v2, v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v2, v3

    .line 26
    :goto_0
    sget-object v4, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;->UNKNOWN:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 27
    .line 28
    iput-object v4, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDisallowedGestureReason:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    float-to-int v4, v4

    .line 35
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    float-to-int v5, v5

    .line 40
    invoke-direct {p0, v4, v5}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->isWithinTouchRegion(II)Z

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    iput-boolean v4, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mAllowGesture:Z

    .line 45
    .line 46
    iget-object v4, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDownPoint:Landroid/graphics/PointF;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    invoke-virtual {v4, v5, v6}, Landroid/graphics/PointF;->set(FF)V

    .line 57
    .line 58
    .line 59
    iget-boolean v4, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mAllowGesture:Z

    .line 60
    .line 61
    if-eqz v4, :cond_6

    .line 62
    .line 63
    iget-object v4, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeBackPanel:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 64
    .line 65
    invoke-virtual {v4, v2}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setIsLeftPanel(Z)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeBackPanel:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 69
    .line 70
    invoke-virtual {v2, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 71
    .line 72
    .line 73
    iput-boolean v3, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mThresholdCrossed:Z

    .line 74
    .line 75
    goto/16 :goto_1

    .line 76
    .line 77
    :cond_1
    iget-boolean v2, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mAllowGesture:Z

    .line 78
    .line 79
    if-eqz v2, :cond_6

    .line 80
    .line 81
    iget-boolean v2, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mThresholdCrossed:Z

    .line 82
    .line 83
    if-nez v2, :cond_5

    .line 84
    .line 85
    const/4 v2, 0x5

    .line 86
    if-ne v0, v2, :cond_2

    .line 87
    .line 88
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->cancelGesture(Landroid/view/MotionEvent;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    const/4 v2, 0x2

    .line 93
    if-ne v0, v2, :cond_5

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 96
    .line 97
    .line 98
    move-result-wide v2

    .line 99
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    .line 100
    .line 101
    .line 102
    move-result-wide v4

    .line 103
    sub-long/2addr v2, v4

    .line 104
    iget v4, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mLongPressTimeout:I

    .line 105
    .line 106
    int-to-long v4, v4

    .line 107
    cmp-long v2, v2, v4

    .line 108
    .line 109
    if-lez v2, :cond_3

    .line 110
    .line 111
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->cancelGesture(Landroid/view/MotionEvent;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    iget-object v3, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDownPoint:Landroid/graphics/PointF;

    .line 120
    .line 121
    iget v3, v3, Landroid/graphics/PointF;->x:F

    .line 122
    .line 123
    sub-float/2addr v2, v3

    .line 124
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    iget-object v4, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDownPoint:Landroid/graphics/PointF;

    .line 133
    .line 134
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 135
    .line 136
    sub-float/2addr v3, v4

    .line 137
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    cmpl-float v4, v3, v2

    .line 142
    .line 143
    if-lez v4, :cond_4

    .line 144
    .line 145
    iget v4, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mTouchSlop:F

    .line 146
    .line 147
    cmpl-float v4, v3, v4

    .line 148
    .line 149
    if-lez v4, :cond_4

    .line 150
    .line 151
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->cancelGesture(Landroid/view/MotionEvent;)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_4
    cmpl-float v3, v2, v3

    .line 156
    .line 157
    if-lez v3, :cond_5

    .line 158
    .line 159
    iget v3, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mTouchSlop:F

    .line 160
    .line 161
    cmpl-float v2, v2, v3

    .line 162
    .line 163
    if-lez v2, :cond_5

    .line 164
    .line 165
    iput-boolean v1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mThresholdCrossed:Z

    .line 166
    .line 167
    :cond_5
    iget-object v2, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;

    .line 168
    .line 169
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 170
    .line 171
    .line 172
    move-result v3

    .line 173
    iget-object v4, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDownPoint:Landroid/graphics/PointF;

    .line 174
    .line 175
    iget v4, v4, Landroid/graphics/PointF;->x:F

    .line 176
    .line 177
    sub-float/2addr v3, v4

    .line 178
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 179
    .line 180
    .line 181
    move-result v4

    .line 182
    iget-object v5, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDownPoint:Landroid/graphics/PointF;

    .line 183
    .line 184
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 185
    .line 186
    sub-float/2addr v4, v5

    .line 187
    iget-object v5, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeBackPanel:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 188
    .line 189
    invoke-virtual {v5}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->getIsLeftPanel()Z

    .line 190
    .line 191
    .line 192
    move-result v5

    .line 193
    invoke-interface {v2, v3, v4, v5}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;->onBackGestureProgress(FFZ)V

    .line 194
    .line 195
    .line 196
    iget-object v2, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeBackPanel:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 197
    .line 198
    invoke-virtual {v2, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 199
    .line 200
    .line 201
    :cond_6
    :goto_1
    if-eq v0, v1, :cond_7

    .line 202
    .line 203
    const/4 v1, 0x3

    .line 204
    if-ne v0, v1, :cond_8

    .line 205
    .line 206
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    iget-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDownPoint:Landroid/graphics/PointF;

    .line 211
    .line 212
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 213
    .line 214
    sub-float/2addr v0, v1

    .line 215
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    iget-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDownPoint:Landroid/graphics/PointF;

    .line 224
    .line 225
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 226
    .line 227
    sub-float/2addr p1, v1

    .line 228
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    cmpl-float p1, v0, p1

    .line 233
    .line 234
    if-lez p1, :cond_8

    .line 235
    .line 236
    iget p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mTouchSlop:F

    .line 237
    .line 238
    cmpl-float p1, v0, p1

    .line 239
    .line 240
    if-lez p1, :cond_8

    .line 241
    .line 242
    iget-boolean p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mAllowGesture:Z

    .line 243
    .line 244
    if-nez p1, :cond_8

    .line 245
    .line 246
    iget-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;

    .line 247
    .line 248
    if-eqz p1, :cond_8

    .line 249
    .line 250
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDisallowedGestureReason:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;

    .line 251
    .line 252
    invoke-interface {p1, p0}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;->onBackGestureAttempted(Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureResult;)V

    .line 253
    .line 254
    .line 255
    :cond_8
    return-void
.end method


# virtual methods
.method onInterceptTouch(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-int v0, v0

    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    float-to-int p1, p1

    .line 11
    invoke-direct {p0, v0, p1}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->isWithinTouchRegion(II)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mIsEnabled:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method registerBackGestureAttemptCallback(Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;

    .line 2
    .line 3
    return-void
.end method

.method setInsets(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mLeftInset:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mRightInset:I

    .line 4
    .line 5
    return-void
.end method

.method setViewGroupParent(Landroid/view/ViewGroup;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    :goto_0
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mIsEnabled:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeBackPanel:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->onDestroy()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeBackPanel:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 17
    .line 18
    :cond_1
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mIsEnabled:Z

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    new-instance v0, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mContext:Landroid/content/Context;

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->createLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-direct {v0, v1, p1, v2}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeBackPanel:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mBackCallback:Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setBackCallback(Lcom/android/quickstep/interaction/EdgeBackGesturePanel$BackCallback;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDisplaySize:Landroid/graphics/Point;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 43
    .line 44
    iget v1, v0, Lcom/android/launcher3/h0;->T0:I

    .line 45
    .line 46
    iget v0, v0, Lcom/android/launcher3/h0;->U0:I

    .line 47
    .line 48
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Point;->set(II)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mEdgeBackPanel:Lcom/android/quickstep/interaction/EdgeBackGesturePanel;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mDisplaySize:Landroid/graphics/Point;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Lcom/android/quickstep/interaction/EdgeBackGesturePanel;->setDisplaySize(Landroid/graphics/Point;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method unregisterBackGestureAttemptCallback()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/interaction/EdgeBackGestureHandler;->mGestureCallback:Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;

    .line 3
    .line 4
    return-void
.end method
