.class public final Lcom/android/quickstep/util/VelocityTrackerWrapper;
.super Ljava/lang/Object;
.source "VelocityTrackerWrapper.java"


# static fields
.field private static final EVENT_COUNT_THRESHOLD:I = 0x8

.field private static final TAG:Ljava/lang/String; = "VelocityTrackerWrapper"


# instance fields
.field private mCurEventTime:J

.field private mCurPosition:Landroid/graphics/PointF;

.field private mDownEventTime:J

.field private mDownPos:Landroid/graphics/PointF;

.field private mEventCount:I


# direct methods
.method public constructor <init>()V
    .locals 3

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
    iput-object v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mCurPosition:Landroid/graphics/PointF;

    .line 10
    .line 11
    const-wide/16 v0, -0x1

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mCurEventTime:J

    .line 14
    .line 15
    new-instance v2, Landroid/graphics/PointF;

    .line 16
    .line 17
    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v2, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mDownPos:Landroid/graphics/PointF;

    .line 21
    .line 22
    iput-wide v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mDownEventTime:J

    .line 23
    .line 24
    return-void
.end method

.method private final clear()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mDownPos:Landroid/graphics/PointF;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mCurPosition:Landroid/graphics/PointF;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 10
    .line 11
    .line 12
    const-wide/16 v0, -0x1

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mDownEventTime:J

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mCurEventTime:J

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final getWrapperVelocity()Landroid/graphics/PointF;
    .locals 9

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mCurEventTime:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    const/4 v5, 0x0

    .line 8
    if-eqz v4, :cond_3

    .line 9
    .line 10
    iget-wide v6, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mDownEventTime:J

    .line 11
    .line 12
    cmp-long v2, v6, v2

    .line 13
    .line 14
    if-eqz v2, :cond_3

    .line 15
    .line 16
    cmp-long v2, v0, v6

    .line 17
    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget v2, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mEventCount:I

    .line 22
    .line 23
    const/16 v3, 0x8

    .line 24
    .line 25
    if-le v2, v3, :cond_1

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/util/VelocityTrackerWrapper;->clear()V

    .line 28
    .line 29
    .line 30
    return-object v5

    .line 31
    :cond_1
    iget-object v2, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mCurPosition:Landroid/graphics/PointF;

    .line 32
    .line 33
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 34
    .line 35
    iget-object v4, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mDownPos:Landroid/graphics/PointF;

    .line 36
    .line 37
    iget v8, v4, Landroid/graphics/PointF;->x:F

    .line 38
    .line 39
    sub-float/2addr v3, v8

    .line 40
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 41
    .line 42
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 43
    .line 44
    sub-float/2addr v2, v4

    .line 45
    sub-long/2addr v0, v6

    .line 46
    long-to-float v0, v0

    .line 47
    div-float/2addr v3, v0

    .line 48
    div-float/2addr v2, v0

    .line 49
    invoke-direct {p0}, Lcom/android/quickstep/util/VelocityTrackerWrapper;->clear()V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    cmpl-float p0, v2, p0

    .line 54
    .line 55
    if-ltz p0, :cond_2

    .line 56
    .line 57
    return-object v5

    .line 58
    :cond_2
    new-instance p0, Landroid/graphics/PointF;

    .line 59
    .line 60
    invoke-direct {p0, v3, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 61
    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_3
    :goto_0
    return-object v5
.end method

.method public final onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mEventCount:I

    .line 7
    .line 8
    add-int/lit8 v0, v0, 0x1

    .line 9
    .line 10
    iput v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mEventCount:I

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mDownPos:Landroid/graphics/PointF;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    iput-wide v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mDownEventTime:J

    .line 36
    .line 37
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    iput-wide v0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mCurEventTime:J

    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/quickstep/util/VelocityTrackerWrapper;->mCurPosition:Landroid/graphics/PointF;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-virtual {p0, v0, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
