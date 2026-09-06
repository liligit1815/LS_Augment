.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
.super Ljava/lang/Object;
.source "Counter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;,
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$RepeatMode;
    }
.end annotation


# static fields
.field public static final INFINITE:I = -0x1

.field public static final RESTART:I = 0x1

.field public static final REVERSE:I = 0x2


# instance fields
.field private delayedStart:J

.field private delayedStop:J

.field private duration:J

.field private from:F

.field private interpolator:Landroid/view/animation/Interpolator;

.field private volatile isRunning:Z

.field private onCounterEventListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;

.field private postToMainThread:Z

.field private rate:J

.field private repeateMode:I

.field private to:F

.field private zteTimer:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;


# direct methods
.method public constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->isRunning:Z

    .line 6
    .line 7
    const-wide/16 v0, 0x5

    .line 8
    .line 9
    iput-wide v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->rate:J

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->repeateMode:I

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->postToMainThread:Z

    .line 16
    .line 17
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->onCounterEventListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;

    .line 18
    .line 19
    return-void
.end method

.method static synthetic access$000(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->isRunning:Z

    .line 2
    .line 3
    return p0
.end method

.method static synthetic access$100(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)F
    .locals 0

    .line 1
    iget p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->from:F

    .line 2
    .line 3
    return p0
.end method

.method static synthetic access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;FZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->onCounterValueChanged(FZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->repeateMode:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->duration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method static synthetic access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->delayedStop:J

    .line 2
    .line 3
    return-wide v0
.end method

.method static synthetic access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)F
    .locals 0

    .line 1
    iget p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->to:F

    .line 2
    .line 3
    return p0
.end method

.method static synthetic access$700(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;F)F
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->trim(F)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static synthetic access$800(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->onCounterEventListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private onCounterValueChanged(FZ)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->isRunning:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->postToMainThread:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->getInstance()Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mainThread()Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$2;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$2;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;FZ)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->onCounterEventListener:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;

    .line 28
    .line 29
    invoke-interface {p0, p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;->onCounterValueChanged(FZ)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private trim(F)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->interpolator:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->isRunning:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->zteTimer:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->cancel()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public getFrom()F
    .locals 0

    .line 1
    iget p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->from:F

    .line 2
    .line 3
    return p0
.end method

.method public getTo()F
    .locals 0

    .line 1
    iget p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->to:F

    .line 2
    .line 3
    return p0
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->isRunning:Z

    .line 2
    .line 3
    return p0
.end method

.method public varargs ofFloat([F)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v0, p1, v0

    .line 3
    .line 4
    iput v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->from:F

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    aget p1, p1, v0

    .line 8
    .line 9
    iput p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->to:F

    .line 10
    .line 11
    return-object p0
.end method

.method public postToMainThread(Z)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->postToMainThread:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setDelayedStart(J)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->delayedStart:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setDelayedStop(J)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->delayedStop:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setDuration(J)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->duration:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setForever(I)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
    .locals 0

    .line 1
    iput p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->repeateMode:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->interpolator:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public setRate(J)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->rate:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setRepeateMode(I)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
    .locals 0

    .line 1
    iput p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->repeateMode:I

    .line 2
    .line 3
    return-object p0
.end method

.method public start()Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->isRunning:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->isRunning:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->interpolator:Landroid/view/animation/Interpolator;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->interpolator:Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->zteTimer:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;

    .line 24
    .line 25
    invoke-direct {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->zteTimer:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->zteTimer:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;

    .line 31
    .line 32
    new-instance v2, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)V

    .line 35
    .line 36
    .line 37
    iget-wide v3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->delayedStart:J

    .line 38
    .line 39
    iget-wide v5, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->rate:J

    .line 40
    .line 41
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 42
    .line 43
    invoke-virtual/range {v1 .. v7}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/Future;

    .line 44
    .line 45
    .line 46
    :cond_2
    return-object p0
.end method
