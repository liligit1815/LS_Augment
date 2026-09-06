.class Lcom/android/launcher3/resource/r0$b;
.super Ljava/lang/Object;
.source "SysInterfaceAdapter.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/r0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/resource/r0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/resource/r0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/r0$b;->g:Lcom/android/launcher3/resource/r0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    .line 1
    const-string p1, "R-Loader_SYS"

    .line 2
    .line 3
    const-string v0, "onServiceConnected() called"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/resource/r0$b;->g:Lcom/android/launcher3/resource/r0;

    .line 9
    .line 10
    invoke-static {p2}, LZ3/a$a;->o2(Landroid/os/IBinder;)LZ3/a;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {p1, p2}, Lcom/android/launcher3/resource/r0;->e(Lcom/android/launcher3/resource/r0;LZ3/a;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/resource/r0$b;->g:Lcom/android/launcher3/resource/r0;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/android/launcher3/resource/r0;->c(Lcom/android/launcher3/resource/r0;)Lcom/android/launcher3/resource/r0$c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/resource/r0$b;->g:Lcom/android/launcher3/resource/r0;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/android/launcher3/resource/r0;->c(Lcom/android/launcher3/resource/r0;)Lcom/android/launcher3/resource/r0$c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1}, Lcom/android/launcher3/resource/r0$c;->b()V

    .line 32
    .line 33
    .line 34
    :cond_0
    :try_start_0
    iget-object p1, p0, Lcom/android/launcher3/resource/r0$b;->g:Lcom/android/launcher3/resource/r0;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/android/launcher3/resource/r0;->d(Lcom/android/launcher3/resource/r0;)LZ3/a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p1}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p0, p0, Lcom/android/launcher3/resource/r0$b;->g:Lcom/android/launcher3/resource/r0;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/android/launcher3/resource/r0;->b(Lcom/android/launcher3/resource/r0;)Landroid/os/IBinder$DeathRecipient;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const/4 p2, 0x0

    .line 51
    invoke-interface {p1, p0, p2}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :catch_0
    move-exception p0

    .line 56
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    const-string p1, "R-Loader_SYS"

    .line 2
    .line 3
    const-string v0, "onServiceDisconnected() called"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/resource/r0$b;->g:Lcom/android/launcher3/resource/r0;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/android/launcher3/resource/r0;->c(Lcom/android/launcher3/resource/r0;)Lcom/android/launcher3/resource/r0$c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/resource/r0$b;->g:Lcom/android/launcher3/resource/r0;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/android/launcher3/resource/r0;->c(Lcom/android/launcher3/resource/r0;)Lcom/android/launcher3/resource/r0$c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/android/launcher3/resource/r0$c;->a()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
