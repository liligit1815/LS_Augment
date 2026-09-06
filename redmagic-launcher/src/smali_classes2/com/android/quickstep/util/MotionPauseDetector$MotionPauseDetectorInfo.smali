.class public Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;
.super Ljava/lang/Object;
.source "MotionPauseDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/MotionPauseDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MotionPauseDetectorInfo"
.end annotation


# instance fields
.field public final PAUSE_CHANGE_REASON_0:I

.field public final PAUSE_CHANGE_REASON_1:I

.field public final PAUSE_CHANGE_REASON_2:I

.field public final PAUSE_CHANGE_REASON_3:I

.field public final PAUSE_CHANGE_REASON_4:I

.field private isUp:Z

.field private mCurPoint:Landroid/graphics/PointF;

.field private mIsPeek:Ljava/lang/Boolean;

.field public mLastKneePoint:Landroid/graphics/PointF;

.field private mPassedRecentSlop:Z

.field private mSecondaryDisallowPause:Z

.field private pauseChangeReason:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mPassedRecentSlop:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->PAUSE_CHANGE_REASON_0:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput v1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->PAUSE_CHANGE_REASON_1:I

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    iput v2, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->PAUSE_CHANGE_REASON_2:I

    .line 14
    .line 15
    const/4 v2, 0x3

    .line 16
    iput v2, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->PAUSE_CHANGE_REASON_3:I

    .line 17
    .line 18
    const/4 v2, 0x4

    .line 19
    iput v2, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->PAUSE_CHANGE_REASON_4:I

    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    iput v2, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->pauseChangeReason:I

    .line 23
    .line 24
    iput-boolean v1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->isUp:Z

    .line 25
    .line 26
    new-instance v1, Landroid/graphics/PointF;

    .line 27
    .line 28
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mLastKneePoint:Landroid/graphics/PointF;

    .line 32
    .line 33
    iput-boolean v0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mSecondaryDisallowPause:Z

    .line 34
    .line 35
    new-instance v0, Landroid/graphics/PointF;

    .line 36
    .line 37
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mCurPoint:Landroid/graphics/PointF;

    .line 41
    .line 42
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->isUp:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mCurPoint:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mIsPeek:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mSecondaryDisallowPause:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->isUp:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic f(Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->pauseChangeReason:I

    .line 2
    .line 3
    return-void
.end method

.method private setSecondaryDisallowPause(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "MotionPauseDetectorInfo setSecondaryDisallowPause: "

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
    const-string v1, "-"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mSecondaryDisallowPause:Z

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "MotionPauseDetector"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iput-boolean p1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mSecondaryDisallowPause:Z

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public getCurPoint()Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mCurPoint:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPauseChangeReason()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->pauseChangeReason:I

    .line 2
    .line 3
    return p0
.end method

.method public getShelfPeekState()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mIsPeek:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isDirectionUp()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->isUp:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPassedRecentSlop()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mPassedRecentSlop:Z

    .line 2
    .line 3
    return p0
.end method

.method public setLastKneePoint(FF)V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mLastKneePoint:Landroid/graphics/PointF;

    .line 7
    .line 8
    return-void
.end method

.method public setPassedRecentSlop(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mPassedRecentSlop:Z

    .line 2
    .line 3
    return-void
.end method

.method public setShelfPeekState(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mIsPeek:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ne v0, p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mCurPoint:Landroid/graphics/PointF;

    .line 13
    .line 14
    iget v1, v0, Landroid/graphics/PointF;->x:F

    .line 15
    .line 16
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 17
    .line 18
    invoke-virtual {p0, v1, v0}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->setLastKneePoint(FF)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mIsPeek:Ljava/lang/Boolean;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v1, "MotionPauseDetectorInfo setPeekState: "

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p1, " mLastKneePoint: "

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mLastKneePoint:Landroid/graphics/PointF;

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "MotionPauseDetector"

    .line 55
    .line 56
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, " pauseChangeReason ["

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->pauseChangeReason:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "] isUp ["

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->isUp:Z

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, "] mLastKneePoint ["

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mLastKneePoint:Landroid/graphics/PointF;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, "] mSecondaryDisallowPause [ "

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-boolean v1, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mSecondaryDisallowPause:Z

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, "] mCurPoint ["

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->mCurPoint:Landroid/graphics/PointF;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p0, "]"

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method
