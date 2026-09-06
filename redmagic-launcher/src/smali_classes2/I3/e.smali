.class public LI3/e;
.super Ljava/lang/Object;

# interfaces
.implements LI3/c;


# instance fields
.field private final a:Z

.field private b:Landroid/os/Vibrator;

.field private c:Landroid/content/Context;

.field d:Landroid/os/HapticPlayer;

.field private e:Landroid/os/Handler;

.field private f:Landroid/os/HandlerThread;

.field private g:LI3/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, LI3/e;->a:Z

    .line 6
    .line 7
    new-instance v0, LI3/a;

    .line 8
    .line 9
    invoke-direct {v0}, LI3/a;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, LI3/e;->g:LI3/a;

    .line 13
    .line 14
    const-string v0, "TencentPlayer"

    .line 15
    .line 16
    const-string v1, "TencentPlayer initialized!"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, LI3/e;->c:Landroid/content/Context;

    .line 22
    .line 23
    const-string v0, "vibrator"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Landroid/os/Vibrator;

    .line 30
    .line 31
    iput-object p1, p0, LI3/e;->b:Landroid/os/Vibrator;

    .line 32
    .line 33
    return-void
.end method

.method public static c()Z
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Landroid/os/HapticPlayer;->isAvailable()Z

    .line 2
    .line 3
    .line 4
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    return v0
.end method

.method private d()V
    .locals 1

    .line 1
    iget-object v0, p0, LI3/e;->f:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, LI3/e;->f:Landroid/os/HandlerThread;

    .line 10
    .line 11
    iput-object v0, p0, LI3/e;->e:Landroid/os/Handler;

    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, LI3/e;->g:LI3/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LI3/a;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LI3/e;->d:Landroid/os/HapticPlayer;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string p0, "TencentPlayer"

    .line 11
    .line 12
    const-string v0, "HapticsPlayer is null"

    .line 13
    .line 14
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-direct {p0}, LI3/e;->d()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, LI3/e;->d:Landroid/os/HapticPlayer;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/os/HapticPlayer;->stop()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    const-string v0, "TencentPlayer"

    .line 2
    .line 3
    const-string v1, "TencentPlayer releaseed!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LI3/e;->g:LI3/a;

    .line 9
    .line 10
    invoke-virtual {v0}, LI3/a;->a()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, LI3/e;->d()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, LI3/e;->d:Landroid/os/HapticPlayer;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/os/HapticPlayer;->stop()V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, LI3/e;->d:Landroid/os/HapticPlayer;

    .line 25
    .line 26
    return-void
.end method
