.class public LG3/a;
.super LH3/a;


# static fields
.field private static f:LG3/a;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field

.field private static final g:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private c:Landroid/os/Vibrator;

.field private d:Landroid/content/Context;

.field private e:LI3/c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, LG3/a;->g:Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    return-void
.end method

.method private constructor <init>()V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, LH3/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()LG3/a;
    .locals 2

    .line 1
    sget-object v0, LG3/a;->f:LG3/a;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, LG3/a;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, LG3/a;->f:LG3/a;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, LG3/a;

    .line 13
    .line 14
    invoke-direct {v1}, LG3/a;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, LG3/a;->f:LG3/a;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

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
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, LG3/a;->f:LG3/a;

    .line 27
    .line 28
    return-object v0
.end method

.method private b(Landroid/content/Context;)LI3/c;
    .locals 1

    .line 1
    iget-object p1, p0, LG3/a;->c:Landroid/os/Vibrator;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p0, "AACHapticUtils"

    .line 6
    .line 7
    const-string p1, "Please call the init method first"

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-static {}, LI3/d;->c()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    new-instance p1, LI3/d;

    .line 21
    .line 22
    iget-object v0, p0, LG3/a;->d:Landroid/content/Context;

    .line 23
    .line 24
    invoke-direct {p1, v0}, LI3/d;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iput-object p1, p0, LG3/a;->e:LI3/c;

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-static {}, LI3/e;->c()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    new-instance p1, LI3/e;

    .line 37
    .line 38
    iget-object v0, p0, LG3/a;->d:Landroid/content/Context;

    .line 39
    .line 40
    invoke-direct {p1, v0}, LI3/e;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    new-instance p1, LI3/b;

    .line 45
    .line 46
    iget-object v0, p0, LG3/a;->d:Landroid/content/Context;

    .line 47
    .line 48
    invoke-direct {p1, v0}, LI3/b;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :goto_1
    iget-object p0, p0, LG3/a;->e:LI3/c;

    .line 53
    .line 54
    return-object p0
.end method


# virtual methods
.method public c(Landroid/content/Context;)LG3/a;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "init ,version:"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    sget-object v1, LH3/a;->b:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " versionCode:"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    sget v1, LH3/a;->a:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "AACHapticUtils"

    .line 33
    .line 34
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    const-string v0, "vibrator"

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Landroid/os/Vibrator;

    .line 44
    .line 45
    iput-object v0, p0, LG3/a;->c:Landroid/os/Vibrator;

    .line 46
    .line 47
    iput-object p1, p0, LG3/a;->d:Landroid/content/Context;

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    invoke-virtual {p0, p1}, LG3/a;->f(Z)V

    .line 51
    .line 52
    .line 53
    sget-object p0, LG3/a;->f:LG3/a;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 57
    .line 58
    const-string p1, "context shouldn\'t be null"

    .line 59
    .line 60
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw p0
.end method

.method public d()Z
    .locals 1

    .line 1
    invoke-static {}, LI3/d;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-static {}, LI3/e;->c()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    return v0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, LG3/a;->c:Landroid/os/Vibrator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, LG3/a;->e:LI3/c;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-interface {v0}, LI3/c;->a()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, LG3/a;->e:LI3/c;

    .line 16
    .line 17
    invoke-interface {v0}, LI3/c;->b()V

    .line 18
    .line 19
    .line 20
    :cond_1
    const/4 v0, 0x0

    .line 21
    sput-object v0, LG3/a;->f:LG3/a;

    .line 22
    .line 23
    iput-object v0, p0, LG3/a;->d:Landroid/content/Context;

    .line 24
    .line 25
    return-void
.end method

.method public f(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    new-instance p1, LI3/b;

    .line 5
    .line 6
    iget-object v0, p0, LG3/a;->d:Landroid/content/Context;

    .line 7
    .line 8
    invoke-direct {p1, v0}, LI3/b;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    :goto_0
    iput-object p1, p0, LG3/a;->e:LI3/c;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, LG3/a;->d:Landroid/content/Context;

    .line 15
    .line 16
    invoke-direct {p0, p1}, LG3/a;->b(Landroid/content/Context;)LI3/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    goto :goto_0
.end method
