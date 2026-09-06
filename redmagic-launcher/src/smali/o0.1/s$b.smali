.class public final Lo0/s$b;
.super Ljava/lang/Object;
.source "ExtensionEmbeddingBackend.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lo0/s$b;-><init>()V

    return-void
.end method

.method private final b(Landroid/content/Context;)Lo0/q;
    .locals 6

    .line 1
    const-string v0, "EmbeddingBackend"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    sget-object v2, Ln0/f;->a:Ln0/f;

    .line 5
    .line 6
    invoke-virtual {v2}, Ln0/f;->a()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {p0, v2}, Lo0/s$b;->c(Ljava/lang/Integer;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    sget-object p0, Lo0/o;->g:Lo0/o$a;

    .line 21
    .line 22
    invoke-virtual {p0}, Lo0/o$a;->e()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    const-class v2, Lo0/l;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    new-instance v3, Lo0/o;

    .line 37
    .line 38
    invoke-virtual {p0}, Lo0/o$a;->b()Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance v4, Lo0/i;

    .line 43
    .line 44
    new-instance v5, Ln0/i;

    .line 45
    .line 46
    invoke-direct {v5, v2}, Ln0/i;-><init>(Ljava/lang/ClassLoader;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {v4, v5}, Lo0/i;-><init>(Ln0/i;)V

    .line 50
    .line 51
    .line 52
    new-instance v5, Ln0/e;

    .line 53
    .line 54
    invoke-direct {v5, v2}, Ln0/e;-><init>(Ljava/lang/ClassLoader;)V

    .line 55
    .line 56
    .line 57
    invoke-direct {v3, p0, v4, v5, p1}, Lo0/o;-><init>(Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;Lo0/i;Ln0/e;Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .line 59
    .line 60
    move-object v1, v3

    .line 61
    goto :goto_0

    .line 62
    :catchall_0
    move-exception p0

    .line 63
    new-instance p1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string v2, "Failed to load embedding extension: "

    .line 69
    .line 70
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    .line 84
    .line 85
    const-string p0, "No supported embedding extension found"

    .line 86
    .line 87
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    :cond_1
    return-object v1
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Lo0/l;
    .locals 2

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lo0/s;->e()Lo0/s;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lo0/s;->f()Ljava/util/concurrent/locks/ReentrantLock;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 17
    .line 18
    .line 19
    :try_start_0
    invoke-static {}, Lo0/s;->e()Lo0/s;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object v0, Lo0/s;->h:Lo0/s$b;

    .line 30
    .line 31
    const-string v1, "applicationContext"

    .line 32
    .line 33
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v0, p1}, Lo0/s$b;->b(Landroid/content/Context;)Lo0/q;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Lo0/s;

    .line 41
    .line 42
    invoke-direct {v1, p1, v0}, Lo0/s;-><init>(Landroid/content/Context;Lo0/q;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Lo0/s;->g(Lo0/s;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception p1

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    :goto_0
    sget-object p1, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 54
    .line 55
    .line 56
    goto :goto_2

    .line 57
    :goto_1
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 58
    .line 59
    .line 60
    throw p1

    .line 61
    :cond_1
    :goto_2
    invoke-static {}, Lo0/s;->e()Lo0/s;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    return-object p0
.end method

.method public final c(Ljava/lang/Integer;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x1

    .line 10
    if-lt p1, v0, :cond_1

    .line 11
    .line 12
    return v0

    .line 13
    :cond_1
    return p0
.end method
