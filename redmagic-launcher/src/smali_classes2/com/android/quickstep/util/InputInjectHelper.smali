.class public Lcom/android/quickstep/util/InputInjectHelper;
.super Ljava/lang/Object;
.source "InputInjectHelper.java"


# static fields
.field private static final SWIPE_TIMEOUT_WITHOUT_MOVE_MS:J = 0x258L

.field private static final TAG:Ljava/lang/String; = "InputInjectHelper"

.field private static volatile instance:Lcom/android/quickstep/util/InputInjectHelper;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mDownEvent:Landroid/view/MotionEvent;

.field private final mHandler:Landroid/os/Handler;

.field private mHasInjectedDown:Z

.field private mHasInjectedDownAndUp:Z

.field private mHasInjectedUp:Z

.field private mHasRestAll:Z

.field private mLandscape:Z

.field private mNotInjectLeftRegionLeftX:F

.field private mNotInjectLeftRegionRightX:F

.field private mNotInjectRightRegionLeftX:F

.field private mNotInjectRightRegionRightX:F

.field private final mSwipeTimeoutMS:J

.field private final mTimeoutRunnable:Ljava/lang/Runnable;

.field private mUpEvent:Landroid/view/MotionEvent;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mContext:Landroid/content/Context;

    .line 5
    .line 6
    const-wide/16 v0, 0x258

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mSwipeTimeoutMS:J

    .line 9
    .line 10
    new-instance p1, Landroid/os/Handler;

    .line 11
    .line 12
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHandler:Landroid/os/Handler;

    .line 20
    .line 21
    new-instance p1, Lcom/android/quickstep/util/InputInjectHelper$1;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Lcom/android/quickstep/util/InputInjectHelper$1;-><init>(Lcom/android/quickstep/util/InputInjectHelper;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mTimeoutRunnable:Ljava/lang/Runnable;

    .line 27
    .line 28
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/InputInjectHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDown:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/InputInjectHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedUp:Z

    .line 2
    .line 3
    return p0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/util/InputInjectHelper;->instance:Lcom/android/quickstep/util/InputInjectHelper;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/android/quickstep/util/InputInjectHelper;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/android/quickstep/util/InputInjectHelper;->instance:Lcom/android/quickstep/util/InputInjectHelper;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/android/quickstep/util/InputInjectHelper;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/InputInjectHelper;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/android/quickstep/util/InputInjectHelper;->instance:Lcom/android/quickstep/util/InputInjectHelper;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Lcom/android/quickstep/util/InputInjectHelper;->instance:Lcom/android/quickstep/util/InputInjectHelper;

    .line 27
    .line 28
    return-object p0
.end method


# virtual methods
.method public addMotionEvent(Landroid/view/MotionEvent;Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mLandscape:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasRestAll:Z

    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHandler:Landroid/os/Handler;

    .line 32
    .line 33
    if-eqz p1, :cond_7

    .line 34
    .line 35
    iget-object p2, p0, Lcom/android/quickstep/util/InputInjectHelper;->mTimeoutRunnable:Ljava/lang/Runnable;

    .line 36
    .line 37
    iget-wide v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mSwipeTimeoutMS:J

    .line 38
    .line 39
    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    const/4 v1, 0x1

    .line 44
    if-ne v0, v1, :cond_3

    .line 45
    .line 46
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 51
    .line 52
    return-void

    .line 53
    :cond_3
    const/4 p1, 0x3

    .line 54
    if-ne v0, p1, :cond_6

    .line 55
    .line 56
    if-nez p2, :cond_4

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownAndUpEvent()V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-boolean p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDown:Z

    .line 62
    .line 63
    if-eqz p1, :cond_5

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->resetDown()V

    .line 66
    .line 67
    .line 68
    :cond_5
    iget-boolean p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedUp:Z

    .line 69
    .line 70
    if-eqz p1, :cond_7

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->resetUp()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->resetAll()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_6
    const/4 p1, 0x2

    .line 80
    if-ne v0, p1, :cond_7

    .line 81
    .line 82
    if-eqz p2, :cond_7

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->resetAll()V

    .line 85
    .line 86
    .line 87
    :cond_7
    :goto_0
    return-void
.end method

.method public getLandscape()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mLandscape:Z

    .line 2
    .line 3
    return p0
.end method

.method public hasInjectedDown()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDown:Z

    .line 2
    .line 3
    return p0
.end method

.method public ifTouchEventInject(F)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mNotInjectLeftRegionRightX:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mNotInjectRightRegionLeftX:F

    .line 8
    .line 9
    cmpg-float p0, p1, p0

    .line 10
    .line 11
    if-gtz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public injectDownAndUpEvent()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mLandscape:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "injectDownAndUpEvent mHasInjectedDownAndUp: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDownAndUp:Z

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "InputInjectHelper"

    .line 26
    .line 27
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDownAndUp:Z

    .line 31
    .line 32
    if-nez v0, :cond_4

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 35
    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getX()F

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/InputInjectHelper;->ifTouchEventInject(F)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mContext:Landroid/content/Context;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 52
    .line 53
    iget-object v2, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 54
    .line 55
    invoke-static {v0, v1, v2}, Lcom/android/quickstep/util/InputInjectUtils;->notifyInjectEvent(Landroid/content/Context;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 59
    .line 60
    const/4 v1, 0x1

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iput-boolean v1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDown:Z

    .line 64
    .line 65
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 66
    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    iput-boolean v1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedUp:Z

    .line 70
    .line 71
    :cond_3
    iput-boolean v1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDownAndUp:Z

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->resetAll()V

    .line 74
    .line 75
    .line 76
    :cond_4
    :goto_0
    return-void
.end method

.method public injectDownImmediately(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mLandscape:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 15
    .line 16
    :cond_1
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasRestAll:Z

    .line 24
    .line 25
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v0, "injectDownImmediately: "

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDown:Z

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v0, " , "

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string v0, "InputInjectHelper"

    .line 55
    .line 56
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    iget-boolean p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDown:Z

    .line 60
    .line 61
    if-nez p1, :cond_3

    .line 62
    .line 63
    iget-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 64
    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/InputInjectHelper;->ifTouchEventInject(F)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_2

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mContext:Landroid/content/Context;

    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 81
    .line 82
    invoke-static {p1, v0, v1}, Lcom/android/quickstep/util/InputInjectUtils;->notifyInjectEvent(Landroid/content/Context;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->resetDown()V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_3
    :goto_0
    const-string p0, "injectDownImmediately: return"

    .line 90
    .line 91
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public injectUpImmediatelyOrNot(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mLandscape:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 11
    .line 12
    new-instance p1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v0, "injectUpImmediatelyOrNot: "

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDown:Z

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, " , "

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedUp:Z

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v0, "InputInjectHelper"

    .line 42
    .line 43
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    iget-boolean p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDown:Z

    .line 47
    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    iget-boolean p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedUp:Z

    .line 51
    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mContext:Landroid/content/Context;

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    iget-object v1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 59
    .line 60
    invoke-static {p1, v0, v1}, Lcom/android/quickstep/util/InputInjectUtils;->notifyInjectEvent(Landroid/content/Context;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->resetUp()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->resetAll()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    :goto_0
    const-string p0, "injectUpImmediatelyOrNot: return"

    .line 71
    .line 72
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final resetAll()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasRestAll:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    const-string v0, "InputInjectHelper"

    .line 6
    .line 7
    const-string v1, "resetAll"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasRestAll:Z

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 33
    .line 34
    :cond_1
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDownAndUp:Z

    .line 36
    .line 37
    iput-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDown:Z

    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedUp:Z

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHandler:Landroid/os/Handler;

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    iget-object v1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mTimeoutRunnable:Ljava/lang/Runnable;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasCallbacks(Ljava/lang/Runnable;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHandler:Landroid/os/Handler;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mTimeoutRunnable:Ljava/lang/Runnable;

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    :goto_0
    return-void
.end method

.method public final resetDown()V
    .locals 2

    .line 1
    const-string v0, "InputInjectHelper"

    .line 2
    .line 3
    const-string v1, "resetDown"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mDownEvent:Landroid/view/MotionEvent;

    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedDown:Z

    .line 20
    .line 21
    return-void
.end method

.method public final resetUp()V
    .locals 2

    .line 1
    const-string v0, "InputInjectHelper"

    .line 2
    .line 3
    const-string v1, "resetUp"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mUpEvent:Landroid/view/MotionEvent;

    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/android/quickstep/util/InputInjectHelper;->mHasInjectedUp:Z

    .line 20
    .line 21
    return-void
.end method

.method public setLandscape(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setLandscape: "

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "InputInjectHelper"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-boolean p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mLandscape:Z

    .line 24
    .line 25
    return-void
.end method

.method public setNotInjectRegion(FFFF)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/InputInjectHelper;->mNotInjectLeftRegionLeftX:F

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/util/InputInjectHelper;->mNotInjectLeftRegionRightX:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/quickstep/util/InputInjectHelper;->mNotInjectRightRegionLeftX:F

    .line 6
    .line 7
    iput p4, p0, Lcom/android/quickstep/util/InputInjectHelper;->mNotInjectRightRegionRightX:F

    .line 8
    .line 9
    return-void
.end method
