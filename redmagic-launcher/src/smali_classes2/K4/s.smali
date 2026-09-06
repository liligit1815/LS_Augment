.class public final LK4/s;
.super Ljava/lang/Object;
.source "MainDispatchers.kt"


# static fields
.field public static final a:LK4/s;

.field public static final b:LF4/E0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LK4/s;

    .line 2
    .line 3
    invoke-direct {v0}, LK4/s;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LK4/s;->a:LK4/s;

    .line 7
    .line 8
    const-string v1, "kotlinx.coroutines.fast.service.loader"

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-static {v1, v2}, LK4/E;->f(Ljava/lang/String;Z)Z

    .line 12
    .line 13
    .line 14
    invoke-direct {v0}, LK4/s;->a()LF4/E0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, LK4/s;->b:LF4/E0;

    .line 19
    .line 20
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

.method private final a()LF4/E0;
    .locals 6

    .line 1
    const-class p0, LK4/r;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-static {p0, v1}, Ljava/util/ServiceLoader;->load(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/ServiceLoader;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ServiceLoader;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, LC4/h;->c(Ljava/util/Iterator;)LC4/e;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, LC4/h;->n(LC4/e;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_0

    .line 33
    .line 34
    move-object v2, v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-nez v3, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move-object v3, v2

    .line 48
    check-cast v3, LK4/r;

    .line 49
    .line 50
    invoke-interface {v3}, LK4/r;->c()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    move-object v5, v4

    .line 59
    check-cast v5, LK4/r;

    .line 60
    .line 61
    invoke-interface {v5}, LK4/r;->c()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-ge v3, v5, :cond_3

    .line 66
    .line 67
    move-object v2, v4

    .line 68
    move v3, v5

    .line 69
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-nez v4, :cond_2

    .line 74
    .line 75
    :goto_0
    check-cast v2, LK4/r;

    .line 76
    .line 77
    if-eqz v2, :cond_5

    .line 78
    .line 79
    invoke-static {v2, p0}, LK4/t;->e(LK4/r;Ljava/util/List;)LF4/E0;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    if-nez p0, :cond_4

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_4
    return-object p0

    .line 87
    :catchall_0
    move-exception p0

    .line 88
    goto :goto_2

    .line 89
    :cond_5
    :goto_1
    const/4 p0, 0x3

    .line 90
    invoke-static {v0, v0, p0, v0}, LK4/t;->b(Ljava/lang/Throwable;Ljava/lang/String;ILjava/lang/Object;)LK4/u;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    .line 92
    .line 93
    return-object v0

    .line 94
    :goto_2
    const/4 v1, 0x2

    .line 95
    invoke-static {p0, v0, v1, v0}, LK4/t;->b(Ljava/lang/Throwable;Ljava/lang/String;ILjava/lang/Object;)LK4/u;

    .line 96
    .line 97
    .line 98
    return-object v0
.end method
