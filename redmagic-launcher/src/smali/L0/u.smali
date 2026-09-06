.class public final LL0/u;
.super Ljava/lang/Object;
.source "ViewCaptureFactory.kt"


# static fields
.field public static final a:LL0/u;

.field private static final b:Ljava/lang/String;

.field private static final c:Lh4/e;

.field private static d:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LL0/u;

    .line 2
    .line 3
    invoke-direct {v0}, LL0/u;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LL0/u;->a:LL0/u;

    .line 7
    .line 8
    const-class v0, LL0/u;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, LL0/u;->b:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v0, LL0/t;

    .line 17
    .line 18
    invoke-direct {v0}, LL0/t;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, LL0/u;->c:Lh4/e;

    .line 26
    .line 27
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()LL0/n;
    .locals 1

    .line 1
    invoke-static {}, LL0/u;->e()LL0/n;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private final b()LL0/n;
    .locals 7

    .line 1
    sget-boolean p0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    .line 2
    .line 3
    const-string v0, "instantiating "

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, LL0/u;->b:Ljava/lang/String;

    .line 8
    .line 9
    const-class v1, LL0/b;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    new-instance p0, LL0/b;

    .line 34
    .line 35
    invoke-direct {p0}, LL0/b;-><init>()V

    .line 36
    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_0
    invoke-static {}, Landroid/tracing/Flags;->perfettoViewCaptureTracing()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    const-string v1, "createAndStartNewLooperExecutor(...)"

    .line 44
    .line 45
    const/4 v2, -0x2

    .line 46
    const/4 v3, 0x0

    .line 47
    const-string v4, "appContext"

    .line 48
    .line 49
    if-nez p0, :cond_2

    .line 50
    .line 51
    sget-object p0, LL0/u;->b:Ljava/lang/String;

    .line 52
    .line 53
    const-class v5, LL0/d;

    .line 54
    .line 55
    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    new-instance v6, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    new-instance p0, LL0/d;

    .line 78
    .line 79
    sget-object v0, LL0/u;->d:Landroid/content/Context;

    .line 80
    .line 81
    if-nez v0, :cond_1

    .line 82
    .line 83
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    move-object v3, v0

    .line 88
    :goto_0
    const-string v0, "SAViewCapture"

    .line 89
    .line 90
    invoke-static {v0, v2}, LL0/n;->h(Ljava/lang/String;I)LL0/a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-direct {p0, v3, v0}, LL0/d;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;)V

    .line 98
    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_2
    sget-object p0, LL0/u;->b:Ljava/lang/String;

    .line 102
    .line 103
    const-class v5, LL0/c;

    .line 104
    .line 105
    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    new-instance v6, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    new-instance p0, LL0/c;

    .line 128
    .line 129
    sget-object v0, LL0/u;->d:Landroid/content/Context;

    .line 130
    .line 131
    if-nez v0, :cond_3

    .line 132
    .line 133
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_3
    move-object v3, v0

    .line 138
    :goto_1
    const-string v0, "PerfettoViewCapture"

    .line 139
    .line 140
    invoke-static {v0, v2}, LL0/n;->h(Ljava/lang/String;I)LL0/a;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-direct {p0, v3, v0}, LL0/c;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;)V

    .line 148
    .line 149
    .line 150
    return-object p0
.end method

.method private final c()LL0/n;
    .locals 0

    .line 1
    sget-object p0, LL0/u;->c:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LL0/n;

    .line 8
    .line 9
    return-object p0
.end method

.method public static final d(Landroid/content/Context;)LL0/n;
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, LL0/u;->d:Landroid/content/Context;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget-object v0, LL0/u;->a:LL0/u;

    .line 11
    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sput-object p0, LL0/u;->d:Landroid/content/Context;

    .line 18
    .line 19
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    monitor-exit v0

    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    monitor-exit v0

    .line 25
    throw p0

    .line 26
    :cond_0
    :goto_0
    sget-object p0, LL0/u;->a:LL0/u;

    .line 27
    .line 28
    invoke-direct {p0}, LL0/u;->c()LL0/n;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method private static final e()LL0/n;
    .locals 1

    .line 1
    sget-object v0, LL0/u;->a:LL0/u;

    .line 2
    .line 3
    invoke-direct {v0}, LL0/u;->b()LL0/n;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method
