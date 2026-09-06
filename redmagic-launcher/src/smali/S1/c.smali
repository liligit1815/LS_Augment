.class public LS1/c;
.super Ljava/lang/Object;
.source "ZteThemeManager.java"

# interfaces
.implements LS1/a;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Z

.field private c:LO3/a;

.field private d:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, LS1/c;->b:Z

    .line 6
    .line 7
    new-instance v0, LS1/c$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, LS1/c$a;-><init>(LS1/c;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, LS1/c;->d:Landroid/content/ServiceConnection;

    .line 13
    .line 14
    iput-object p1, p0, LS1/c;->a:Landroid/content/Context;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic b(LS1/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LS1/c;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(LS1/c;LO3/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, LS1/c;->c:LO3/a;

    .line 2
    .line 3
    return-void
.end method

.method private d()Z
    .locals 5

    .line 1
    const-string v0, "bindService"

    .line 2
    .line 3
    const-string v1, "ZteThemeManager"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/content/Intent;

    .line 9
    .line 10
    const-class v2, LO3/a;

    .line 11
    .line 12
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v2, "com.zte.beautifyadapter"

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string v2, "com.zte.beautifyadapter.intent.action.THEME_APPLY_SERVICE"

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, LS1/c;->a:Landroid/content/Context;

    .line 30
    .line 31
    iget-object v3, p0, LS1/c;->d:Landroid/content/ServiceConnection;

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    invoke-virtual {v2, v0, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput-boolean v0, p0, LS1/c;->b:Z

    .line 39
    .line 40
    new-instance p0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v2, "bindService result: "

    .line 46
    .line 47
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    return v0
.end method

.method private synthetic f()V
    .locals 2

    .line 1
    iget-object v0, p0, LS1/c;->c:LO3/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->z()Z

    .line 10
    .line 11
    .line 12
    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    const-string v1, "ZteThemeManager"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    :try_start_1
    const-string v0, "changeTheme: swithToStreamerMode"

    .line 18
    .line 19
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, LS1/c;->c:LO3/a;

    .line 23
    .line 24
    invoke-interface {p0}, LO3/a;->d0()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const-string v0, "changeTheme: exitStreamerMode"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, LS1/c;->c:LO3/a;

    .line 34
    .line 35
    invoke-interface {p0}, LO3/a;->L1()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-virtual {p0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    invoke-direct {p0}, LS1/c;->d()Z

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-boolean v0, p0, LS1/c;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LS1/c;->a:Landroid/content/Context;

    .line 6
    .line 7
    iget-object v1, p0, LS1/c;->d:Landroid/content/ServiceConnection;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, LS1/c;->b:Z

    .line 14
    .line 15
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, LS1/b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, LS1/b;-><init>(LS1/c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
