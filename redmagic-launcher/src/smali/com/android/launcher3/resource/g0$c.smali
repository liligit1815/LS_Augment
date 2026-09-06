.class Lcom/android/launcher3/resource/g0$c;
.super Ljava/lang/Object;
.source "ResourceManagerProxy.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/resource/g0;->E1(Landroid/content/Context;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/ArrayList;

.field final synthetic h:Lcom/android/launcher3/resource/g0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/resource/g0;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/g0$c;->h:Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/resource/g0$c;->g:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/resource/g0$c;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/g0$c;->b(Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/g0$c;->h:Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/resource/g0;->Y1(Lcom/android/launcher3/resource/g0;Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    .line 1
    const-string p1, "onServiceConnected: uninstall "

    .line 2
    .line 3
    const-string v0, "R-Loader"

    .line 4
    .line 5
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/resource/g0$c;->h:Lcom/android/launcher3/resource/g0;

    .line 9
    .line 10
    new-instance v1, Landroid/os/Messenger;

    .line 11
    .line 12
    invoke-direct {v1, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v1}, Lcom/android/launcher3/resource/g0;->T1(Lcom/android/launcher3/resource/g0;Landroid/os/Messenger;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/resource/g0$c;->g:Ljava/util/ArrayList;

    .line 19
    .line 20
    new-instance v1, Lcom/android/launcher3/resource/h0;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/resource/h0;-><init>(Lcom/android/launcher3/resource/g0$c;Ljava/util/ArrayList;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Lcom/android/launcher3/resource/o0;->R(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/resource/g0$c;->h:Lcom/android/launcher3/resource/g0;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/android/launcher3/resource/g0;->Q1(Lcom/android/launcher3/resource/g0;)Landroid/os/IBinder$DeathRecipient;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-interface {p2, p0, p1}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    goto :goto_0

    .line 41
    :catch_1
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string p2, "onServiceConnected: e ="

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    goto :goto_2

    .line 68
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    const-string p2, "onServiceConnected: e = "

    .line 74
    .line 75
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    :goto_2
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    const-string p1, "R-Loader"

    .line 2
    .line 3
    const-string v0, "onServiceDisconnected: uninstall "

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/resource/g0$c;->h:Lcom/android/launcher3/resource/g0;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-static {p0, p1}, Lcom/android/launcher3/resource/g0;->T1(Lcom/android/launcher3/resource/g0;Landroid/os/Messenger;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
