.class public Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;
.super Ljava/lang/Object;
.source "Counter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private daemonFlag:Ljava/lang/Boolean;

.field private exceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private namingPattern:Ljava/lang/String;

.field private priority:Ljava/lang/Integer;

.field private wrappedFactory:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$000(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)Ljava/util/concurrent/ThreadFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->wrappedFactory:Ljava/util/concurrent/ThreadFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$100(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->namingPattern:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->priority:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->daemonFlag:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;)Ljava/lang/Thread$UncaughtExceptionHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->exceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public build()Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;
    .locals 2

    .line 1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$1;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->reset()V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public daemon(Z)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->daemonFlag:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public namingPattern(Ljava/lang/String;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->namingPattern:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 7
    .line 8
    const-string p1, "Naming pattern must not be null!"

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method

.method public priority(Ljava/lang/Integer;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->priority:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public reset()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->wrappedFactory:Ljava/util/concurrent/ThreadFactory;

    .line 3
    .line 4
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->exceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 5
    .line 6
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->namingPattern:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->priority:Ljava/lang/Integer;

    .line 9
    .line 10
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->daemonFlag:Ljava/lang/Boolean;

    .line 11
    .line 12
    return-void
.end method

.method public uncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->exceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 7
    .line 8
    const-string p1, "Uncaught exception handler must not be null!"

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method

.method public wrappedFactory(Ljava/util/concurrent/ThreadFactory;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->wrappedFactory:Ljava/util/concurrent/ThreadFactory;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 7
    .line 8
    const-string p1, "Wrapped ThreadFactory must not be null!"

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method
