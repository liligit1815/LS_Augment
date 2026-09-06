.class public Lcom/android/launcher3/util/m0;
.super Ljava/lang/Object;
.source "Executors.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/m0$a;
    }
.end annotation


# static fields
.field private static final a:I

.field private static final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/util/p1;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Ljava/util/concurrent/ThreadPoolExecutor;

.field public static final d:Lcom/android/launcher3/util/p1;

.field public static final e:Lcom/android/launcher3/util/p1;

.field public static final f:Lcom/android/launcher3/util/p1;

.field public static final g:Ljava/util/concurrent/ExecutorService;

.field public static final h:Lcom/android/launcher3/util/p1;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    sput v3, Lcom/android/launcher3/util/m0;->a:I

    .line 15
    .line 16
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lcom/android/launcher3/util/m0;->b:Ljava/util/Map;

    .line 22
    .line 23
    new-instance v2, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 24
    .line 25
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 26
    .line 27
    new-instance v8, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 28
    .line 29
    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 30
    .line 31
    .line 32
    const-wide/16 v5, 0x1

    .line 33
    .line 34
    move v4, v3

    .line 35
    invoke-direct/range {v2 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 36
    .line 37
    .line 38
    sput-object v2, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 39
    .line 40
    new-instance v0, Lcom/android/launcher3/util/p1;

    .line 41
    .line 42
    const-string v1, "BackgroundExecutor"

    .line 43
    .line 44
    const/16 v2, 0xa

    .line 45
    .line 46
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/util/p1;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/android/launcher3/util/m0;->d:Lcom/android/launcher3/util/p1;

    .line 50
    .line 51
    new-instance v0, Lcom/android/launcher3/util/p1;

    .line 52
    .line 53
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const/4 v3, -0x2

    .line 58
    invoke-direct {v0, v1, v3}, Lcom/android/launcher3/util/p1;-><init>(Landroid/os/Looper;I)V

    .line 59
    .line 60
    .line 61
    sput-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 62
    .line 63
    new-instance v0, Lcom/android/launcher3/util/p1;

    .line 64
    .line 65
    const-string v1, "UiThreadHelper"

    .line 66
    .line 67
    invoke-direct {v0, v1, v3}, Lcom/android/launcher3/util/p1;-><init>(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    sput-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 71
    .line 72
    new-instance v0, Lcom/android/launcher3/util/m0$a;

    .line 73
    .line 74
    const-string v1, "preinflate-allapps-icons"

    .line 75
    .line 76
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/util/m0$a;-><init>(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sput-object v0, Lcom/android/launcher3/util/m0;->g:Ljava/util/concurrent/ExecutorService;

    .line 84
    .line 85
    new-instance v0, Lcom/android/launcher3/util/p1;

    .line 86
    .line 87
    const-string v1, "launcher-loader"

    .line 88
    .line 89
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/p1;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    sput-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 93
    .line 94
    return-void
.end method

.method public static a(Ljava/lang/String;)Lcom/android/launcher3/util/p1;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->b:Ljava/util/Map;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/k0;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/util/k0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, p0, v1}, Ljava/util/Map;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    return-object p0
.end method
