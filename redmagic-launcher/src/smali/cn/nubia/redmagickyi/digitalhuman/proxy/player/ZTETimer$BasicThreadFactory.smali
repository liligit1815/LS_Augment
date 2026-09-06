.class public Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;
.super Ljava/lang/Object;
.source "Counter.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BasicThreadFactory"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;
    }
.end annotation


# instance fields
.field private final daemonFlag:Ljava/lang/Boolean;

.field private final namingPattern:Ljava/lang/String;

.field private final priority:Ljava/lang/Integer;

.field private final threadCounter:Ljava/util/concurrent/atomic/AtomicLong;

.field private final uncaughtExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private final wrappedFactory:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method private constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->access$000(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    if-nez v0, :cond_0

    .line 4
    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->wrappedFactory:Ljava/util/concurrent/ThreadFactory;

    goto :goto_0

    .line 5
    :cond_0
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->access$000(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->wrappedFactory:Ljava/util/concurrent/ThreadFactory;

    .line 6
    :goto_0
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->access$100(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->namingPattern:Ljava/lang/String;

    .line 7
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->priority:Ljava/lang/Integer;

    .line 8
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->daemonFlag:Ljava/lang/Boolean;

    .line 9
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object p1

    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->uncaughtExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 10
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->threadCounter:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method synthetic constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)V

    return-void
.end method

.method private initializeThread(Ljava/lang/Thread;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->getNamingPattern()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->threadCounter:Ljava/util/concurrent/atomic/AtomicLong;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->getNamingPattern()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->getUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->getUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Ljava/lang/Thread;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->getPriority()Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/16 v2, 0xa

    .line 56
    .line 57
    if-le v1, v2, :cond_2

    .line 58
    .line 59
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    const/4 v2, 0x1

    .line 69
    if-ge v1, v2, :cond_3

    .line 70
    .line 71
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    :cond_3
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-virtual {p1, v0}, Ljava/lang/Thread;->setPriority(I)V

    .line 80
    .line 81
    .line 82
    :cond_4
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->getDaemonFlag()Ljava/lang/Boolean;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->getDaemonFlag()Ljava/lang/Boolean;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {p1, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 97
    .line 98
    .line 99
    :cond_5
    return-void
.end method


# virtual methods
.method public final getDaemonFlag()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->daemonFlag:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getNamingPattern()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->namingPattern:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getPriority()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->priority:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThreadCount()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->threadCounter:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final getUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->uncaughtExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getWrappedFactory()Ljava/util/concurrent/ThreadFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->wrappedFactory:Ljava/util/concurrent/ThreadFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->getWrappedFactory()Ljava/util/concurrent/ThreadFactory;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p1}, Ljava/util/concurrent/ThreadFactory;->newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;->initializeThread(Ljava/lang/Thread;)V

    .line 10
    .line 11
    .line 12
    return-object p1
.end method
